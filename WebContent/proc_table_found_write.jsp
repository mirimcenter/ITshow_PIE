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
	int space = Integer.parseInt(request.getParameter("space"));
	Timestamp date = new Timestamp(System.currentTimeMillis());
	
	String board_query = "";

	board_query = "insert into found_board (title, contents, date, space, id, img, d_day) value (?, ?, ?, ?, ?, ?, 7)";
	
	try{ 
		
		//board내용 -> db저장
		pstmt = conn.prepareStatement(board_query); 
		pstmt.setString(1,title); 
		pstmt.setString(2,contents); 
		pstmt.setTimestamp(3,date);
		pstmt.setInt(4,space);
		pstmt.setString(5,cookie_id);
		if(file_url != ""){
			File imgfile = new File(file_url); 
			FileInputStream fin = new FileInputStream(imgfile); 
			pstmt.setBinaryStream(6,fin,(int)imgfile.length());
		}
		else{
			pstmt.setNull(6,java.sql.Types.NULL);
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
		response.sendRedirect("table_found.jsp?space=" + space);
	}

%>