<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db_conn.jsp"%>
<% 
      	request.setCharacterEncoding("utf-8");

		String email = request.getParameter("email");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		String member_query = "insert into member (email, id, pw) value (?, ?, ?)";
		
		try{			
			pstmt = conn.prepareStatement(member_query); 
			pstmt.setString(1,email);
			pstmt.setString(2,id);
			pstmt.setString(3,pw);
			pstmt.executeUpdate();
			
			System.out.println("Inserting Board Successfully!"); 
			pstmt.close(); 
			conn.close();
%>
			<jsp:forward page="Template.jsp">
				<jsp:param value="join_result_proc.jsp" name="CONTENTPAGE"/>
			</jsp:forward>
<% 
		}catch (Exception e){ 
			System.out.println(e.getMessage());
%>
			<jsp:forward page="Template.jsp">
				<jsp:param value="join_fail.jsp" name="CONTENTPAGE"/>
			</jsp:forward>
<%
		}
%>

