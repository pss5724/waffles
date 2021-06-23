package com.waffles.dao;

import java.util.ArrayList;

import com.waffles.vo.FaqVO;
import com.waffles.vo.NoticeVO;


public class NoticeDAO extends DAO{

	public ArrayList<NoticeVO> getList(String pageNumber, String search, String search_text ) {
		ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
		
		String sql = "";
		
		if(search == null) {
			sql = " select rno,nid,name,ntitle,ncontent,nhit,to_char(ndate,'yyyy-mm-dd') ndate " + 
				"						      from(select rownum rno,nid,name,ntitle,ncontent,nhit,ndate " + 
				"				      from(select * from waffle_notice order by ndate desc)) " + 
				"						     where rno between ? and ?";
		}
		else if(search.equals("title")) {
			sql = " select rno,nid,name,ntitle,ncontent,nhit,to_char(ndate,'yyyy-mm-dd') ndate " + 
					"						      from(select rownum rno,nid,name,ntitle,ncontent,nhit,ndate " + 
					"				      from(select * from waffle_notice order by ndate desc)) " + 
					"						     where rno between ? and ? and ntitle like '%"+search_text+"%'";
		}
		else if(search.equals("content")) {
			sql = " select rno,nid,name,ntitle,ncontent,nhit,to_char(ndate,'yyyy-mm-dd') ndate " + 
					"						      from(select rownum rno,nid,name,ntitle,ncontent,nhit,ndate " + 
					"				      from(select * from waffle_notice order by ndate desc)) " + 
					"						     where rno between ? and ? and ncontent like '%"+search_text+"%'";
		}
		else if(search.equals("titleContent")) {
			sql = " select rno,nid,name,ntitle,ncontent,nhit,to_char(ndate,'yyyy-mm-dd') ndate " + 
					"						      from(select rownum rno,nid,name,ntitle,ncontent,nhit,ndate " + 
					"				      from(select * from waffle_notice order by ndate desc)) " + 
					"						     where rno between ? and ? and ncontent like '%"+search_text+"%' or ntitle like '%"+search_text+"%'";
		}
		else if(search.equals("writer")) {
			sql = " select rno,nid,name,ntitle,ncontent,nhit,to_char(ndate,'yyyy-mm-dd') ndate " + 
					"						      from(select rownum rno,nid,name,ntitle,ncontent,nhit,ndate " + 
					"				      from(select * from waffle_notice order by ndate desc)) " + 
					"						     where rno between ? and ? and name like '%"+search_text+"%'";
		}

	
	
		getPreparedStatement(sql);
		
		try {
			int startnum = ((Integer.parseInt(pageNumber)-1)*10) +1;
			int endnum = Integer.parseInt(pageNumber)*10;
			pstmt.setInt(1, startnum);	
			pstmt.setInt(2, endnum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				NoticeVO vo = new NoticeVO();
				vo.setRno(rs.getInt(1));
				vo.setNid(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setNtitle(rs.getString(4));
				vo.setNcontent(rs.getString(5));
				vo.setNhit(rs.getInt(6));
				vo.setNdate(rs.getString(7));
				
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<NoticeVO> getList(String pageNumber) {
		ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
		
		String sql = " select rno,nid,name,ntitle,ncontent,nhit,to_char(ndate,'yyyy-mm-dd') ndate " + 
				"						      from(select rownum rno,nid,name,ntitle,ncontent,nhit,ndate " + 
				"				      from(select * from waffle_notice order by ndate desc)) " + 
				"						     where rno between ? and ?";
		
		
	
	
		getPreparedStatement(sql);
		
		try {
			int startnum = ((Integer.parseInt(pageNumber)-1)*10) +1;
			int endnum = Integer.parseInt(pageNumber)*10;
			pstmt.setInt(1, startnum);	
			pstmt.setInt(2, endnum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				NoticeVO vo = new NoticeVO();
				vo.setRno(rs.getInt(1));
				vo.setNid(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setNtitle(rs.getString(4));
				vo.setNcontent(rs.getString(5));
				vo.setNhit(rs.getInt(6));
				vo.setNdate(rs.getString(7));
				
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int targetPage(String pageNumber) {
		String SQL = "select count(num) from(select rownum num from waffle_notice) where num >= ?";
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
		String SQL = "select count(num) from(select rownum num from waffle_notice) where num >= ?";
		
		
		if(search.equals("title")) {
			SQL = "select count(num) from(select rownum num from waffle_notice where ntitle like '%"+search_text+"%' ) where num >= ?";
		}
		else if(search.equals("content")) {
			SQL = "select count(num) from(select rownum num from waffle_notice where ncontent like '%"+search_text+"%' ) where num >= ?";
		}
		else if(search.equals("titleContent")) {
			SQL = "select count(num) from(select rownum num from waffle_notice where ntitle like '%"+search_text+"%' and like ncontent '%"+search_text+"%' ) where num >= ?";
		}
		else if(search.equals("writer")) {
			SQL = "select count(num) from(select rownum num from waffle_notice where name like '%"+search_text+"%' ) where num >= ?";
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
	
	public String getNsfile(String nid) {
		String nsfile=null;
		String sql="select nsfile from waffle_notice where nid=?";
		
		getPreparedStatement(sql);
		
		
		try {
			pstmt.setString(1, nid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				nsfile = rs.getString(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return nsfile;
	}
	
	//Delete -->���� ó��
	public boolean getDeleteResult(String nid){
		boolean result = false;
		String sql = "delete from waffle_notice where nid=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, nid);
			
			int value = pstmt.executeUpdate();
			if(value != 0){
				result = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return result;
	}
	
	//Update ---> ���� ó��
		public boolean getUpdateResult(NoticeVO vo){
			boolean result = false;
			String sql = "update waffle_notice set ntitle=?, ncontent=?, nfile=?, nsfile=? where nid=?";
			getPreparedStatement(sql);
			
			try {
				pstmt.setString(1, vo.getNtitle());
				pstmt.setString(2, vo.getNcontent());
				pstmt.setString(3, vo.getNfile());
				pstmt.setString(4, vo.getNsfile());
				pstmt.setString(5, vo.getNid());
				
				int value = pstmt.executeUpdate();
				if(value != 0){
					result = true;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			close();
			return result;
		}
		
		//Update --> ����ó��(�������� ����)
		public boolean getUpdateResultNofile(NoticeVO vo){
			boolean result = false;
			String sql = "update waffle_notice set ntitle=?, ncontent=? where nid=?";
			getPreparedStatement(sql);
			
			try {
				pstmt.setString(1, vo.getNtitle());
				pstmt.setString(2, vo.getNcontent());
				pstmt.setString(3, vo.getNid());
				
				int value = pstmt.executeUpdate();
				if(value != 0){
					result = true;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			close();
			return result;
		}
	
	
	// insert --> ���ǻ��� �۾���
	public boolean getInsertResult(NoticeVO vo) {
		boolean result = false;
		String sql="insert into waffle_notice values('n_'||sequ_waffle_faq.nextval,?,?,?,?,?,0,sysdate)";
		
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getNtitle());
			pstmt.setString(3, vo.getNcontent());
			pstmt.setString(4, vo.getNfile());
			pstmt.setString(5, vo.getNsfile());
			
			int value = pstmt.executeUpdate();
			if(value !=0) {
				result = true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		close();
		
		
		return result;
	}
	
	
	
	//Update ---> ��ȸ�� ������Ʈ
	public void getUpdateHit(String nid){
		String sql = "update waffle_notice set nhit = nhit + 1 where nid=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, nid);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		close();
	}
	
	
	//Select ---> �� ����
	public NoticeVO getContent(String nid){
		NoticeVO vo = new NoticeVO();
		String sql = "select nid,name, ntitle, ncontent, nhit, to_char(ndate,'yyyy-mm-dd') ndate, nfile, nsfile "
					+ " from waffle_notice where nid=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, nid);
			rs = pstmt.executeQuery();
			if(rs.next()){
				vo.setNid(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setNtitle(rs.getString(3));
				vo.setNcontent(rs.getString(4));
				vo.setNhit(rs.getInt(5));
				vo.setNdate(rs.getString(6));
				vo.setNfile(rs.getString(7));
				vo.setNsfile(rs.getString(8));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	//Select --> ��ü ����Ʈ
	public ArrayList<NoticeVO> getList(){
		ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
		String sql = "select rownum rno, nid, name, ntitle, nhit, to_char(ndate, 'yyyy-mm-dd') ndate "
						+ " from (select nid, name,ntitle, nhit, ndate from waffle_notice "
						+ " order by ndate desc)";
		getPreparedStatement(sql);
		
		try {
			rs = pstmt.executeQuery();
			System.out.println("1");
			
			while(rs.next()){
				NoticeVO vo = new NoticeVO();
				vo.setRno(rs.getInt(1));
				vo.setNid(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setNtitle(rs.getString(4));
				vo.setNhit(rs.getInt(5));
				vo.setNdate(rs.getString(6));
				
				list.add(vo);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		
		return list;
	}
	
	
	
}

