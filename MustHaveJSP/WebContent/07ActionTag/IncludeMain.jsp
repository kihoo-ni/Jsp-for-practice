<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//포함될 파일의 경로
	String outerPath1="./inc/OuterPage1.jsp";
	String outerPath2="./inc/OuterPage2.jsp";
	String outerPath3="./inc/OuterPage3.jsp";
	
	//page영역과 request 영역에 속성 저장
	pageContext.setAttribute("pAttr", "동명왕");
	request.setAttribute("rAttr", "온조왕");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>지시어로 페이지 포함하기</h2>
	<%@ include file="./inc/OuterPage1.jsp" %>
	<p>외부 파일에선언한 변수 : <%=newVar1 %></p>
	
	<h2>액션태그로 페이지 포함하기</h2>
	<jsp:include page="./inc/OuterPage2.jsp"/>
	<p>외부 파일에선언한 변수 :<%--  <%=newVar2 %> 액션태그는 페이지 합쳐지는개념(결과가 합쳐짐)아니라서 공유못함--%></p>
</body>
</html>