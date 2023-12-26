<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		response.setIntHeader("Refresh", 5);
		//5초에 한번 새로고침
		
		LocalDateTime today = LocalDateTime.now(); // datetimeformatter 이용해야함
		DateTimeFormatter formater=DateTimeFormatter.ofPattern("yyyy년 MM월 dd일 KK시 mm분 ss초");
		String today1=today.format(formater);
		LocalDateTime today3=LocalDateTime.of(2022,12,12,12,59,59);
		
	%>
	
	<h1>날짜와 시간</h1>
	<h3><%=today1 %></h3>
	<h3><%=today3 %></h3>
</body>
</html>