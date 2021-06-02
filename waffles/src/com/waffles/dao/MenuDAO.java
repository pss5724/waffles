package com.waffles.dao;

import java.util.ArrayList;

import com.waffles.vo.MenuVO;

public class MenuDAO extends DAO {
	//Fields

	// Constructor
	 public MenuDAO() {
		 super();
	}

	// Method
	//메뉴
	public ArrayList<MenuVO> getMenuList() {
		ArrayList<MenuVO> list = new ArrayList<MenuVO>();
		 
		try {
			String sql = "select * from menu";
			getPreparedStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MenuVO menu = new MenuVO();
				menu.setKind(rs.getString(1));
				menu.setName(rs.getString(2));
				menu.setImg(rs.getString(3));
				menu.setExplain(rs.getString(4));
				menu.setIngredient(rs.getString(5));
				list.add(menu);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	return list;
	}
	
	//상세 메뉴
	
	
	
}
