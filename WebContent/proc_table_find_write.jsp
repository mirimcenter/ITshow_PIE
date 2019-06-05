<%@page import="java.sql.Timestamp"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db_conn.jsp"%>
<%@include file="cookie.jsp"%>
<%
	request.setCharacterEncoding("utf-8");

	String file_url = request.getParameter("file");
	String contents = request.getParameter("contents");
	String title = request.getParameter("title");
	Timestamp date = new Timestamp(System.currentTimeMillis());
	
	String board_query = "";

	board_query = "insert into find_board (title, contents, id, img, date) value (?, ?, ?, ?,?)";
	
	try{ 
		
		//board내용 -> db저장
		pstmt = conn.prepareStatement(board_query); 
		pstmt.setString(1,title); 
		pstmt.setString(2,contents); 
		pstmt.setString(3,cookie_id);
		pstmt.setTimestamp(5,date);
		if(file_url != ""){
			File imgfile = new File(file_url); 
			FileInputStream fin = new FileInputStream(imgfile); 
			pstmt.setBinaryStream(4,fin,(int)imgfile.length());
		}
		else{
			pstmt.setNull(4,java.sql.Types.NULL);
		}
		pstmt.executeUpdate(); 
		System.out.println("Inserting Board Successfully!"); 
		pstmt.close(); 
		conn.close(); 
		} 
	catch (Exception e){ 
		System.out.println(e.getMessage()); 
	} 
	finally{
		response.sendRedirect("table_find.jsp");
	}

%>