package com.waffles.dao;

import java.util.ArrayList;

import com.waffles.vo.FaqVO;


public class FaqDAO extends DAO{
	
	
	
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
	
	
}

