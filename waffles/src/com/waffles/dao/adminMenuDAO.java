package com.waffles.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.waffles.vo.CounselVO;
import com.waffles.vo.MenuVO;

public class adminMenuDAO extends DAO {

	public boolean counselInsert(String name, String hp, String email, String route, String local, String etc) {
		boolean result = false;
		String sql = " insert into waffle_counsel values('CID_'||counsel_SEQ.nextval, ?, ?, ?, ?, ?, ?,sysdate,0)";
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
	
	public ArrayList<MenuVO> getcounselList(String pageNumber) {
		ArrayList<MenuVO> list = new ArrayList<MenuVO>();
		 
		String sql = " select * from(select rownum num,kind,name,img,explain,ingredient " +
	                 " from(select * from menu order by rownum desc)) " +
					 " where num between ? and ? ";
		getPreparedStatement(sql);
		
		try {
			int startnum = ((Integer.parseInt(pageNumber)-1)*10) +1;
			int endnum = Integer.parseInt(pageNumber)*10;
			pstmt.setInt(1, startnum);
			pstmt.setInt(2, endnum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MenuVO counsel = new MenuVO();
				counsel.setKind(rs.getString(2));
				counsel.setName(rs.getString(3));
				counsel.setImg(rs.getString(4));
				counsel.setExplain(rs.getString(5));
				counsel.setIngredient(rs.getString(6));
				
				
				list.add(counsel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void getUpdateHit(String cid) {
		String sql = "update waffle_counsel set views = views+1 where counsel_id = ?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, cid);
			pstmt.executeQuery();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
	}
	public int targetPage(String pageNumber) {
		String SQL = "select count(num) from(select rownum num from Menu) where num >= ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, (Integer.parseInt(pageNumber) -1) * 10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) / 10 ;
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
}