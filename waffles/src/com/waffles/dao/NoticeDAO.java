package com.waffles.dao;

import java.util.ArrayList;

import com.waffles.vo.NoticeVO;


public class NoticeDAO extends DAO{

	
	//Update ---> 조회수 업데이트
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
	
	
	//Select ---> 상세 정보
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
	
	//Select --> 전체 리스트
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

