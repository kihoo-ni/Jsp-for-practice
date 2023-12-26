<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원 목록 조회 테스트</h2>
	<%
		JDBConnect jdbc=new JDBConnect(); //db에 연결
		
		String sql="select * from member";
		jdbc.stmt=jdbc.con.createStatement(); //쿼리문 생성		
		
		jdbc.rs=jdbc.stmt.executeQuery(sql); //JDBConnect에 있는 Statement, ResultSet 사용하여 쿼리문 실행
		// select만 ResultSet으로 나옴 나머지는 executeupdate로 int타입 변수로 받음.
		
		while(jdbc.rs.next()){ // 결과 확인(웹 페이지에 출력)
			String id=jdbc.rs.getString(1);
			String pw=jdbc.rs.getString(2);
			String name=jdbc.rs.getString(3);
			java.sql.Date regidate= jdbc.rs.getDate(4); //java.sql.Date 는 import 하기 싫어서 요약형으로씀
			
			out.print(id+" "+pw+" "+name+" "+regidate+"<br>");
			
		}
		
		jdbc.close();
	%>
</body>
</html>