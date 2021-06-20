package com.waffles.dao;

import java.util.ArrayList;

import com.waffles.vo.MemberVO;

import bcrypt.BCrypt;

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
			pstmt.setString(4, BCrypt.hashpw(vo.getPass(), BCrypt.gensalt(10)));

			int value = pstmt.executeUpdate();
			
			if(value != 0) result = true;
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		
		return result;
	}
	
	/* id �ߺ�üũ */
	public int getIdCheck(String id) {
		int result = 0;
		String sql = " select count(*) from waffle_member where id = ? ";
		getPreparedStatement(sql);

		try {
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if(rs.next()) result = rs.getInt(1);

		} catch (Exception e) {
			e.printStackTrace();
		}

		close();

		return result;
	}
	
	/* �α��� ó�� */
	public boolean getLoginResult(String id, String pass) {
		boolean result = false;
		
		String sql = " select pass from waffle_member where id = ?";
		getPreparedStatement(sql);
		
		try {
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(BCrypt.checkpw(pass, rs.getString(1))) { 
					result = true;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		
		return result;
	}
	
	/* ���̵� ã�� */
	public MemberVO getFindidResult(String name, String email) {
		MemberVO vo = new MemberVO();
		
		String sql = " select id, name, email, pass from waffle_member where name = ? and email = ? ";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo.setId(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setEmail(rs.getString(3));
				vo.setPass(rs.getString(4));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		
		return vo;
	}
	
	/* ��й�ȣ ã�� - ���� */
	public boolean getFindpassResult(String id, String name, String email) {
		boolean result = false;
		
		String sql = " select count(*) from waffle_member where id = ? and name = ? and email = ? ";
		getPreparedStatement(sql);
		try {
			
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getInt(1) == 1) result = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		
		return result;
	}
	
	/* ��й�ȣ ã�� - ����й�ȣ�� ���� */
	public boolean getFindpassUpdate(String pass, String id) {
		boolean result = false;
		
		String sql = " update waffle_member set pass = ? where id = ? ";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, pass);
			pstmt.setString(2, id);
			
			int value = pstmt.executeUpdate();
			
			if(value != 0) result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		
		return result;
	}
	
	/* �������� - ���̵�, �̸�, �̸��� �������� */
	public MemberVO getInfo(String id) {
		MemberVO vo = new MemberVO();

		String sql = " select id, name, email, pass from waffle_member where id = ? ";
		getPreparedStatement(sql);

		try {
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			while(rs.next()) {
				vo.setId(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setEmail(rs.getString(3));
				vo.setPass(rs.getString(4));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		close();

		return vo;
	}

	/* �������� - �̸���, ��й�ȣ ���� */
	public boolean getModify(MemberVO vo) {
		boolean result = false;

		String sql = " update waffle_member set name = ?, email = ?, pass = ? where id = ? ";
		getPreparedStatement(sql);

		try {
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getPass());
			pstmt.setString(4, vo.getId());

			int value = pstmt.executeUpdate();

			if(value != 0) result = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		close();

		return result;
	}
	
	// ȸ������ - ����Ʈ
	public ArrayList<MemberVO> getList(){
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		String sql ="select rownum rno, name, email, id, pass, to_char(mdate,'yyyy-mm-dd') mdate, choice " + 
				"  from (select name, email, id, pass, mdate, choice from waffle_member order by mdate desc)";
		getPreparedStatement(sql);
		
		try {
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setRno(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setEmail(rs.getString(3));
				vo.setId(rs.getString(4));
				vo.setPass(rs.getString(5));
				vo.setMdate(rs.getString(6));
				vo.setChoice(rs.getInt(7));
				
				list.add(vo);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}