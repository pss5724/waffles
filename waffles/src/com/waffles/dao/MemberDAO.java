package com.waffles.dao;

import java.util.ArrayList;

import com.waffles.vo.CounselVO;
import com.waffles.vo.MemberVO;

import bcrypt.BCrypt;

public class MemberDAO extends DAO {

	
	/* �쉶�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 泥섇뜝�룞�삕 */
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
	
	/* id �뜝�뙥釉앹삕泥댄겕 */
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
	
	/* �뜝�떥源띿삕�뜝�룞�삕 泥섇뜝�룞�삕 */
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
	
	/* �뜝�룞�삕�뜝�떛�벝�삕 李얍뜝�룞�삕 */
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
	
	/* �뜝�룞�삕艅섇뜝�떕占� 李얍뜝�룞�삕 - �뜝�룞�삕�뜝�룞�삕 */
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
	
	/* �뜝�룞�삕艅섇뜝�떕占� 李얍뜝�룞�삕 - �뜝�룞�삕�뜝�룞�삕艅섇뜝�떕節륁삕�뜝占� �뜝�룞�삕�뜝�룞�삕 */
	public boolean getFindpassUpdate(String pass, String id) {
		boolean result = false;
		
		String sql = " update waffle_member set pass = ? where id = ? ";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, BCrypt.hashpw(pass, BCrypt.gensalt(10)));
			pstmt.setString(2, id);
			
			int value = pstmt.executeUpdate();
			
			if(value != 0) result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		
		return result;
	}
	
	/* �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 - �뜝�룞�삕�뜝�떛�벝�삕, �뜝�떛紐뚯삕, �뜝�떛紐뚯삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 */
	public MemberVO getInfo(String id) {
		MemberVO vo = new MemberVO();

		String sql = " select id, name, email,choice from waffle_member where id = ? ";
		getPreparedStatement(sql);

		try {
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			while(rs.next()) {
				vo.setId(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setEmail(rs.getString(3));
				vo.setChoice(rs.getInt(4));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		close();

		return vo;
	}

	/* �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 - �뜝�떛紐뚯삕�뜝�룞�삕, �뜝�룞�삕艅섇뜝�떕占� �뜝�룞�삕�뜝�룞�삕 */
	public boolean getModify(MemberVO vo) {
		boolean result = false;

		String sql = " update waffle_member set name = ?, email = ?, pass = ? where id = ? ";
		getPreparedStatement(sql);

		try {
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, BCrypt.hashpw(vo.getPass(), BCrypt.gensalt(10)));
			pstmt.setString(4, vo.getId());

			int value = pstmt.executeUpdate();

			if(value != 0) result = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		close();

		return result;
	}
	
	// �쉶�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 - �뜝�룞�삕�뜝�룞�삕�듃
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
	
	public ArrayList<MemberVO> getList(String pageNumber) {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		 
		String sql = " select rno,name,email,id,pass,to_char(mdate,'yyyy-mm-dd') mdate,choice " +
				     " from(select rownum rno,name,email,id,pass,mdate,choice " +
				     " from(select * from waffle_member order by choice desc)) " +
				     " where rno between ? and ? ";
		getPreparedStatement(sql);
		
		try {
			int startnum = ((Integer.parseInt(pageNumber)-1)*10) +1;
			int endnum = Integer.parseInt(pageNumber)*10;
			pstmt.setInt(1, startnum);
			pstmt.setInt(2, endnum);
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
	
	public ArrayList<MemberVO> getList(String pageNumber, String search, String search_text) {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		
		String sql = "";

		if(search.equals("name")) {
			sql = " select rno,name,email,id,pass,to_char(mdate,'yyyy-mm-dd') mdate,choice " +
				     " from(select rownum rno,name,email,id,pass, mdate,choice " +
				     " from(select * from waffle_member order by choice desc) where name like '%"+search_text+"%' ) " +
				     " where rno between ? and ? ";
			
		} 
		else if(search.equals("id")) {
			sql = " select rno,name,email,id,pass,to_char(mdate,'yyyy-mm-dd') mdate,choice " +
				     " from(select rownum rno,name,email,id,pass,mdate,choice " +
				     " from(select * from waffle_member order by choice desc) where id like '%"+search_text+"%' ) " +
				     " where rno between ? and ? ";
		}
		
		getPreparedStatement(sql);
		
		try {
			int startnum = ((Integer.parseInt(pageNumber)-1)*10) +1;
			int endnum = Integer.parseInt(pageNumber)*10;
			pstmt.setInt(1, startnum);
			pstmt.setInt(2, endnum);
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
	public int targetPage(String pageNumber) {
		String SQL = "select count(num) from(select rownum num from waffle_member) where num >= ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, (Integer.parseInt(pageNumber) -1) * 10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return (rs.getInt(1)-2) / 10 ;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return 0;
	}
	public int targetPage(String pageNumber, String search, String search_text) {
		String SQL = "";
		if(search.equals("name")) {
			SQL = "select count(num) from(select rownum num from waffle_member where name like '%"+search_text+"%') where num >= ?";
			
		} 
		else if(search.equals("id")){
			SQL = "select count(num) from(select rownum num from waffle_member where id like '%"+search_text+"%') where num >= ?";
			
		}
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, (Integer.parseInt(pageNumber) -1) * 10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return (rs.getInt(1)-2) / 10 ;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return 0;
	}
	
	public boolean getChoiceUpdate(String id) {
		boolean result = false;
		
		String sql = " update waffle_member set choice = 1 where id = ? ";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, id);
			
			int value = pstmt.executeUpdate();
			
			if(value != 0) result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		
		return result;
	}
	
	public boolean getChoiceCanselUpdate(String id) {
		boolean result = false;
		
		String sql = " update waffle_member set choice = 0 where id = ? ";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, id);
			
			int value = pstmt.executeUpdate();
			
			if(value != 0) result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		
		return result;
	}
	

	public boolean getDeleteResult(String id) {
		boolean result = false;
		
		String sql = " delete from waffle_member where id = ? ";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, id);
			
			int value = pstmt.executeUpdate();
			
			if(value != 0) result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		
		return result;
	}
}