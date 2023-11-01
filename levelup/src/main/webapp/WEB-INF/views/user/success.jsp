<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Base64"%>
<%@ page import="java.util.Base64.Encoder"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.net.URL" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="org.json.simple.parser.ParseException" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.io.Reader" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="java.net.URLEncoder" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 // 결제 승인 API 호출하기 
  String orderId = request.getParameter("orderId");
  String paymentKey = request.getParameter("paymentKey");
  String amount = request.getParameter("amount");
  // 김화범 시크릿키
  //String secretKey = "test_sk_DpexMgkW36xJ0M0ooAXMrGbR5ozO:";
  
  // 김지혁 시크릿키
  String secretKey = "test_sk_DpexMgkW36ZnqQN19dEN3GbR5ozO:";
  
  // 최유미 시크릿키
  //String secretKey = "test_sk_24xLea5zVAmdw7OMPDZxVQAMYNwW:";
  
  Encoder encoder = Base64.getEncoder(); 
  byte[] encodedBytes = encoder.encode(secretKey.getBytes("UTF-8"));
  String authorizations = "Basic "+ new String(encodedBytes, 0, encodedBytes.length);

  paymentKey = URLEncoder.encode(paymentKey, StandardCharsets.UTF_8);
  
  URL url = new URL("https://api.tosspayments.com/v1/payments/confirm");
  
  HttpURLConnection connection = (HttpURLConnection) url.openConnection();
  connection.setRequestProperty("Authorization", authorizations);
  connection.setRequestProperty("Content-Type", "application/json");
  connection.setRequestMethod("POST");
  connection.setDoOutput(true);
  JSONObject obj = new JSONObject();
  obj.put("paymentKey", paymentKey);
  obj.put("orderId", orderId);
  obj.put("amount", amount);
  
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
    <title>결제 성공</title>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
</head>
<body>
<c:import url="/WEB-INF/views/user/userHeader.jsp"/>
<section>
   <%
    if (isSuccess) { %>
		<script>
		    // 폼 엘리먼트 생성
		    var form = document.createElement("form");
		    form.method = "POST"; // POST 메서드를 사용합니다.
		    form.action = "purchase.do"; // 이동할 페이지 URL을 설정합니다.
		
		    // 파라미터(데이터)를 폼에 추가
		    var paymentKeyInput = document.createElement("input");
		    paymentKeyInput.type = "hidden"; // 숨김 입력 필드로 만듭니다.
		    paymentKeyInput.name = "paymentKey"; // 파라미터 이름
		    paymentKeyInput.value = "${requestScope.paymentKey}"; // 파라미터 값
		    form.appendChild(paymentKeyInput);
		
		    // 페이지 이동을 위해 폼을 body에 추가하고 제출(submit)합니다.
		    document.body.appendChild(form);
		    form.submit();
		</script>
        <%-- <h1>결제 성공</h1>
        <p>결과 데이터 : <%= jsonObject.toJSONString() %></p>
        <p>orderName : <%= jsonObject.get("orderName") %></p>
        <p>method : <%= jsonObject.get("method") %></p>
        <p>
            <% if(jsonObject.get("method").equals("카드")) { out.println(((JSONObject)jsonObject.get("card")).get("number"));} %>
            <% if(jsonObject.get("method").equals("가상계좌")) { out.println(((JSONObject)jsonObject.get("virtualAccount")).get("accountNumber"));} %>
            <% if(jsonObject.get("method").equals("계좌이체")) { out.println(((JSONObject)jsonObject.get("transfer")).get("bank"));} %>
            <% if(jsonObject.get("method").equals("휴대폰")) { out.println(((JSONObject)jsonObject.get("mobilePhone")).get("customerMobilePhone"));} %>
        </p> --%>
       
    <%} else { %>
        <script>
        // 성공 메시지 표시
        alert("결제가 실패하였습니다.");

        // 페이지 이동
        window.location.href = "ushop.do";
    </script>
       <%--  <h1>결제 실패</h1>
        <p><%= jsonObject.get("message") %></p>
        <span>에러코드: <%= jsonObject.get("code") %></span> --%>
        <%
    }
    %>

</section>
<c:import url="/WEB-INF/views/user/userFooter.jsp"/>
</body>
</html>