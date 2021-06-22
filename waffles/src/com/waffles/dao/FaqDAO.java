package com.waffles.dao;

import java.util.ArrayList;

import com.waffles.vo.FaqVO;


public class FaqDAO extends DAO{
	

	public ArrayList<FaqVO> getList(String pageNumber, String search, String search_text ) {
		ArrayList<FaqVO> list = new ArrayList<FaqVO>();
		
		String sql = "";
		
		if(search == null) {
			sql = " select rno,fid,name,ftitle,fcontent,fhit,to_char(fdate,'yyyy-mm-dd') fdate " + 
				"						      from(select rownum rno,fid,name,ftitle,fcontent,fhit,fdate " + 
				"				      from(select * from waffle_faq order by fdate desc)) " + 
				"						     where rno between ? and ?";
		}
		else if(search.equals("title")) {
			sql = " select rno,fid,name,ftitle,fcontent,fhit,to_char(fdate,'yyyy-mm-dd') fdate " + 
					"						      from(select rownum rno,fid,name,ftitle,fcontent,fhit,fdate " + 
					"				      from(select * from waffle_faq order by fdate desc)) " + 
					"						     where rno between ? and ? and ftitle like '%"+search_text+"%'";
		}
		else if(search.equals("content")) {
			sql = " select rno,fid,name,ftitle,fcontent,fhit,to_char(fdate,'yyyy-mm-dd') fdate " + 
					"						      from(select rownum rno,fid,name,ftitle,fcontent,fhit,fdate " + 
					"				      from(select * from waffle_faq order by fdate desc)) " + 
					"						     where rno between ? and ? and fcontent like '%"+search_text+"%'";
		}
		else if(search.equals("titleContent")) {
			sql = " select rno,fid,name,ftitle,fcontent,fhit,to_char(fdate,'yyyy-mm-dd') fdate " + 
					"						      from(select rownum rno,fid,name,ftitle,fcontent,fhit,fdate " + 
					"				      from(select * from waffle_faq order by fdate desc)) " + 
					"						     where rno between ? and ? and fcontent like '%"+search_text+"%' or ftitle like '%"+search_text+"%'";
		}
		else if(search.equals("writer")) {
			sql = " select rno,fid,name,ftitle,fcontent,fhit,to_char(fdate,'yyyy-mm-dd') fdate " + 
					"						      from(select rownum rno,fid,name,ftitle,fcontent,fhit,fdate " + 
					"				      from(select * from waffle_faq order by fdate desc)) " + 
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
	
	//Delete -->삭제 처리
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
	
	//Update ---> 수정 처리
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
		
		//Update --> 수정처리(기존파일 유지)
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
	
	
	// insert --> 문의사항 글쓰기
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
	
	
	//Update ---> 조회수 업데이트
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
	
	
	//Select ---> 상세 정보
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
	
	//Select --> 전체 리스트
	public ArrayList<FaqVO> getList(){
		ArrayList<FaqVO> list = new ArrayList<FaqVO>();
		String sql = "select rownum rno, fid, name, ftitle, fhit, to_char(fdate, 'yyyy-mm-dd') fdate "
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

