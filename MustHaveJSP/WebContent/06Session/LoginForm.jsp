<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인 페이지</h2>
	<span style="color:red; font-size:1.2em;">
		<%=request.getAttribute("LoginErrMsg")==null?"":request.getAttribute("LoginErrMsg") %>
	</span>
	<%
		if(session.getAttribute("UserId")==null){
			// 로그인 상태 확인, 로그아웃상태
	%>
	<script>
		function validateForm(form){
			if(!form.user_id.value){
				alert("아이디를 입력하세요"); //musthave 1234
				return false; // 
			}if(form.user_pw.value==""){
				alert("패스워드를 입력하세요");
				return false; // 
			}
		}
	</script>
	<form action="LoginProcess.jsp" method="post" name="loginFrm" onsubmit="return validateForm(this);">
		아이디:<input type="text" name="user_id" required ><br>
		패스워드:<input type="password" name="user_pw" required><br>
		<input type="submit" value="로그인하기">
	</form>
	<%
		}else{ //로그인된 상태
	%>
		${sessionScope.UserName} 회원님, 로그인하셨습니다.<br>
		<a href="Logout.jsp">[로그아웃]</a>
		<a href="../08Board/Write.jsp">글쓰기</a>
		<a href="../08Board/List.jsp">목록보기</a>
	
	<% 	} %>
</body>
</html>