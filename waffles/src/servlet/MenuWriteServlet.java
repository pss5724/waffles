package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.waffles.dao.MenuDAO;
import com.waffles.vo.MenuVO;

@WebServlet("/MenuWriteServlet")
public class MenuWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//파일이 저장될 서버의 경로. 되도록이면 getRealPath를 이용하자.
		//String savePath = request.getServletContext().getRealPath("/upload");
		String originPath = request.getServletContext().getRealPath("images");
		StringBuffer path = new StringBuffer(originPath);
		path.delete(path.indexOf(".metadata"), path.length());
		path.toString();
		String savePath = path + "waffles\\waffles\\WebContent\\images\\menu";
		//파일 크기 15MB로 제한
		int sizeLimit = 1024*1024*15;
		                                                      
		//↓ request 객체,               ↓ 저장될 서버 경로,       ↓ 파일 최대 크기,    ↓ 인코딩 방식,       ↓ 같은 이름의 파일명 방지 처리
		//(HttpServletRequest request, String saveDirectory, int maxPostSize, String encoding, FileRenamePolicy policy)
		//아래와 같이 MultipartRequest를 생성만 해주면 파일이 업로드 된다.(파일 자체의 업로드 완료)
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
		
		//파일명 확인

		MenuVO vo = new MenuVO();
		vo.setName(multi.getParameter("name"));
		vo.setExplain(multi.getParameter("content"));
		vo.setKind(multi.getParameter("kind"));
		vo.setImg(multi.getFilesystemName("imagefile"));
		vo.setIngredient(multi.getFilesystemName("ingredientfile"));
		
		MenuDAO dao = new MenuDAO();
		boolean result = dao.getInsertResult(vo);
		
		if(result){
			response.sendRedirect("http://localhost:9000/waffles/admin/menu/menuList.jsp");
		}
	}

}
