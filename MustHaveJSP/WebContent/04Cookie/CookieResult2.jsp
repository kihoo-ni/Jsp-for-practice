<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>쿠키 출력</h1>
<%
	Cookie[] idc=request.getCookies();
	if(idc !=null){
		
	for(int i=0; i<idc.length; i++){
		String name=idc[i].getName();
		String value=idc[i].getValue();
		out.println("name : "+name+"<br>"+"value : "+value+"<br>");
	}
	}
%>
</body>
</html>