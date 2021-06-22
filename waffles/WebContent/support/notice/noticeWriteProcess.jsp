<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.waffles.dao.*, com.waffles.vo.*"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%> 
    
<%
	//파일이 저장될 서버의 경로. 되도록이면 getRealPath를 이용하자.
	String savePath = request.getServletContext().getRealPath("/upload");
	
	//파일 크기 15MB로 제한
	int sizeLimit = 1024*1024*15;
	                                                      
	//↓ request 객체,               ↓ 저장될 서버 경로,       ↓ 파일 최대 크기,    ↓ 인코딩 방식,       ↓ 같은 이름의 파일명 방지 처리
	//(HttpServletRequest request, String saveDirectory, int maxPostSize, String encoding, FileRenamePolicy policy)
	//아래와 같이 MultipartRequest를 생성만 해주면 파일이 업로드 된다.(파일 자체의 업로드 완료)
	MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
	
	//파일명 확인



	NoticeVO vo = new NoticeVO();
	vo.setNtitle(multi.getParameter("ntitle"));
	vo.setNcontent(multi.getParameter("ncontent"));
	vo.setNfile(multi.getOriginalFileName("nfile"));
	vo.setNsfile(multi.getFilesystemName("nfile"));
	vo.setName(multi.getParameter("name"));
	
	NoticeDAO dao = new NoticeDAO();
	boolean result = dao.getInsertResult(vo);
	if(result){
		response.sendRedirect("notice_list.jsp");
	}
	
	
%>
