package com.waffles.dao;

import java.util.ArrayList;

import com.waffles.vo.SuccessStoryVO;

public class SuccessStoryDAO extends DAO{

	// Constructor
	public SuccessStoryDAO() {
		super();
	}

	// Method
	// 전체 창업스토리 데이터 가져오기(최신데이터가 맨위로 나오게)
	public ArrayList<SuccessStoryVO> getStoryList() {
		ArrayList<SuccessStoryVO> list = new ArrayList<SuccessStoryVO>();

		try {
			String sql = "select no, img, title from success_story order by no desc";
			getPreparedStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				SuccessStoryVO vo = new SuccessStoryVO();
				vo.setNo(rs.getInt(1));
				vo.setImg(rs.getString(2));
				vo.setTitle(rs.getString(3));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// 
	public SuccessStoryVO getStoryViewList(String no) {
		SuccessStoryVO vo = new SuccessStoryVO();
		
		try {
			String sql = "select * from success_story where no=?";
			getPreparedStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(no));
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				vo.setNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setImg(rs.getString(3));
				vo.setId(rs.getString(4));
				vo.setSdate(rs.getString(5));
				vo.setContent(rs.getString(6));
				vo.setHit(rs.getInt(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	//update --> 조회수 업데이트
		 public void getUpdateHit(String bid) {
			 String sql = "update mycgv_board set bhit = bhit + 1 where bid=?";
			 getPreparedStatement(sql);
			 
			 try {
				pstmt.setString(1, bid);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			 close();
		 }
	
}
