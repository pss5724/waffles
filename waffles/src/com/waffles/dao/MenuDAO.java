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
	//메뉴(menu.jsp)
	public ArrayList<MenuVO> getMenuList() {
		ArrayList<MenuVO> list = new ArrayList<MenuVO>();
		 
		String sql = "select * from menu";
		getPreparedStatement(sql);
		
		try {
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
	
	//메뉴 상세정보(menu_detail.jsp)
	public MenuVO getMenuDetail(String name) {
		MenuVO vo = new MenuVO(); 
		
		String sql = "select * from menu where name=?"; 
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, name);
			rs=pstmt.executeQuery();

			if(rs.next()) {
				vo.setKind(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setImg(rs.getString(3));
				vo.setExplain(rs.getString(4));
				vo.setIngredient(rs.getString(5));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	
	
	
	
	
}
