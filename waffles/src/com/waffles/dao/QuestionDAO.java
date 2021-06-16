package com.waffles.dao;

import java.util.ArrayList;

import com.waffles.vo.QuestionVO;

public class QuestionDAO extends DAO {
	
	// select ---> 모든 정보 가져오기
	public ArrayList<QuestionVO> getList() {
		ArrayList<QuestionVO> list = new ArrayList<QuestionVO>();
		String sql = " select rownum rno, qid, qtitle, qwriter, qdate, qhit "
					+ " from (select qid, qtitle, qwriter, to_char(qdate, 'yy-mm-dd') qdate, qhit from waffle_setupfaq "
					+ " order by qdate asc) ";
		getPreparedStatement(sql);
		
		try {
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				QuestionVO vo = new QuestionVO();
				
				vo.setRno(rs.getInt(1));
				vo.setQid(rs.getString(2));
				vo.setQtitle(rs.getString(3));
				vo.setQwriter(rs.getString(4));
				vo.setQdate(rs.getString(5));
				vo.setQhit(rs.getInt(6));
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		
		return list;
	}
	
	// update ---> 조회수 증가
	public void getUpdateHit(String qid) {
		String sql = "update waffle_setupfaq set qhit = qhit + 1 where qid = ? ";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, qid);
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
	}
}
