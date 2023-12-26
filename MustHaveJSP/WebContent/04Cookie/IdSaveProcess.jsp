<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="utils.CookieManager" %>	
<%@ page import="utils.JSFunction" %>	
<%
	String user_id=request.getParameter("user_id");
	String user_pw=request.getParameter("user_pw");
	String save_check=request.getParameter("save_check");
	
	if(user_id.equals("java") && user_pw.equals("1234")){ //로그인 성공 
		if(save_check !=null && save_check.equals("Y")){ // [아이디저장하기] 체크되었는지 확인함
			CookieManager.makeCookie(response, "loginId", user_id, 60*60*24); //쿠키 생성함
		} else {
			CookieManager.deleteCookie(response, "loginId");// 쿠키삭제함
		}
		
		JSFunction.alertLocation("로그인에 성공했습니다", "IdSaveMain.jsp", out);
	}
	else {
		//로그인 실패
		JSFunction.alertBack("로그인에 실패했습니다", out);
	}
%>
