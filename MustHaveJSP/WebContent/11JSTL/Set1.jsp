<%@page import="java.util.Date"%>
<%@page import="common.Car"%>
<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 변수 선언 -->
	<h4>변수 선언</h4>
	<c:set var="directVar" value="100"/>
	<c:set var="elVar" value="${directVar mod 5 }"/>
	<c:set var="expVar" value="<%= new Date() %>"/>
	<c:set var="betweenVar">변수값 요렇게 설정</c:set>
	
	<h4>EL을 이용해 변수 출력</h4>
	<ul>
		<li>directVar : ${directVar }</li>
		<li>elVar : ${elVar}</li>
		<li>expVar : ${expVar}</li>
		<li>betweenVar : ${betweenVar}</li>
	</ul>
	
	<h4>자바빈즈 생성 1 -생성자 사용</h4>
	
	<c:set var="personVar1" value='<%=new Person("박문수", 50) %>' scope="request"/>
	
	<ul>
		<li>이름 : ${requestScope.personVar1.name }</li>
		<li>나이 : ${personVar1.age }</li>
	</ul>
	<h4>자바빈즈 생성 2 -target, property 사용</h4>
	<c:set var="carVal1" value='<%=new Car() %>' scope="request"/>
	<c:set target="${carVal1}" property="carName" value="티코"/>
	<c:set target="${carVal1}" property="carPrice" value="500000"/>
	<c:set target="${carVal1}" property="carColor" value="빨강"/>
	<ul>
		<li>자동차 이름 : ${carVal1.carName }</li>
		<li>자동차 가격 : ${carVal1.carPrice }</li>
		<li>자동차 색상 : ${carVal1.carColor }</li>
	</ul>
</body>
</html>