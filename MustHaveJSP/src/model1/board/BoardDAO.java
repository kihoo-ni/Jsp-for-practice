package model1.board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class BoardDAO extends JDBConnect {
	public BoardDAO(ServletContext application) {
		super(application);
	}
	
	//게시물 개수 세는 메소드
	public int selectCount(Map<String, Object>map) {
		int totalCount=0; //결과(게시물 수)를 담을 변수
		
		//쿼리문 작성
		String query="select count(*) from board";
		if(map.get("searchWord") !=null) { //where 리터럴 작성시 띄어쓰기 하기 안그러면 oracle 인식안함
			query += " where "+map.get("searchField")+" " //like에서 엔터치면 분리됨
					+ "like '%"+map.get("searchWord")+"%'";
		} // 검색할 단어(searchWord) 검색할 분류(searchField)
		
		try {
			stmt=con.createStatement(); //쿼리문 생성
			rs=stmt.executeQuery(query); //쿼리 실행
			rs.next(); //커서를 첫 번째 행으로 이동
			totalCount=rs.getInt(1); // 첫 번째 컬럼 값(게시물 개수 count(*))을 가져옴
			System.out.println("게시물 개수 추출 성공");
		} catch (Exception e) {
			System.out.println("게시물 개수 오류");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	//게시물 목록 가져오는 메소드
	public List<BoardDTO> selectList(Map<String, Object> map){
		List<BoardDTO> bbs=new Vector<BoardDTO>(); //결과(게시물 목록)를 담을 변수
		
		String query="select * from ( select Tb.*, rownum rNum from ( select * from board ";
		if(map.get("searchWord") !=null) { //searchField는 비어질 수 없기 때문에 null체크 할필요없음
			query += " where "+map.get("searchField")+" " 
					+ "like '%"+map.get("searchWord")+"%'";
		} 
		query +=" order by num desc ) Tb ) where rNum between ? and ?"; //게시물 번호로 내림차순 정렬(최근 게시물이 위로오게 정렬)
		
		try {
			psmt=con.prepareStatement(query); //쿼리문 생성
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs=psmt.executeQuery(); //쿼리 실행
			
			while(rs.next()) { //결과 작업
				// 한 행(게시물 하나)의 내용을 DTO에 저장
				BoardDTO dto=new BoardDTO();
				
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				
				bbs.add(dto); // 결과 목록에 저장 
			}
			
			
			System.out.println("게시물 조회 성공");
		} catch (Exception e) {
			System.out.println("게시물 조회 실패");
			e.printStackTrace();
		}
		
		
		return bbs;
	}
	
	// 게시글 데이터를 받아 DB에 추가하는 메소드
	public int insertWrite(BoardDTO dto) {
		int result=0;
		try {
			// insert쿼리문 작성
			String query="insert into board(num, title, content, id, visitcount) values"
					+ "(seq_board_num.NEXTVAL, ?, ?, ?, 0)";
			
			psmt=con.prepareStatement(query); //동적쿼리문
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			
			result=psmt.executeUpdate();
			
			
			System.out.println("게시물 입력 성공");
		} catch (Exception e) {
			System.out.println("게시물 입력 실패");
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	// 지정한 게시물을 찾아 내용을 반환하는 메소드
	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();
		//쿼리문
		String query="select B.*, M.name from member M inner join board B on M.id=B.id where num=?";
																// board as B as생략가능
		try {
			psmt=con.prepareStatement(query);
			psmt.setString(1, num);
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString(6));
				dto.setName(rs.getString("name")); //index로 하면 7번째
			}
			
			System.out.println("게시물 상세보기 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("게시물 상세보기 실패");
		}
		
		return dto;
	}
	
	// 선택한 게시물의 조회수를 1 증가시키는 메소드
	public void updateVisitCount(String num) {
		//쿼리문
		String query="update board set visitcount=visitcount+1 where num=?";
		
		try {
			psmt=con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeQuery(); //반환값 int로 받을거 아니면 executeUpdate 안쓰고 executeQuery 써도됨
			
			System.out.println("조회수 증가 성공");
		} catch (Exception e) {
			System.out.println("조회수 증가 실패");
			e.printStackTrace();
		}
	}
	
	// 게시물 수정 메소드
	public int updateEdit(BoardDTO dto) {
		int result=0;
		
		String query="update board set title=?, content=? where num=?";
		try {
			psmt=con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			result=psmt.executeUpdate();
			System.out.println("내용 수정 성공");
		} catch (Exception e) {
			System.out.println("내용 수정 실패");
			e.printStackTrace();
		}
			
		return result;
	}
	
	// 게시물 삭제 메소드
	public int deletePost(BoardDTO dto) {
		int result=0;
		String query="delete from board where num=?";
		try {
			psmt=con.prepareStatement(query);
			psmt.setString(1, dto.getNum());
			result=psmt.executeUpdate();
			System.out.println("게시물 삭제 성공");
		} catch (Exception e) {
			System.out.println("게시물 삭제 실패");
			e.printStackTrace();
		}
		return result;
	}
}
