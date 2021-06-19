package com.waffles.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.waffles.vo.CounselVO;
import com.waffles.vo.MenuVO;

public class CounselDAO extends DAO {

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
	
	public ArrayList<CounselVO> getcounselList(String pageNumber) {
		ArrayList<CounselVO> list = new ArrayList<CounselVO>();
		 
		String sql = " select num,name,hp,email,route,local,etc,submittime,views,counsel_id " +
				     " from(select rownum num,name,hp,email,route,local,etc,submittime,views,counsel_id " +
				     " from(select * from waffle_counsel order by submittime desc)) " +
				     " where num between ? and ? ";
		getPreparedStatement(sql);
		
		try {
			int startnum = ((Integer.parseInt(pageNumber)-1)*10) +1;
			int endnum = Integer.parseInt(pageNumber)*10;
			pstmt.setInt(1, startnum);
			pstmt.setInt(2, endnum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CounselVO counsel = new CounselVO();
				counsel.setNum(rs.getInt(1));
				counsel.setName(rs.getString(2));
				counsel.setHp(rs.getString(3));
				counsel.setEmail(rs.getString(4));
				counsel.setRoute(rs.getString(5));
				counsel.setLocal(rs.getString(6));
				counsel.setEtc(rs.getString(7));
				counsel.setSubmittime(rs.getString(8).substring(0,11));
				counsel.setViews(rs.getInt(9));
				counsel.setCid(rs.getString(10));
				
				list.add(counsel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<CounselVO> getcounselList(String pageNumber, String search, String search_text) {
		ArrayList<CounselVO> list = new ArrayList<CounselVO>();
		
		String sql = "";
		String target_text = "";
		if(search.equals("name")) {
			sql = " select num,name,hp,email,route,local,etc,submittime,views,counsel_id " +
					" from(select rownum num,name,hp,email,route,local,etc,submittime,views,counsel_id " +
					" from(select * from waffle_counsel order by submittime desc) " +
					" where name =?) " + 
					" where num between ? and ?";
			target_text = search_text;
		} else {
			sql = " select num,name,hp,email,route,local,etc,submittime,views,counsel_id " +
					" from(select rownum num,name,hp,email,route,local,etc,submittime,views,counsel_id " +
					" from(select * from waffle_counsel order by submittime desc) " +
					" where Local like ?) " +
					" where num between ? and ?";
			target_text = "%"+search_text+"%" ;
		}
		
		getPreparedStatement(sql);
		
		try {
			int startnum = ((Integer.parseInt(pageNumber)-1)*10) +1;
			int endnum = Integer.parseInt(pageNumber)*10;
			pstmt.setString(1, target_text);
			pstmt.setInt(2, startnum);
			pstmt.setInt(3, endnum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CounselVO counsel = new CounselVO();
				counsel.setNum(rs.getInt(1));
				counsel.setName(rs.getString(2));
				counsel.setHp(rs.getString(3));
				counsel.setEmail(rs.getString(4));
				counsel.setRoute(rs.getString(5));
				counsel.setLocal(rs.getString(6));
				counsel.setEtc(rs.getString(7));
				counsel.setSubmittime(rs.getString(8).substring(0,11));
				counsel.setViews(rs.getInt(9));
				counsel.setCid(rs.getString(10));
				
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
		String SQL = "select count(num) from(select rownum num from waffle_counsel) where num >= ?";
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
		String target_text = "";
		if(search.equals("name")) {
			SQL = "select count(num) from(select rownum num from waffle_counsel where name = ?) where num >= ?";
			target_text = search_text;
		} else {
			SQL = "select count(num) from(select rownum num from waffle_counsel where local like ?) where num >= ?";
			target_text = "%"+search_text+"%" ;
		}
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, target_text);
			pstmt.setInt(2, (Integer.parseInt(pageNumber) -1) * 10);
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
}