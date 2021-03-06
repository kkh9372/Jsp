<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.co.Farmstory2.bean.ArticleBean"%>
<%@page import="kr.co.Farmstory2.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	//Multipart 전송 데이터 수신(파일 업로드와 동시에 처리)
	String path = request.getServletContext().getRealPath("/file");
	int maxSize = 1024 * 1024 * 10;
	
	MultipartRequest mRequest = new MultipartRequest(request, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());

	String cate = mRequest.getParameter("cate");
	String title = mRequest.getParameter("title");
	String content = mRequest.getParameter("content");
	String uid = mRequest.getParameter("uid");
	String uri = mRequest.getParameter("uri");
	String fname = mRequest.getFilesystemName("fname");
	String regip = request.getRemoteAddr();
	
	
	ArticleBean article = new ArticleBean();
	article.setCate(cate);
	article.setTitle(title);
	article.setContent(content);
	article.setFile(fname == null ? 0 : 1);
	article.setUid(uid);
	article.setRegip(regip);
	
	// 글 등록 후 글번호 리턴 받음 
	int seq = ArticleDao.getInstance().insertArticle(article);
	
	// 파일첨부 했으면 파일 처리작업
	if(fname != null){
		// 파일명 수정
		int i = fname.lastIndexOf(".");
		String ext = fname.substring(i);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMDDHHMMss_");
		String now = sdf.format(new Date());
		String newName = now+uid+ext;
		
		File oriFile = new File(path+"/"+fname);
		File newFile = new File(path+"/"+newName);
		
		oriFile.renameTo(newFile);
		// 파일 테이블 INSERT
		ArticleDao.getInstance().insertFile(seq, fname, newName);
	}

	response.sendRedirect(uri);	
%>