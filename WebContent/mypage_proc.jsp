<%@page import="java.net.ConnectException"%>
<%@page import="java.sql.Timestamp"%>
<%@include file="db_conn.jsp"%>
<%@include file="cookie.jsp"%>
<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("utf-8");

	String select_pw = "select pw from member where id = '"+cookie_id+"'";
	String select_email = "select email from member where id = '"+cookie_id+"'";
	String pw="";
	String email="";
	
	stmt = conn.createStatement();

	rs = stmt.executeQuery(select_pw);
	if(rs.next())
	pw = rs.getString("pw");
	rs = stmt.executeQuery(select_email);
	if(rs.next())
	email = rs.getString("email");
%>
<!DOCTYPE html>
<html>
<html>
    <head>
        <title></title>
        <meta charset=utf-8>
        <link rel="stylesheet" type="text/css" href="css/mypage.css">
    </head>
    <body>
	    <div class="mypage">
	        <div id=pic><img src="img/school.jpg"></div>
	        <div>
	            <table class="userinfo">
	            <form action="proc_mypage_update.jsp" name="frm" method="post">
	                <tr width="40%">
	                    <td width="50px"><p class="id">ID</p></td>
	                    <td width="250px"><%= cookie_id %></td>
	                </tr>
	                <tr>
	                    <td width="50px"><p class="pw">PW</p></td>
	                    <td width="250px"><textarea id="pw" name="pw"><%= pw %></textarea></td>
	                </tr>
	                <tr>
	                    <td width="50px"><p class="email">EMAIL</p></td>
	                    <td width="250px"><%= email %></td>
	                </tr>
	                <tr>
	                <td colspan=2 style="border:none; text-align: right;"><button type="submit" value="회원정보 수정" class="btn_re">회원정보 수정</button></td>
	                </tr>
	                </form>
	            </table>
	                
	            <table class="mypost">
	                <tr>
	                    <td colspan="3" height="100px"><div>내가 작성한 게시글</div></td>
	                </tr>
	                <tr height="20px">
						<th>숫자</th>
						<th>남은 날짜</th>
						<th class="td3">제목</th>
						<th>작성자</th>
						<th>날짜</th>
					</tr>
	<%
		
		int count = 0;
		
		String select_board_result = "select * from found_board where id = '"+cookie_id+"'";
		
		String select_board_count = "select count(*) from found_board where id = '"+cookie_id+"'";
		
		rs = stmt.executeQuery(select_board_count);
		if(rs.next()) count = rs.getInt(1);
		
		rs = stmt.executeQuery(select_board_result);
		
		if(count == 0){ %>
					<tr>
						<td colspan="5">게시물이 없습니다!</td>
					</tr>
	<%	}
		else {
			while(rs.next()){
				int bnum = rs.getInt("bnum");
				String d_day = rs.getString("d_day");
				String title = rs.getString("title");
				Timestamp date = rs.getTimestamp("date");
	%>
					<tr>
						<td><%= bnum%></td>
						<td><%= d_day %></td>
						<td><a href="table_found_content.jsp?id=<%= cookie_id %>"><%= title %></a></td>
						<td><%= cookie_id %></td>
						<td><%= date %></td>
					</tr>
		<%
			}
		}
		%>
	        	</table>
	        	
	        	<table class="lately">
	        		 <tr>
	                    <td colspan="3" height="100px"><div>최근에 본 게시물</div></td>
	                </tr>
	                <tr height="20px">
						<th>찾습니다</th>
						<th>찾아가세요</th>
						<th>유기물품</th>
					</tr>
	        	</table>
	                
				<table class="delete">
		        	<form action="proc_mypage_delete.jsp" name="frm" method="post">
			            <tr>
			            <td><button type="submit" class="btn_del">탈퇴하기</button></td>
			            </tr>
		            </form>
		        </table>
	        </div>
        </div>
    </body>
</html>