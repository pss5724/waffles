package waffles.dao;

import waffles.vo.CampusVO;

public class MenuDAO extends DAO {
	//Fields

	// Constructor
	 public MenuDAO() {
		 super();
	}

	// Method
	 public CampusVO getCampusList() {
		 CampusVO list = new CampusVO();
		 
		 try {
			String sql = "select * from campus";
			getPreparedStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.setLoction(rs.getString(1));
				list.setName(rs.getString(2));
				list.setHp(rs.getString(3));
				list.setAddress(rs.getString(4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
		 return list;
	 }
	 
}
