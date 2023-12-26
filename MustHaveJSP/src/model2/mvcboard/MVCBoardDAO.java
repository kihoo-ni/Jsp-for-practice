package model2.mvcboard;

import java.util.*;

import common.JDBConnect;

public class MVCBoardDAO extends JDBConnect {
	public MVCBoardDAO() {
		super();
	}

	// 게시물 개수 세는 메소드
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0; // 결과(게시물 수)를 담을 변수

		// 쿼리문 작성
		String query = "select count(*) from mvcboard";
		if (map.get("searchWord") != null) { // where 리터럴 작성시 띄어쓰기 하기 안그러면 oracle 인식안함
			query += " where " + map.get("searchField") + " " // like에서 엔터치면 분리됨
					+ "like '%" + map.get("searchWord") + "%'";
		} // 검색할 단어(searchWord) 검색할 분류(searchField)

		try {
			stmt = con.createStatement(); // 쿼리문 생성
			rs = stmt.executeQuery(query); // 쿼리 실행
			rs.next(); // 커서를 첫 번째 행으로 이동
			totalCount = rs.getInt(1); // 첫 번째 컬럼 값(게시물 개수 count(*))을 가져옴
			System.out.println("게시물 개수 추출 성공");
		} catch (Exception e) {
			System.out.println("게시물 개수 오류");
			e.printStackTrace();
		}
		return totalCount;
	}

	// 게시물 목록 가져오는 메소드
	public List<MVCBoardDTO> selectList(Map<String, Object> map) {
		List<MVCBoardDTO> board = new Vector<MVCBoardDTO>(); // 결과(게시물 목록)를 담을 변수

		String query = "select * from ( select Tb.*, rownum rNum from ( select * from mvcboard ";
		if (map.get("searchWord") != null) { // searchField는 비어질 수 없기 때문에 null체크 할필요없음
			query += " where " + map.get("searchField") + " " + "like '%" + map.get("searchWord") + "%'";
		}
		query += " order by idx desc ) Tb ) where rNum between ? and ?"; // 게시물 번호로 내림차순 정렬(최근 게시물이 위로오게 정렬)

		try {
			psmt = con.prepareStatement(query); // 쿼리문 생성
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery(); // 쿼리 실행

			while (rs.next()) { // 결과 작업
				// 한 행(게시물 하나)의 내용을 DTO에 저장
				MVCBoardDTO dto = new MVCBoardDTO();

				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setPass(rs.getString(9));
				dto.setVisitcount(rs.getInt(10));

				board.add(dto); // 결과 목록에 저장
			}

			System.out.println("게시물 조회 성공");
		} catch (Exception e) {
			System.out.println("게시물 조회 실패");
			e.printStackTrace();
		}

		return board;
	}

	// 게시글 데이터를 받아 DB에 추가하는 메소드
	public int insertWrite(MVCBoardDTO dto) {
		int result = 0;

		try { // insert쿼리문 작성
			String query = "insert into mvcboard(idx, name, title, content, ofile, sfile, pass) values"
					+ "(seq_board_num.NEXTVAL, ?, ?, ?, ?, ?, ?)";

			psmt = con.prepareStatement(query); // 동적쿼리문 psmt.setString(1, dto.getTitle());
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getPass());
			result = psmt.executeUpdate();
			System.out.println("게시물 입력 성공");

		} catch (Exception e) {

			System.out.println("게시물 입력 실패");
			e.printStackTrace();

		}

		return result;

	}

	// 지정한 게시물을 찾아 내용을 반환하는 메소드
	public MVCBoardDTO selectView(String idx) {
		MVCBoardDTO dto = new MVCBoardDTO();
		// 쿼리문
		String query = "select * from mvcboard where idx=?";
		try {
			psmt = con.prepareStatement(query); // 쿼리문 준비
			psmt.setString(1, idx); // 인파라미터 설정
			rs = psmt.executeQuery(); // 쿼리문 실행

			if (rs.next()) { // 결과를 DTO 객체에 저장
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setPass(rs.getString(9));
				dto.setVisitcount(rs.getInt(10));
			}
			System.out.println("게시물 상세보기 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("게시물 상세보기 실패");
			System.out.println(dto.getIdx());
			System.out.println(dto.getPass());
		}
		return dto;
	}

	// 선택한 게시물의 조회수를 1 증가시키는 메소드
	public void updateVisitCount(String idx) {
		// 쿼리문
		String query = "update mvcboard set visitcount=visitcount+1 where idx=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			psmt.executeQuery(); // 반환값 int로 받을거 아니면 executeUpdate 안쓰고 executeQuery 써도됨

			System.out.println("조회수 증가 성공");
		} catch (Exception e) {
			System.out.println("조회수 증가 실패");
			e.printStackTrace();
		}
	}

	// 다운로드 횟수를 1 증가 시킵니다.
	public void downCountPlus(String idx) {
		// 쿼리문
		String sql = "update mvcboard set downcount=downcount+1 where idx=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			psmt.executeQuery(); // 반환값 int로 받을거 아니면 executeUpdate 안쓰고 executeQuery 써도됨

			System.out.println("다운로드 횟수 증가 성공");
		} catch (Exception e) {
			System.out.println("다운로드 횟수 증가 실패");
			e.printStackTrace();
		}
	}

	// 비밀번호 맞는지 확인하는 메소드
	public boolean confirmPassword(String pass, String idx) {
		boolean isCorr = true;
		try {
			String sql = "select count(*) from mvcboard where pass=? and idx=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, pass);
			psmt.setString(2, idx);
			rs = psmt.executeQuery();
			rs.next();
			if (rs.getInt(1) == 0) {
				isCorr = false;
			}
			System.out.println("비밀번호 정상 확인됨");
		} catch (Exception e) {
			System.out.println("비밀번호 확인 오류 발생");
			isCorr = false;
			e.printStackTrace();
		}
		return isCorr;
	}

	// 게시물 삭제 메소드
	public int deletePost(String idx) {
		int result = 0;
		String query = "delete from mvcboard where idx=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			result = psmt.executeUpdate();
			System.out.println("게시물 삭제 성공");
		} catch (Exception e) {
			System.out.println("게시물 삭제 실패");
			e.printStackTrace();
		}
		return result;
	}

	// 게시물 수정 메소드
	public int updatePost(MVCBoardDTO dto) {
		int result = 0;
		String query = "update mvcboard set title=?, name=?, content=?, ofile=?, sfile=? where idx=? and pass=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getIdx());
			psmt.setString(7, dto.getPass());
			result = psmt.executeUpdate();
			System.out.println("내용 수정 성공");
		} catch (Exception e) {
			System.out.println("내용 수정 실패");
			e.printStackTrace();
		}

		return result;
	}

}
