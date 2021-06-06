package com.waffles.dao;

import java.util.ArrayList;

import com.waffles.vo.MenuVO;

public class MenuDAO extends DAO {
	// Constructor
	 public MenuDAO() {
		 super();
	}

	//메뉴소개(menu.jsp) : 전체메뉴 데이터 가져오기(이미지와 메뉴명만 출력)
	public ArrayList<MenuVO> getMenuList() {
		ArrayList<MenuVO> list = new ArrayList<MenuVO>();
		 
		String sql = "SELECT IMG, NAME FROM MENU";
		getPreparedStatement(sql);
		
		try {
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MenuVO menu = new MenuVO();
				menu.setImg(rs.getString(1));
				menu.setName(rs.getString(2));
				list.add(menu);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//메뉴소개(menu.jsp) : menu-bar 클릭시 해당 데이터 가져오기(이미지와 메뉴명만 출력)
		public ArrayList<MenuVO> getMenuList(String kind) {
			ArrayList<MenuVO> list = new ArrayList<MenuVO>();
			
			String sql = "SELECT IMG, NAME FROM MENU WHERE KIND=?";
			getPreparedStatement(sql);
			
			try {
				pstmt.setString(1, kind);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					MenuVO menu = new MenuVO();
					menu.setImg(rs.getString(1));
					menu.setName(rs.getString(2));
					list.add(menu);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		}
	
	//메뉴소개(menu_bar.jsp) : waffle-bar 클릭시 해당 데이터 가져오기(이미지와 메뉴명만 출력)
		public ArrayList<MenuVO> getWaffleList(String kind) {
			ArrayList<MenuVO> list = new ArrayList<MenuVO>();
			
			String sql = "SSELECT IMG, NAME FROM MENU WHERE NAME IN (SELECT NAME FROM WAFFLES WHERE KIND=?)";
			getPreparedStatement(sql);
			
			try {
				pstmt.setString(1, kind);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					MenuVO menu = new MenuVO();
					menu.setImg(rs.getString(1));
					menu.setName(rs.getString(2));
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
