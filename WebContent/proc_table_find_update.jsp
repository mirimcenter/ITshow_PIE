<%@page import="java.sql.Timestamp"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db_conn.jsp"%>
<%
	request.setCharacterEncoding("utf-8");

	int bnum = Integer.parseInt(request.getParameter("bnum"));
	String file_url = request.getParameter("file");
	String contents = request.getParameter("contents");
	String title = request.getParameter("title");
	
	String update_query = "";

	if(file_url != ""){
		update_query = "update find_board set title=?,contents=?,img=? where bnum="+bnum;
	}
	else{
		update_query = "update find_board set title=?,contents=? where bnum="+bnum;
	}
	
	try{ 
		
		//board내용 -> db저장
		pstmt = conn.prepareStatement(update_query); 
		pstmt.setString(1,title); 
		pstmt.setString(2,contents);
		if(file_url != ""){
			File imgfile = new File(file_url); 
			FileInputStream fin = new FileInputStream(imgfile); 
			pstmt.setBinaryStream(3,fin,(int)imgfile.length());
		}
		pstmt.executeUpdate(); 
		System.out.println("Update Board Successfully!"); 
		pstmt.close(); 
		conn.close(); 
		} 
	catch (Exception e){ 
		System.out.println(e.getMessage()); 
	} 
	finally{
		response.sendRedirect("table_find_content.jsp?bnum=" + bnum);
	}

%>