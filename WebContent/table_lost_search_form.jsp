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
    //하루지날때마다 d_day - 1됨 --------------------------------------------------------
	    String d_Day_select = "select date, bnum from found_board where d_day > -7"; 
	
		Date today = new Date();
		Calendar cal = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();
		cal.setTime(today);
		
		System.out.println ( cal.get ( Calendar.YEAR ) + "년 " + 
		( cal.get ( Calendar.MONTH ) + 1 ) + "월 " + 
		cal.get ( Calendar.DATE ) + "일" );
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(d_Day_select);
		
		while(rs.next()){
			int bnum = rs.getInt("bnum");
			Date date = rs.getDate("date");
			
			System.out.println(bnum + " : " + date);
		
			String d_Day_update = "update found_board set d_day=? where bnum="+bnum;
			
			cal2.setTime(date);
			
			int count = 0;
			
			while(!cal2.after(cal)){
				count++;
				cal2.add(Calendar.DATE,1); //다음날로 바뀜
				
				System.out.println ( cal2.get ( Calendar.YEAR ) + "년 " + 
				( cal2.get ( Calendar.MONTH ) + 1 ) + "월 " + 
				cal2.get ( Calendar.DATE ) + "일" );
			}
			
			pstmt = conn.prepareStatement(d_Day_update); 
			pstmt.setInt(1,8-count);
			pstmt.executeUpdate(); 
		}
    //------------------------------------------------------------------------------------
    %>
    <%
		request.setCharacterEncoding("utf-8");
		int search_type = Integer.parseInt(request.getParameter("search_type"));
		String search_text = request.getParameter("search_text");
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


		String search_type_text = "";
		
		if(search_type == 1) search_type_text = "id like";
		else if(search_type == 2) search_type_text = "title like";
			
		String select_board_search = "select * from found_board where "
		+ search_type_text + " '%" +search_text + "%' and d_day <= 0 order by bnum desc limit " + offset + ", " + ROWSIZE ;
		String select_board_count = "select count(*) from found_board where "
		+ search_type_text + " '%" + search_text + "%' and d_day <= 0";
			
		stmt = conn.createStatement();
		rs = stmt.executeQuery(select_board_count);
		if(rs.next()) total = rs.getInt(1);
    %>
<table id="search_view">
	<form action="table_lost_search.jsp" name="frm" method="post">
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
<table id="table_view" style="margin-top: 100px;">
	<tr>
		<td colspan="4">총 <%=total %>건의 글이 있습니다.</td>
	<%if(cookie_id != null){%>
		<td style="text-align:right;"><a href="table_lost_search.jsp"><button id="board_write_btn">글쓰기</button></a></td>
	<% } %>
	</tr>
	<tr style="position: relation; top: 80px;">
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
	
	rs = stmt.executeQuery(select_board_search);
	
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
			String id = rs.getString("id");
			Timestamp date = rs.getTimestamp("date");
%>
	<tr class="table_view_tr">
		<td style="text-align:center"><%= currentNum %></td>
		<td style="text-align:center"><%= d_day %></td>
		<td><a href="table_lost_search.jsp?bnum=<%= bnum %>"><%= title %></a></td>
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
		  <td><a href="table_lost_search.jsp?pg=1&search_type=<%=search_type%>&search_text=<%=search_text%>"><<</a></td>
	 	<%}
	  	if(PG>BLOCK){
		 %>
		  <td><a href="table_lost_search.jsp?pg=<%=startPage-1%>&search_type=<%=search_type%>&search_text=<%=search_text%>"><</a></td>
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
		  <td><a href="table_lost_search.jsp?pg=<%=i %>&search_type=<%=search_type%>&search_text=<%=search_text%>"><%=i %></a></td>
		 <%
		   }
		  }
		 }
		 if(endPage<allPage) {%>
		  <td><a href="table_lost_search.jsp?pg=<%=endPage+1 %>&search_type=<%=search_type%>&search_text=<%=search_text%>">></a></td>
		  <%} 
		  if(total != 0){%>
		  <td><a href="table_lost_search.jsp?pg=<%=allPage %>&search_type=<%=search_type%>&search_text=<%=search_text%>">>></a></td>
		  <%} %>
	 </tr>
  </table>
</body>
</html>