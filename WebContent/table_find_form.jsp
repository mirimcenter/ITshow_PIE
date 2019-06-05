<%@page import="java.net.ConnectException"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/table.css" />
<script src="js/formChk.js"></script>
</head>
<body>
<%@include file="db_conn.jsp"%>
<%@include file="cookie.jsp"%>
    
    <%
		request.setCharacterEncoding("utf-8");
		int total = 0;


		//페이징 처리----------------------------------------------------------

		//객체 초기화
			final int ROWSIZE = 15; //한페이지에 보일 게시물 수
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


			
		String select_board_result = "select * from find_board order by bnum desc limit " + offset + ", " + ROWSIZE ;
		String select_board_count = "select count(*) from find_board";
				
		stmt = conn.createStatement();
		rs = stmt.executeQuery(select_board_count);
		if(rs.next()) total = rs.getInt(1);
    %>
<table id="search_view">
	<form action="table_find_search.jsp" name="frm" method="post">
		<tr>
			<td>
				<select name="search_type">
					<option value="1">아이디</option>
					<option value="2">제목</option>
				</select>
			</td>
			<td><input type="text" name="search_text"></td>
			<td><input type="button" value="확인" class="board_btn" onclick="formChk_search();"></td>
		</tr>
	</form>
</table>
<table id="table_view">
	<tr>
		<td colspan="3">총 <b style="color:#c5e5bc;"><%=total %></b>건의 글이 있습니다.</td>
	<%if(cookie_id != null){%>
		<td style="text-align:right;"><a href="table_find_write.jsp"><button class="board_btn">글쓰기</button></a></td>
	<% } %>
	</tr>
	<tr style="position: relation; top: 80px;">
		<th>숫자</th>
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
			String title = rs.getString("title");
			String id = rs.getString("id");
			Timestamp date = rs.getTimestamp("date");
%>
	<tr class="table_view_tr">
		<td style="text-align:center"><%= currentNum %></td>
		<td><a href="table_find_content.jsp?bnum=<%= bnum %>"><%= title %></a></td>
		<td style="text-align:center"><%= id %></td>
		<td style="text-align:center"><%= date %></td>
	</tr>
<% 

	currentNum--;
	} 
		} 
%>
</table>

<%
//페이징 처리----------------------------------------------------------
 %>
 <table id="table_paging">
 	<tr>
 		<% if(total != 0){ %>
		  <td><a href="table_find.jsp?pg=1"><<</a></td>
		 <%}
 		if(PG>BLOCK){ %>
		  <td><a href="table_find.jsp?pg=<%=startPage-1%>"><</a></td>
		 <%}
		 if(total == 0){ %>
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
		  <td><a href="table_find.jsp?pg=<%=i %>"><%=i %></a></td>
		 <%
		   }
		  }
		 }
		 if(endPage<allPage) {%>
		  <td><a href="table_find.jsp?pg=<%=endPage+1 %>">></a></td>
		  <%} 
		   if(total != 0){%>
		  <td><a href="table_find.jsp?pg=<%=allPage %>">>></a></td>
		  <%} %>
	 </tr>
  </table>
</body>
</html>