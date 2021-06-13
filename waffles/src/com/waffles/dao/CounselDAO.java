package com.waffles.dao;

public class CounselDAO extends DAO {

	public boolean counselInsert(String name, String hp, String email, String route, String local, String etc) {
		boolean result = false;
		String sql = " insert into waffle_counsel values('CID_'||counsel_SEQ.nextval, ?, ?, ?, ?, ?, ?,sysdate)";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, name);
			pstmt.setString(2, hp);
			pstmt.setString(3, email);
			pstmt.setString(4, route);
			pstmt.setString(5, local);
			pstmt.setString(6, etc);

			int value = pstmt.executeUpdate();
			
			if(value != 0) result = true;
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		
		return result;
	}
	

}