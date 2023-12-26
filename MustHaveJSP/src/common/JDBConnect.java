package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class JDBConnect {
	public Connection con; //데이터베이스와 연결
	public Statement stmt; //정적쿼리문을 실행할때 사용됨
	public PreparedStatement psmt; //동적쿼리문을 실행할 때 사용됨
	public ResultSet rs; // SELECT 쿼리문의 결과를 저장할때 사용됨
	
	//기본 생성자
	public JDBConnect() {
		try {
			//JDBC 드라이버 로드
			Class.forName("oracle.jdbc.OracleDriver"); //만약 mysql로 한다면 드라이버 이름은 com.mysql.jdbc.Driver
			
			String url="jdbc:oracle:thin:@localhost:1521:xe"; //db 접속 주소
			String id="manager"; //사용자계정 아이디
			String pwd="1234"; // 계정 비밀번호
			con=DriverManager.getConnection(url, id, pwd); //db 연결
			
			System.out.println("DB 연결 성공!");
			
		} catch (Exception e) {
			System.out.println("데이터 베이스 연결 오류입니다");
			e.printStackTrace();
		}
	}
	
	public JDBConnect(String driver, String url, String id, String pwd) {
		try {
			Class.forName(driver); // 드라이브 로드
			con=DriverManager.getConnection(url, id, pwd); //db 연결
			System.out.println("두번째 DB 연결 성공!");
			
		} catch (Exception e) {
			System.out.println("두번째 데이터베이스 연결 오류 ");
			e.printStackTrace();
		}
	}
	
	public JDBConnect(ServletContext application) {
		try {
		String driver =application.getInitParameter("OracleDriver");
		Class.forName(driver);
		String url=application.getInitParameter("OracleURL");
		String id=application.getInitParameter("OracleId");
		String pwd=application.getInitParameter("OraclePwd");
		con=DriverManager.getConnection(url,id,pwd);
		
		System.out.println("application db연결 성공");
			
			
		} catch (Exception e) {
		e.printStackTrace();
		System.out.println("application db연결 실패");
		}
		
	}
	
	public void close() { //연결 해제 메소드
		try {
			if(rs !=null) rs.close();
			if(stmt !=null) stmt.close();
			if(psmt !=null) psmt.close();
			if(con !=null) con.close();
			
			System.out.println("JDBC 자원해제");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
