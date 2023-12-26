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
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String name=request.getParameter("name");
		String gender=request.getParameter("gender") ;
		String[]hobby=request.getParameterValues("hobby");
		String hobbyStr="";
		if (hobby!=null){
			for(int i=0; i<hobby.length; i++){
				if(i==hobby.length-1){
					hobbyStr+=hobby[i];
					break;
				}
				hobbyStr+=hobby[i]+", ";
			}
		}
		// 향상된 for문으로 구하기
		//for(String h : hobby){
		//	hobbyStr+=h+" ";
		//}
	%>
	아이디: <%=id %> <br>
	비밀번호: <%=pw %> <br>
	이름: <%=name %> <br>
	성별: <%=gender %> <br>
	취미: <%=hobbyStr %>
</body>
</html>