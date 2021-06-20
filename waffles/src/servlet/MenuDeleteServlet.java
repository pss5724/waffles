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

@WebServlet("/MenuDeleteServlet")
public class MenuDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String originPath = request.getServletContext().getRealPath("images");
		StringBuffer path = new StringBuffer(originPath);
		path.delete(path.indexOf(".metadata"), path.length());
		path.toString();
		String savePath = path + "waffles\\waffles\\WebContent\\images\\menu";
	
		MenuDAO dao = new MenuDAO();
		MenuVO vo = new MenuVO();
		boolean result = false;
		
		ArrayList<MenuVO> list = dao.getMenuList(1);
		for(int i=0; i< list.size(); i++) {
			if(list.get(i).getName().equals(request.getParameter("name"))) {
				vo = list.get(i);
			}
		}
		
			
		result = dao.getDeleteResult(vo);
		if(result) {
			String old_file_path = savePath + "/" + vo.getImg();
			String old_ifile_path = savePath + "/" + vo.getIngredient();
			File old_file = new File(old_file_path);
			File old_ifile = new File(old_ifile_path);
			
			if(old_file.exists() &&  old_ifile.exists()) {
				old_file.delete();
				old_ifile.delete(); 
			}
		}
		
		if(result){
			response.sendRedirect("http://localhost:9000/waffles/admin/menu/menuList.jsp");
		}
	}

}
