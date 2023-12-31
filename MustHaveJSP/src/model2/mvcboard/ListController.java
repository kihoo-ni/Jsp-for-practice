package model2.mvcboard;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.BoardPage;


public class ListController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//DAO 생성, DB접속
		MVCBoardDAO dao=new MVCBoardDAO();
		
		// 뷰에 전달할 매개변수 저장용 맵 생성
		Map<String, Object>map=new HashMap<>();
		String searchField=request.getParameter("searchField");
		String searchWord=request.getParameter("searchWord");
		if(searchWord !=null) {
			// 쿼리 스트링으로 전달 받은 매개변수 중 검색어가 있다면 map에 저장
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		int totalCount = dao.selectCount(map); // 전체 게시물 갯수 저장
		
		// 페이지 처리 start 
		ServletContext application=getServletContext();
		int pageSize=Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		int blockPage=Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
		
		// 현재 페이지 확인 
		int pageNum=1; //기본값
		String pageTemp=request.getParameter("pageNum");
		if(pageTemp !=null && !pageTemp.equals(""))
			pageNum=Integer.parseInt(pageTemp); // 요청받은 페이지로 수정
		
		//목록에 출력할 게시물 범위 계산
		int start=(pageNum-1)*pageSize+1; //첫게시물 번호
		int end=pageNum*pageSize; //마지막 게시물 번호
		map.put("start",start);
		map.put("end",end);
		// 페이지 처리 end
		
		List<MVCBoardDTO>boardLists=dao.selectList(map); // 게시물 목록 받기
		dao.close();
		
		//뷰에 전달할 매개변수 추가
		String pagingImg= BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "../mvcboard/list.do");
		map.put("pagingImg", pagingImg);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);
		
		request.setAttribute("boardLists", boardLists);
		request.setAttribute("map", map);
		request.getRequestDispatcher("/14MVCBoard/List.jsp").forward(request, response);
		
	}

}
