package servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import membership.MemberDAO;
import membership.MemberDTO;


public class MemberAuth extends HttpServlet {
	MemberDAO dao;
	
	@Override
	public void init() throws ServletException {
		//application 내장 객체 얻기
		ServletContext application = this.getServletContext();
		
		//web.xml에서 DB연결정보 얻기
		String driver =application.getInitParameter("OracleDriver");
		String connectUrl =application.getInitParameter("OracleURL");
		String oId =application.getInitParameter("OracleId");
		String oPass =application.getInitParameter("OraclePwd");
		
		//DAO생성
		dao=new MemberDAO(driver, connectUrl, oId, oPass);
	}

	@Override
	public void destroy() {
		dao.close();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 서블릿 초기화 매개변수에서 관리자 ID받기
		String admin_id=this.getInitParameter("admin_id"); //web파일에서 서블릿 설정할때 this로 받음
		
		// 인증을 요청한 ID/PW
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		
		//회원 테이블에서 인증요청한 ID/PW에 해당하는 회원 찾기
		MemberDTO dto=dao.getMemberDTO(id, pass);
		
		// 찾은 회원의 이름에 따른 처리
		String memberName=dto.getName();
		if(memberName !=null) { //일치할 경우
			request.setAttribute("authMessage", memberName+" 회원님 반갑습니다.");
		} else { //일치하지 않음 
			if(admin_id.equals(id)) { //관리자 아이디와 일치할 경우
				request.setAttribute("authMessage", admin_id+"는 최고 관리자 입니다.");
			} else {//비회원
				request.setAttribute("authMessage", "귀하는 회원이 아닙니다.");
			}
		}
		request.getRequestDispatcher("/13Servlet/MemberAuth.jsp").forward(request, response);
		
	}

	
	
}
