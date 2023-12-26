<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp"%>
<%
	String num=request.getParameter("num");

	BoardDTO dto=new BoardDTO();
	BoardDAO dao= new BoardDAO(application);
	dto=dao.selectView(num); // 주어진 일련번호에 해당하는 기존 게시물 얻기
	
	String sessionId=session.getAttribute("UserId").toString(); // 로그인된 사용자 id 얻기
	
	int delResult=0;
	
	if(sessionId.equals(dto.getId())){
		//작성자가 본인이라면
		dto.setNum(num);
		delResult=dao.deletePost(dto); //삭제 메소드 실행
		dao.close();
		
		//성공과 실패
		if(delResult==1){
			//성공시 상세보기 페이지로 이동
			JSFunction.alertLocation("삭제되었습니다.", "List.jsp", out);
		} else {
			//삭제 실패시 이전페이지로 이동
			JSFunction.alertBack("삭제에 실패하였습니다.", out);
		}
	} else {
		// 작성자가 본인이아니라면 
		JSFunction.alertBack("본인만 삭제할 수 있습니다.", out);
		return;
	}
	

%>