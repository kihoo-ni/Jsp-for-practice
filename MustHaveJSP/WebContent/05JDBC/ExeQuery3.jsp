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
			String url="jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=utf8";
			String id="manager";
			String pw="1234";
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection(url,id,pw);
			
			String sql="select * from student where s_name like '홍%'";
			stmt=con.createStatement();
			rs=stmt.executeQuery(sql);
			
			while(rs.next()){
				String s_name=rs.getString("s_name");
				String s_id=rs.getString("s_id");
				String s_tel=rs.getString("s_tel");
				String s_address=rs.getString("s_address"); //인덱스 말고 필드명 가능
				
				
				out.print(s_name+" "+s_id+" "+s_tel+" "+s_address);
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