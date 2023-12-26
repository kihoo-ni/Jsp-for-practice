<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.Person" %>
<% 
	pageContext.setAttribute("pageInteger", 1000); //객체가 아닌 기본타입은 자동으로 박싱된후 저장됨.
	pageContext.setAttribute("pageString", "페이지 영역의 문자열");
	pageContext.setAttribute("pagePerson", new Person("한석봉",99));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>1. page 영역의 속성값 읽기</h2>
	<%
	int pInteger = (Integer)(pageContext.getAttribute("pageInteger")); // object 타입이라 형변환 함.
	String pString =pageContext.getAttribute("pageString").toString(); 
	Person nPerson=(Person)(pageContext.getAttribute("pagePerson")); // object 타입이라 Person 타입으로 형변환 함.
	%>
	<ul>
		<li>Integer 객체 : <%=pInteger %></li>
		<li>String 객체 : <%=pString %></li>
		<li>Person 객체 : <%=nPerson.getName() %>, <%=nPerson.getAge() %></li>
	</ul>
	
	<h2>2. include된 파일에서 page영역 읽어오기</h2>
	<%@ include file="PageInclude.jsp" %>	
	
	<h2>3. 페이지 이동 후 page영역 읽어오기</h2>
	<a href="PageLocation.jsp">PageLocation.jsp 바로가기</a>
</body>
</html>