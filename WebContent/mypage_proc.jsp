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
        <link rel="stylesheet" type="text/css" href="css/table.css" />
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
	                <tr style="border-bottom:none;">
	                    <td width="50px"><p class="email">EMAIL</p></td>
	                    <td width="250px"><%= email %></td>
	                </tr>
	                <tr style="border-bottom:none;">
	                <td colspan=2><button type="submit" value="회원정보수정" class="btn_re">회원정보수정</button></td>
	                </tr>
	                </form>
	            </table>
	                
<%
		request.setCharacterEncoding("utf-8");
		int total = 0;

		//페이징 처리----------------------------------------------------------

		//객체 초기화
			final int ROWSIZE = 5; //한페이지에 보일 게시물 수
			final int BLOCK = 5;   //아래에 보일 페이지 최대 개수
			
			int PG = 1; //기본 페이지 값
			if(request.getParameter("pg")!= null){
				PG = Integer.parseInt(request.getParameter("pg"));
			}
			
			int allPage = 0; //전체 페이지 수
			
			int offset = ROWSIZE*(PG-1);
			
			int start = (PG*ROWSIZE)-(ROWSIZE-1); //해당 페이지에서 시작번호
			int end = (PG*ROWSIZE); //해당 페이지에서 끝 번호
			
			int startPage = ((PG-1)/BLOCK*BLOCK)+1; //시작 블럭 숫자
			int endPage = ((PG-1)/BLOCK*BLOCK)+BLOCK; //끝 블럭 숫자
		//----------------------------------------------------------


			
		String select_board_result = "select * from found_board where id = '"+cookie_id+"' order by bnum desc limit " + offset + ", " + ROWSIZE ;
		String select_board_count = "select count(*) from found_board where id = '"+cookie_id+"'";
				
		stmt = conn.createStatement();
		rs = stmt.executeQuery(select_board_count);
		if(rs.next()) total = rs.getInt(1);
    %> 
	            <table id="table_view">
	                <tr>
	                    <td colspan="3" height="100px" style="margin-left: 100px;"><div>내가 작성한 게시글</div></td>
	                </tr>
	                
	                <tr height="20px">
						<th>숫자</th>
						<th>남은 날짜</th>
						<th class="td3">제목</th>
						<th>작성자</th>
						<th>날짜</th>
					</tr>
<%
	//페이징 처리----------------------------------------------------------
	allPage = (int)Math.ceil(total/(double)ROWSIZE);
	  
	if(endPage > allPage) endPage = allPage;
	
    int currentNum= total - ((PG-1)*ROWSIZE); //게시판 번호 구하기
	//----------------------------------------------------------
	
	rs = stmt.executeQuery(select_board_result);
	
	if(total == 0){ %>
	<tr class="table_view_tr">
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
					<tr class="table_view_tr">
						<td><%= bnum%></td>
						<td><%= d_day %></td>
						<td><a href="table_found_content.jsp?id=<%= cookie_id %>"><%= title %></a></td>
						<td><%= cookie_id %></td>
						<td><%= date %></td>
					</tr>
<% 

	currentNum--;
	} 
		} 
%>
				</table>
			<table id="table_paging">
			 	<tr>
			 		<% if(total != 0){ %>
					  <td><a href="mypage.jsp?pg=1"></a></td>
					 <%}
			 		if(PG>BLOCK){ %>
					  <td><a href="mypage.jsp?pg=<%=startPage-1%>"></a></td>
<%}
					 if(total == 0){ 
%>
						<td style="border:2px solid black;"><B style="color:black;">1</B></td>
<% }
					 else{
					  for(int i=startPage; i<=endPage; i++){
					   if(i==PG){
%>
					  	<td style="border:2px solid black;"><B style="color:black;"><%=i %></B></td>
<%
					   	}else{
%>
					  	<td><a href="mypage.jsp?pg=<%=i %>"><%=i %></a></td>
<%
					   	}
					  	}
					 	}
					 	if(endPage<allPage) {
%>
					  	<td><a href="mypage.jsp?pg=<%=endPage+1 %>"></a></td>
<%} 
					   	if(total != 0){
%>
					  	<td><a href="mypage.jsp?pg=<%=allPage %>"></a></td>
<%} %>
				 	</tr>
			  	</table>
			    <button type="submit" class="btn_del">탈퇴하기</button>
	        </div>
        </div>
    </body>
</html>