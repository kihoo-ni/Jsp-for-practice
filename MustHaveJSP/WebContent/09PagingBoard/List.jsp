<%@page import="model1.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model1.board.BoardDAO"%>
<%@page import="utils.BoardPage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	BoardDAO dao =new BoardDAO(application); //DB연결
	
	Map<String, Object> param=new HashMap<String, Object>(); //사용자가 입력한 검색 조건을 Map에 저장
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	
	if(searchWord !=null){ //searchField는 비어질 수 없기 때문에 null체크 할필요없음
		param.put("searchField", searchField);
		param.put("searchWord", searchWord);
	}
	//전체 게시물 개수 저장
	int totalCount = dao.selectCount(param); 
	// WEB.XML에서 설정한 한페이지당 출력 게시물 갯수 저장(10)
	int pageSize=Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
	// WEB.XML에서 설정한 페이지 번호 출력수 저장(5개)
	int blockPage=Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
	//전체 페이지수 저장	
	int totalPage=(int)Math.ceil((double)totalCount/pageSize);
	//페이지 번호 초기값 설정
	int pageNum=1; 
	//사용자가 클릭한 페이지 번호를 가져와 pageNum에 저장함
	String pageTemp=request.getParameter("pageNum");
	if(pageTemp !=null && !pageTemp.equals(""))
		pageNum=Integer.parseInt(pageTemp);
	
	//각 페이지의 시작번호와 끝번호를 설정
	int start=(pageNum-1)*pageSize+1;
	int end=pageNum*pageSize;
	param.put("start",start);
	param.put("end",end);
	
	List<BoardDTO>boardLists=dao.selectList(param); // 게시물 목록 받기
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	a{
		text-decoration: none;
	}
</style>
</head>
<body>
	<jsp:include page="../Common/Link.jsp"></jsp:include>
	
	<h2>목록 보기(List) - 현재 페이지 : <%=pageNum %> (전체 : <%=totalPage %>)</h2>
	<!-- 검색폼 -->
	<form method="get">
		<table border="1" width="90%">
			<tr>
				<td align="center">
					<select name="searchField">
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="text" name="searchWord">
					<input type="submit" value="검색하기">
				</td>
			</tr>
		</table>
	</form>
	<!-- 게시물 목록 테이블(표) -->
	<table border="1" width="90%">
		<!-- 각 컬럼의 이름 -->
		<tr>
			<th width="10%">번호</th>
			<th width="50%">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
		</tr>
		<!-- 목록의 내용 -->
	<%
		if(boardLists.isEmpty()){
			// 게시물이 하나도 없을 때
	%>		<tr>
				<td colspan="5" align="center">
					등록된 게시물이 없습니다.
				</td>
			</tr>
	<%
		} else { // 게시물이 있을 때 
			int virtualNum=0; //화면상에서의 게시물 번호(DB에 있는 NUM이 아니라 화면상에서의 번호)
			
			int countNum=0;
			for (BoardDTO dto : boardLists)
					{
				//		virtualNum=totalCount--; //전체 게시물 수에서 시작해 1씩 감소 
				virtualNum=totalCount-(((pageNum-1)*pageSize)+countNum++);
	%>
	
			<tr align="center">
				<td><%=virtualNum %></td>
				<td align="left">
					<a href="View.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle() %></a>
				</td>
				<td align="center"><%=dto.getId() %></td>
				<td align="center"><%=dto.getVisitcount() %></td>
				<td align="center"><%=dto.getPostdate() %></td>
			</tr>
	<% 	
					} 
				}
	%>
	</table>
	<!-- 목록 하단의 [글쓰기]버튼 -->
	<table border="1" width="90%">
		<tr align="center">
			<td><%=BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI()) %></td>
			<td><button type="button" onclick="location.href='Write.jsp';">글쓰기</button></td>
		</tr>
	</table>
</body>
</html>