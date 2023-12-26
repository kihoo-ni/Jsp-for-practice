<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp" %>
<%
	// 입력값 받기
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	
	// 입력값을 DTO 객체에 저장
	BoardDTO dto=new BoardDTO();
	dto.setTitle(title);
	dto.setContent(content);
	dto.setId(session.getAttribute("UserId").toString());  
	//(String)session.getAttribute("UserId") String으로 변환하기
	
	//DAO 객체를 통해 DB에 DTO 저장
	BoardDAO dao=new BoardDAO(application);
	int iResult=dao.insertWrite(dto);
	
	dao.close();
	
	// 성공과 실패
	if(iResult==1){
		response.sendRedirect("List.jsp");
	} else {
		JSFunction.alertBack("글쓰기에 실패하셨습니다.", out);
	}
%>
