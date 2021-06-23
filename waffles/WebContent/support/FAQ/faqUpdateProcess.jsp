<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.waffles.vo.*, com.waffles.dao.*,java.io.*"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%
	//파일이 저장될 서버의 경로. 되도록이면 getRealPath를 이용하자.
String savePath = request.getServletContext().getRealPath("/upload");
//파일 크기 15MB로 제한
int sizeLimit = 1024 * 1024 * 15;

//↓ request 객체,               ↓ 저장될 서버 경로,       ↓ 파일 최대 크기,    ↓ 인코딩 방식,       ↓ 같은 이름의 파일명 방지 처리
//(HttpServletRequest request, String saveDirectory, int maxPostSize, String encoding, FileRenamePolicy policy)
//아래와 같이 MultipartRequest를 생성만 해주면 파일이 업로드 된다.(파일 자체의 업로드 완료)
MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
//파일명 확인

FaqVO vo = new FaqVO();
FaqDAO dao = new FaqDAO();
boolean result = false;

if (multi.getOriginalFileName("ffile") != null) {
	//새로운 파일 선택
	vo.setFid(multi.getParameter("fid"));
	vo.setFtitle(multi.getParameter("ftitle"));
	vo.setFcontent(multi.getParameter("fcontent"));
	vo.setFfile(multi.getOriginalFileName("ffile"));
	vo.setFsfile(multi.getFilesystemName("ffile"));
	vo.setPass(multi.getParameter("pass"));
	
	result = dao.getUpdateResult(vo); // 파일 포함 업데이트
	if (result) {
		//기존파일을 upload 폴더에서 삭제
		String old_file_path = savePath + "/" + multi.getParameter("fsfile_old");
		File old_file = new File(old_file_path);

		if (old_file.exists()) {
			if (old_file.delete()) {
			}
		}
	}
	
} else {
	//기존 파일 유지
	vo.setFid(multi.getParameter("fid"));
	vo.setFtitle(multi.getParameter("ftitle"));
	vo.setFcontent(multi.getParameter("fcontent"));
	vo.setPass(multi.getParameter("pass"));
	result = dao.getUpdateResultNofile(vo); // 파일 포함하지 않은 업데이트
}

if (result) {
%>
	<script>
		alert("성공적으로 글이 수정되었습니다");
 		location.href= "faq_list.jsp";
		</script>
<% }
%>