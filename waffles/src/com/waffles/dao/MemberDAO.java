package com.waffles.dao;

import com.waffles.vo.MemberVO;

public class MemberDAO extends DAO {

	
	/* ȸ������ ó�� */
	public boolean getInsertResult(MemberVO vo) {
		boolean result = false;
		String sql = " insert into waffle_member values(?, ?, ?, ?, sysdate, 0) ";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getId());
			pstmt.setString(4, vo.getPass());

			int value = pstmt.executeUpdate();
			
			if(value != 0) result = true;
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		
		return result;
	}
	
	/* �α��� ó�� */
	public boolean getLoginResult(String id, String pass) {
		boolean result = false;
		
		String sql = " select count(*) from waffle_member where id = ? and pass = ? ";
		getPreparedStatement(sql);
		
		try {
			
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(rs.getInt(1) == 1) result = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		
		return result;
	}
	
	/* ��й�ȣ ã�� - ���� */
	public boolean getFindpass(String id, String name, String email) {
		boolean result = false;
		
		try {
			String sql = " select count(*) cnt from waffle_member where id = ? and name = ? and email = ? ";
			getPreparedStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int cnt = rs.getInt(1);
				System.out.println(cnt);
				if(cnt>0) {
					result =  true;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/* ��й�ȣ ã�� - ����й�ȣ�� ���� */
	public boolean getFindpassUpdate(String pass, String id) {
		boolean result = false;
		
		try {
			String sql = " update waffle_member set pass = ? where id = ? ";
			getPreparedStatement(sql);
			
			pstmt.setString(1, pass);
			pstmt.setString(2, id);
			//pstmt.setString(3, name);
			//pstmt.setString(4, email);
			
			int val = pstmt.executeUpdate();
			
			if(val != 0 ) result = true;
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/* ���̵� �ߺ�üũ, ��й�ȣ ã�� - �� ��й�ȣ (update), ȸ���������� (update - ���̵�, �̸� ����) */
}