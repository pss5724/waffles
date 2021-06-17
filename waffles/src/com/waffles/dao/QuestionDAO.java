package com.waffles.dao;

import java.util.ArrayList;

import com.waffles.vo.QuestionVO;

public class QuestionDAO extends DAO {
	
	/* select ---> 모든 정보 가져오기 */
	public ArrayList<QuestionVO> getList() {
		ArrayList<QuestionVO> list = new ArrayList<QuestionVO>();
		String sql = " select rownum rno, qid, qtitle, qwriter, qdate, qhit "
					+ " from (select qid, qtitle, qwriter, to_char(qdate, 'yy-mm-dd') qdate, qhit from waffle_setupfaq "
					+ " order by qid desc) ";
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
	
	
	/* 창업FAQ 글 클릭시 내용 */
	public QuestionVO getContent(String qid) {
		QuestionVO vo = new QuestionVO();
		String sql = " select qid, qtitle, qwriter, to_char(qdate, 'yy-mm-dd'), qhit, qcontent from waffle_setupfaq where qid = ? ";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, qid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setQid(rs.getString(1));
				vo.setQtitle(rs.getString(2));
				vo.setQwriter(rs.getString(3));
				vo.setQdate(rs.getString(4));
				vo.setQhit(rs.getInt(5));
				vo.setQcontent(rs.getString(6));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	/* update ---> 조회수 증가 */
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
	
	/* 잠깐 게시판 글쓰기 - update하면 엔터키 안먹어서 이렇게 insert */
	public boolean getInsertResult(QuestionVO vo) {
		boolean result = false;
		String sql = " insert into waffle_setupfaq values('q_'||sequ_setupfaq.nextval, ?, ?, sysdate, 0, ?) ";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, vo.getQtitle());
			pstmt.setString(2, vo.getQwriter());
			pstmt.setString(3, vo.getQcontent());
			
			int value = pstmt.executeUpdate();
			
			if(value != 0) result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
}
