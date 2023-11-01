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

<%

  String paymentKey = "";
  String cancelReason = "고객 변심";

  //부분 취소에서만 사용
  String cancelAmount = "300";

  //refundReceiveAccount - 가상계좌 거래에 대해 입금후에 취소하는 경우만 필요
  String bank = "신한";
  String accountNumber = "12345678901234";
  String holderName = "홍길동";

  //중복 취소를 막기위해 취소 가능금액을 전송
  String refundableAmount = null;
  
  String secretKey = "test_sk_DpexMgkW36ZnqQN19dEN3GbR5ozO:";
  
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
  obj.put("cancelAmount", cancelAmount);

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
    <title>취소 성공</title>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
</head>
<body>
<section>
    <%
    if (isSuccess) { %>
        <h1>취소 성공</h1>
        <p>결과 데이터 : <%= jsonObject.toJSONString() %></p>
        <p>orderName : <%= jsonObject.get("orderName") %></p>
        <p>method : <%= jsonObject.get("method") %></p>
        <p>cancels -> cancelReason : <%
        JSONArray cancels = ((JSONArray)jsonObject.get("cancels"));
        JSONObject cancel = (JSONObject) cancels.iterator().next();
        %>
        <%=cancel.get("cancelReason") %></p>
        
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