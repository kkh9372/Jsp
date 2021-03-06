<%@page import="kr.co.Farmstory1.dao.MemberDao"%>
<%@page import="kr.co.Farmstory1.bean.MemberBean"%>
<%@page import="kr.co.Farmstory1.db.DBConfig"%>
<%@page import="kr.co.Farmstory1.db.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%	
	// 전송 데이터 수신
	request.setCharacterEncoding("UTF-8"); // 한글데이터로 복호화

	String uid   = request.getParameter("uid");
	String pass1 = request.getParameter("pass1");
	String name  = request.getParameter("name");
	String nick  = request.getParameter("nick");
	String email = request.getParameter("email");
	String hp    = request.getParameter("hp");
	String zip   = request.getParameter("zip");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String regip = request.getRemoteAddr();
	
	try{
		
		Connection conn = DBConfig.getInstance().getConnection();
		
		PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_MEMBER);
		psmt.setString(1, uid);
		psmt.setString(2, pass1);
		psmt.setString(3, name);
		psmt.setString(4, nick);
		psmt.setString(5, email);
		psmt.setString(6, hp);
		psmt.setString(7, zip);
		psmt.setString(8, addr1);
		psmt.setString(9, addr2);
		psmt.setString(10, regip);
		psmt.executeLargeUpdate();
		psmt.close();
		conn.close();
	}catch(Exception e){ 
		
		e.printStackTrace();
	
	}
	
	// 리다이렉트
	response.sendRedirect("/Farmstory1/user/login.jsp");
%>