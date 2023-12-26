<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<jsp:useBean id="car" class="common.Car" scope="request"></jsp:useBean>
	<jsp:setProperty property="carName" name="car" value="maserati"/>
	<jsp:setProperty property="carPrice" name="car" value="345000000"/>
	<jsp:setProperty property="carColor" name="car" value="black"/>
	<jsp:forward page="CarParam.jsp?maxSpeed=300">
		<jsp:param value="2017/07" name="연식"/>
	</jsp:forward> <!--forward가 usebean setproperty 사이에 있으면 안됨 포워드는 다 이동시켜버림-->
</body>
</html>