<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); 
		String travelarea=request.getParameter("travel");
	
		if(travelarea.equals("보라카이")){
			response.sendRedirect("https://itsmorefuninthephilippines.co.kr/destination/boracay");
		} else if(travelarea.equals("세부")){
			response.sendRedirect("https://itsmorefuninthephilippines.co.kr/destination/cebu");
		} else if(travelarea.equals("파리")){
			response.sendRedirect("https://www.france.fr/ko/paris");
		} else if (travelarea.equals("런던")){
			response.sendRedirect("https://www.sprachcaffe.com/korean/language/english/uk/london/london.htm");
		}
	%>	
</body>
</html>