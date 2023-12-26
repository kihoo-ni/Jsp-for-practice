<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.Car" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMain</title>
</head>
<body>
	<h1> CarMain </h1>
	<%Map<Integer,Car>carMaps=new HashMap<>(); 
		carMaps.put(1, new Car("람보르기니",4500,"빨강"));
		carMaps.put(2, new Car("페라리",4500,"빨강"));
		application.setAttribute("carMaps", carMaps);
	%>
	
	
	<%-- <%
		Map<Integer,Car> carMaps=new HashMap<>();
		carMaps.put(1, new Car("람보르기니",500000000,"블랙"));
		carMaps.put(2, new Car("제네시스",75000000,"화이트"));
		application.setAttribute("carMaps", carMaps);
	%> --%>
</body>
</html>