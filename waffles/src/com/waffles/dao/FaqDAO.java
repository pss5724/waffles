package com.waffles.dao;

import java.util.ArrayList;

import com.waffles.vo.FaqVO;


public class FaqDAO extends DAO{
	

	public ArrayList<FaqVO> getList(String pageNumber, String search, String search_text ) {
		ArrayList<FaqVO> list = new ArrayList<FaqVO>();
		
		String sql = "";
		
		
		if(search.equals("title")) {
			sql = " select rno,fid,name,ftitle,fcontent,fhit,to_char(fdate,'yyyy-mm-dd') fdate " + 
					"						      from(select rownum rno,fid,name,ftitle,fcontent,fhit,fdate " + 
					"				      from(select * from waffle_faq order by fdate desc) where ftitle like '%"+search_text+"%') " + 
					"						     where rno between ? and ? ";
		}
		else if(search.equals("content")) {
			sql = " select rno,fid,name,ftitle,fcontent,fhit,to_char(fdate,'yyyy-mm-dd') fdate " + 
					"						      from(select rownum rno,fid,name,ftitle,fcontent,fhit,fdate " + 
					"				      from(select * from waffle_faq order by fdate desc) where fcontent like '%"+search_text+"%') " + 
					"						     where rno between ? and ?";
		}
		else if(search.equals("titleContent")) {
			sql = " select rno,fid,name,ftitle,fcontent,fhit,to_char(fdate,'yyyy-mm-dd') fdate " + 
					"						      from(select rownum rno,fid,name,ftitle,fcontent,fhit,fdate " + 
					"				      from(select * from waffle_faq order by fdate desc) where fcontent like '%"+search_text+"%' or ftitle like '%"+search_text+"%') " + 
					"						     where rno between ? and ? ";
		}
		else if(search.equals("writer")) {
			sql = " select rno,fid,name,ftitle,fcontent,fhit,to_char(fdate,'yyyy-mm-dd') fdate " + 
					"						      from(select rownum rno,fid,name,ftitle,fcontent,fhit,fdate " + 
					"				      from(select * from waffle_faq order by fdate desc) where name like '%"+search_text+"%') " + 
					"						     where rno between ? and ?";
		}

	
	
		getPreparedStatement(sql);
		
		try {
			int startnum = ((Integer.parseInt(pageNumber)-1)*10) +1;
			int endnum = Integer.parseInt(pageNumber)*10;
			pstmt.setInt(1, startnum);	
			pstmt.setInt(2, endnum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				FaqVO vo = new FaqVO();
				vo.setRno(rs.getInt(1));
				vo.setFid(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setFtitle(rs.getString(4));
				vo.setFcontent(rs.getString(5));
				vo.setFhit(rs.getInt(6));
				vo.setFdate(rs.getString(7));
				
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<FaqVO> getList(String pageNumber) {
		ArrayList<FaqVO> list = new ArrayList<FaqVO>();
		
		String sql = " select rno,fid,name,ftitle,fcontent,fhit,to_char(fdate,'yyyy-mm-dd') fdate " + 
				"						      from(select rownum rno,fid,name,ftitle,fcontent,fhit,fdate " + 
				"				      from(select * from waffle_faq order by fdate desc)) " + 
				"						     where rno between ? and ?";
		
		
	
	
		getPreparedStatement(sql);
		
		try {
			int startnum = ((Integer.parseInt(pageNumber)-1)*10) +1;
			int endnum = Integer.parseInt(pageNumber)*10;
			pstmt.setInt(1, startnum);	
			pstmt.setInt(2, endnum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				FaqVO vo = new FaqVO();
				vo.setRno(rs.getInt(1));
				vo.setFid(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setFtitle(rs.getString(4));
				vo.setFcontent(rs.getString(5));
				vo.setFhit(rs.getInt(6));
				vo.setFdate(rs.getString(7));
				
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int targetPage(String pageNumber) {
		String SQL = "select count(num) from(select rownum num from waffle_faq) where num >= ?";
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
		String SQL = "select count(num) from(select rownum num from waffle_faq) where num >= ?";
		
		
		if(search.equals("title")) {
			SQL = "select count(num) from(select rownum num from waffle_faq where ftitle like '%"+search_text+"%' ) where num >= ?";
		}
		else if(search.equals("content")) {
			SQL = "select count(num) from(select rownum num from waffle_faq where fcontent like '%"+search_text+"%' ) where num >= ?";
		}
		else if(search.equals("titleContent")) {
			SQL = "select count(num) from(select rownum num from waffle_faq where ftitle like '%"+search_text+"%' and like fcontent '%"+search_text+"%' ) where num >= ?";
		}
		else if(search.equals("writer")) {
			SQL = "select count(num) from(select rownum num from waffle_faq where name like '%"+search_text+"%' ) where num >= ?";
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
	
	
	public String getFsfile(String fid) {
		String fsfile=null;
		String sql="select fsfile from waffle_faq where fid=?";
		
		getPreparedStatement(sql);
		
		
		try {
			pstmt.setString(1, fid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				fsfile = rs.getString(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return fsfile;
	}
	
	//Delete -->���� ó��
	public boolean getDeleteResult(String fid){
		boolean result = false;
		String sql = "delete from waffle_faq where fid=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, fid);
			
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
		public boolean getUpdateResult(FaqVO vo){
			boolean result = false;
			String sql = "update waffle_faq set ftitle=?, fcontent=?, ffile=?, fsfile=? where fid=?";
			getPreparedStatement(sql);
			
			try {
				pstmt.setString(1, vo.getFtitle());
				pstmt.setString(2, vo.getFcontent());
				pstmt.setString(3, vo.getFfile());
				pstmt.setString(4, vo.getFsfile());
				pstmt.setString(5, vo.getFid());
				
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
		public boolean getUpdateResultNofile(FaqVO vo){
			boolean result = false;
			String sql = "update waffle_faq set ftitle=?, fcontent=? where fid=?";
			getPreparedStatement(sql);
			
			try {
				pstmt.setString(1, vo.getFtitle());
				pstmt.setString(2, vo.getFcontent());
				pstmt.setString(3, vo.getFid());
				
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
	public boolean getInsertResult(FaqVO vo) {
		boolean result = false;
		String sql="insert into waffle_faq values('f_'||sequ_waffle_faq.nextval,?,?,?,?,?,0,sysdate)";
		
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getFtitle());
			pstmt.setString(3, vo.getFcontent());
			pstmt.setString(4, vo.getFfile());
			pstmt.setString(5, vo.getFsfile());
			
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
	public void getUpdateHit(String fid){
		String sql = "update waffle_faq set fhit = fhit + 1 where fid=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, fid);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		close();
	}
	
	
	//Select ---> �� ����
	public FaqVO getContent(String fid){
		FaqVO vo = new FaqVO();
		String sql = "select fid,name, ftitle, fcontent, fhit, to_char(fdate,'yyyy-mm-dd') fdate, ffile, fsfile "
					+ " from waffle_faq where fid=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, fid);
			rs = pstmt.executeQuery();
			if(rs.next()){
				vo.setFid(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setFtitle(rs.getString(3));
				vo.setFcontent(rs.getString(4));
				vo.setFhit(rs.getInt(5));
				vo.setFdate(rs.getString(6));
				vo.setFfile(rs.getString(7));
				vo.setFsfile(rs.getString(8));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	//Select --> ��ü ����Ʈ
	public ArrayList<FaqVO> getList(){
		ArrayList<FaqVO> list = new ArrayList<FaqVO>();
		String sql = "select rownum rno, fid, name, ftitle,fhit, to_char(fdate, 'yyyy-mm-dd') fdate "
						+ " from (select fid, name,ftitle, fhit, fdate from waffle_faq "
						+ " order by fdate desc)";
		getPreparedStatement(sql);
		
		try {
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				FaqVO vo = new FaqVO();
				vo.setRno(rs.getInt(1));
				vo.setFid(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setFtitle(rs.getString(4));
				vo.setFhit(rs.getInt(5));
				vo.setFdate(rs.getString(6));
				
				list.add(vo);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		
		return list;
	}
	
	public ArrayList<FaqVO> getList(int start, int end){
		ArrayList<FaqVO> list = new ArrayList<FaqVO>();
		String sql = "select rno, fid,name, ftitle, fhit, fdate " + 
				" from (select rownum rno, fid,name, ftitle, fhit, to_char(fdate, 'yyyy-mm-dd') fdate " + 
				"						 from (select fid,name, ftitle, fhit, fdate from waffle_faq " + 
				"						 order by fdate desc)) " + 
				"             where rno between ? and ?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				FaqVO vo = new FaqVO();
				vo.setRno(rs.getInt(1));
				vo.setFid(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setFtitle(rs.getString(4));
				vo.setFhit(rs.getInt(5));
				vo.setFdate(rs.getString(6));
				
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		
		return list;
	}
	
	
}

