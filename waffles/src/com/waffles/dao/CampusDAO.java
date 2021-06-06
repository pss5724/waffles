package com.waffles.dao;

import java.util.*;

import com.waffles.vo.CampusVO;

public class CampusDAO extends DAO {
	// Fields

	// Constructor
	public CampusDAO() {
		super();
	}

	// Method
	// 전체 캠퍼스 데이터 가져오기(최신데이터가 맨위로 나오게)
	public ArrayList<CampusVO> getCampusList() {
		ArrayList<CampusVO> list = new ArrayList<CampusVO>();

		try {
			String sql = "select * from campus order by desc";
			getPreparedStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				CampusVO vo = new CampusVO();
				vo.setLoction(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setTel(rs.getString(3));
				vo.setAddress(rs.getString(4));

				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 캠퍼스 전체 데이터 갯수 구하기
	public int getCampusDataCount() {
		int dataCount = 0;

		try {
			String sql = "SELECT COUNT(*) FROM CAMPUS";
			getPreparedStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dataCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dataCount;
	}

	// 해당 페이지 캠퍼스 데이터 가져오기
	public ArrayList<CampusVO> getPageData(int pageBegin, int pageEnd) {
		ArrayList<CampusVO> pageData = new ArrayList<CampusVO>();

		try {
			String sql = "SELECT * FROM (SELECT ROWNUM RNO, LOCATION, NAME, TEL, ADDRESS, COORDINATES, IMG FROM CAMPUS) "
						+ "WHERE RNO >= ?  AND RNO <= ?";
			getPreparedStatement(sql);

			pstmt.setInt(1, pageBegin);
			pstmt.setInt(2, pageEnd);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				CampusVO vo = new CampusVO();
				vo.setRno(rs.getInt(1));
				vo.setLoction(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setTel(rs.getString(4));
				vo.setAddress(rs.getString(5));
				vo.setCoordinates(rs.getString(6));
				vo.setImg(rs.getString(7));

				pageData.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		//close();
		return pageData;
	}

	// 해당 캠퍼스 상세정보 가져오기
	public CampusVO getCampusInformation(String name) {
		CampusVO vo = new CampusVO();
		
		try {
			String sql = "SELECT * FROM CAMPUS WHERE NAME=?";
			getPreparedStatement(sql);

			pstmt.setString(1, name);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				vo.setRno(rs.getInt(1));
				vo.setLoction(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setTel(rs.getString(4));
				vo.setAddress(rs.getString(5));
				vo.setCoordinates(rs.getString(6));
				vo.setImg(rs.getString(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		//close();
		return vo;
	}
	
}
