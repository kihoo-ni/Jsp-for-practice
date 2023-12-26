package membership;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {
	
	public MemberDAO() {
		super();
	}
	
	//명시한 데이터베이스로의 연결이 완료된 MemberDAO객체를 생성합니다.
	public MemberDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw);
	}
	
	public MemberDTO getMemberDTO(String uid, String upass) {
		MemberDTO dto=new MemberDTO();
		String query="select * from member where id=? and pass=?";
		
		try {
			psmt=con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString(1));
				dto.setPass(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
			}
		} catch (Exception e) {
			System.out.println("DB연결 실패");
		}
		
		return dto;
	}
}
