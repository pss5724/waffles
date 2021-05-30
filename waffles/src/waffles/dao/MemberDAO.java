package waffles.dao;

import waffles.vo.MemberVO;

public class MemberDAO extends DAO {

	/* 로그인 처리 */
	public boolean getLogin(String id, String pass) {
		boolean result = false;
		
		try {
			String sql = " select count(*) member where id=? and pass=? ";
			getPreparedStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(rs.getInt(1)==1) result = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
	
	/* 회원가입 처리 */
	public boolean getJoin(MemberVO member) {
		boolean result = false;
		
		try {
			String sql = " insert into member values(?,?,?,?,sysdate) ";
			getPreparedStatement(sql);
			
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getEmail());
			pstmt.setString(3, member.getId());
			pstmt.setString(4, member.getPass());

			int val = pstmt.executeUpdate();
			if(val != 0) result = true;
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/* 아이디 중복체크, 비밀번호 찾기 - 새 비밀번호 (update), 회원정보수정 (update - 아이디, 이름 빼고) */
}
