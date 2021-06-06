package com.waffles.dao;

import java.util.*;

import com.waffles.vo.CampusVO;

public class CampusDAO extends DAO {
	//Fields

	// Constructor
	 public CampusDAO() {
		 super();
	}

	// Method
	 public ArrayList<CampusVO> getCampusList() {
		 ArrayList<CampusVO> list = new ArrayList<CampusVO>();
		 
		 try {
			String sql = "select * from campus order by desc";
			getPreparedStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
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
	 
	 
}
