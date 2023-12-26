<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
		Connection con =null;
		Statement stmt =null;
		ResultSet rs=null;
		
		try{
			String url="jdbc:mysql://localhost:3306/member";
			String id="manager";
			String pw="1234";
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection(url,id,pw);
			
			String sql="select * from member";
			stmt=con.createStatement();
			rs=stmt.executeQuery(sql);
			
			while(rs.next()){
				String id2=rs.getString(1);
				String name=rs.getString(2);
				String pw2=rs.getString(3);
				String pwcheck=rs.getString(4);
				String tel=rs.getString(5);
				String email=rs.getString(6);
				String messagecheck=rs.getString(7);
				String route=rs.getString(8);
				
				out.print(id2+" "+name+" "+pw2+" "+pwcheck+" "+tel+" "+email+" "+messagecheck+" "+route);
			}
		} catch (Exception e){
			out.print("데이터베이스 연결 실패");
		} finally{
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(con!=null) con.close();
		}
		
	%>
</body>
</html>