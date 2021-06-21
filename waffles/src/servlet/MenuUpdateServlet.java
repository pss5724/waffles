package servlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.waffles.dao.MenuDAO;
import com.waffles.vo.MenuVO;

@WebServlet("/MenuUpdateServlet")
public class MenuUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String originPath = request.getServletContext().getRealPath("images");
		StringBuffer path = new StringBuffer(originPath);
		path.delete(path.indexOf(".metadata"), path.length());
		path.toString();
		String savePath = path + "waffles\\waffles\\WebContent\\images\\menu";
		int sizeLimit = 1024*1024*15;
		                                                      
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());

		MenuDAO dao = new MenuDAO();
		MenuVO vo = new MenuVO();
		boolean result = false;
		MenuVO old_vo = new MenuVO();
		
		
		//이전 vo 가져오기 
		ArrayList<MenuVO> list = dao.getMenuList(1);
		for(int i=0; i< list.size(); i++) {
			if(list.get(i).getName().equals(multi.getParameter("name"))) {
				old_vo = list.get(i);
			}
		}
		
		if(multi.getOriginalFileName("imagefile") != null && multi.getOriginalFileName("ingredientfile") != null) {	
			vo.setName(multi.getParameter("name"));
			vo.setExplain(multi.getParameter("content"));
			vo.setKind(multi.getParameter("kind"));
			vo.setImg(multi.getFilesystemName("imagefile"));
			vo.setIngredient(multi.getFilesystemName("ingredientfile"));
			
			result = dao.getUpdateResult(vo);
			if(result) {
				String old_file_path = savePath + "/" + old_vo.getImg();
				String old_ifile_path = savePath + "/" + old_vo.getIngredient();
				File old_file = new File(old_file_path);
				File old_ifile = new File(old_ifile_path);
				
				if(old_file.exists() &&  old_ifile.exists()) {
					old_file.delete();
					old_ifile.delete(); 
				}
			}
		}else if(multi.getOriginalFileName("imagefile") != null){
			vo.setName(multi.getParameter("name"));
			vo.setExplain(multi.getParameter("content"));
			vo.setKind(multi.getParameter("kind"));
			vo.setImg(multi.getFilesystemName("imagefile"));
			vo.setIngredient(old_vo.getIngredient());
			result = dao.getUpdateResult(vo);
			if(result) {
				String old_file_path = savePath + "/" + old_vo.getImg();
				File old_file = new File(old_file_path);
				if(old_file.exists()) {
					old_file.delete();
				}
			}
		}else if(multi.getOriginalFileName("ingredientfile") != null) {
			vo.setName(multi.getParameter("name"));
			vo.setExplain(multi.getParameter("content"));
			vo.setKind(multi.getParameter("kind"));
			vo.setImg(old_vo.getImg());
			vo.setIngredient(multi.getFilesystemName("ingredientfile"));
			result = dao.getUpdateResult(vo);
			if(result) {
				String old_file_path = savePath + "/" + old_vo.getIngredient();
				File old_file = new File(old_file_path);
				if(old_file.exists()) {
					old_file.delete();
				}
			}
		} else {
			vo.setName(multi.getParameter("name"));
			vo.setExplain(multi.getParameter("content"));
			vo.setKind(multi.getParameter("kind"));
			vo.setImg(old_vo.getImg());
			vo.setIngredient(old_vo.getIngredient());
			
			result = dao.getUpdateResult(vo);
		}
		
		if(result){
			response.sendRedirect("http://localhost:9000/waffles/admin/menu/menuList.jsp");
		}
	}

}
