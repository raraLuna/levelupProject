<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Base64"%>
<%@ page import="java.util.Base64.Encoder"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.net.URL" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="org.json.simple.parser.ParseException" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.io.Reader" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
  String nowpage = request.getParameter("page");
  String paymentKey = request.getParameter("paymentKey");
  String cancelReason = request.getParameter("cancelReason");

  //refundReceiveAccount - 가상계좌 거래에 대해 입금후에 취소하는 경우만 필요
  String bank = "신한";
  String accountNumber = "12345678901234";
  String holderName = "홍길동";

  //중복 취소를 막기위해 취소 가능금액을 전송
  String refundableAmount = null;
  
  //김지혁 테스트 시크릿키
  String secretKey = "test_sk_DpexMgkW36ZnqQN19dEN3GbR5ozO:";
  
  //김화범 테스트 시크릿키
  //String secretKey2 = "test_sk_DpexMgkW36xJ0M0ooAXMrGbR5ozO:";
  
  //최유미 테스트 시크릿키
 //String secretKey = "test_sk_24xLea5zVAmdw7OMPDZxVQAMYNwW:";
  
  Encoder encoder = Base64.getEncoder(); 
  byte[] encodedBytes = encoder.encode(secretKey.getBytes("UTF-8"));
  String authorizations = "Basic "+ new String(encodedBytes, 0, encodedBytes.length);
  
  URL url = new URL("https://api.tosspayments.com/v1/payments/" + paymentKey + "/cancel");
  
  HttpURLConnection connection = (HttpURLConnection) url.openConnection();
  connection.setRequestProperty("Authorization", authorizations);
  connection.setRequestProperty("Content-Type", "application/json");
  connection.setRequestMethod("POST");
  connection.setDoOutput(true);

  JSONObject obj = new JSONObject();
  obj.put("cancelReason", cancelReason);

  JSONObject refundReceiveAccount = new JSONObject();
  refundReceiveAccount.put("bank", bank);
  refundReceiveAccount.put("accountNumber", accountNumber);
  refundReceiveAccount.put("holderName", holderName);

  obj.put("refundReceiveAccount", refundReceiveAccount);
  obj.put("refundableAmount", refundableAmount);
  
    
  OutputStream outputStream = connection.getOutputStream();
  outputStream.write(obj.toString().getBytes("UTF-8"));
  
  int code = connection.getResponseCode();
  boolean isSuccess = code == 200 ? true : false;
  
  InputStream responseStream = isSuccess? connection.getInputStream(): connection.getErrorStream();
  
  Reader reader = new InputStreamReader(responseStream, StandardCharsets.UTF_8);
  JSONParser parser = new JSONParser();
  JSONObject jsonObject = (JSONObject) parser.parse(reader);
  responseStream.close();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
</head>
<body>
<c:if test="${ empty loginEmployee }">
   <c:redirect url="eloginPage.do"/>
</c:if>
<section>
    <% if (isSuccess) { %>
    	<c:redirect url="pcancelsuccessresult.do">
    		<c:param name="page" value="<%= nowpage %>"/>
    		<c:param name="paymentKey" value="<%= paymentKey %>"/>
    		<c:param name="cancelReason" value="<%= cancelReason %>"/>
    	</c:redirect>
    <%} else { %>
        <h1>취소 실패</h1>
        <p><%= jsonObject.get("message") %></p>
        <span>에러코드: <%= jsonObject.get("code") %></span>
        <%
    }
    %>

</section>
</body>
</html>