package com.waffles.dao;

import java.util.ArrayList;

import com.waffles.vo.FaqVO;


public class FaqDAO extends DAO{
	
	
	
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

