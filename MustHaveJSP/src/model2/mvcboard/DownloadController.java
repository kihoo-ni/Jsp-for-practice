package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fileupload.FileUtil;



@WebServlet("/mvcboard/download.do")
public class DownloadController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//매개 변수 받기
		String ofile=request.getParameter("ofile");//원본파일명
		String sfile=request.getParameter("sfile");//저장된파일명
		String idx=request.getParameter("idx");//게시물번호
		
		//파일다운로드
		FileUtil.download(request, response, "/Uploads", sfile, ofile);
		
		//해당 게시물의 다운로드 수 1 증가
		MVCBoardDAO dao=new MVCBoardDAO();
		dao.downCountPlus(idx);
		dao.close();
		
	}

}
