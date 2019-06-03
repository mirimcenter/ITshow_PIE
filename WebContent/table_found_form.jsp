<%@page import="java.net.ConnectException"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/table.css" />
</head>
<body>
<%@include file="db_conn.jsp"%>
<%@include file="cookie.jsp"%>
<table style="margin-top: 120px;">
	<tr style="position: relation; top: 80px;">
		<th>숫자</th>
		<th>남은 날짜</th>
		<th class="td3">제목</th>
		<th>작성자</th>
		<th>날짜</th>
	</tr>
<%

//페이징 처리----------------------------------------------------------

//객체 초기화
	final int ROWSIZE = 15; //한페이지에 보일 게시물 수
	final int BLOCK = 5;   //아래에 보일 페이지 최대 개수
	
	int PG = 1; //기본 페이지 값
	if(request.getParameter("pg")!= null){
		PG = Integer.parseInt(request.getParameter("pg"));
	}
	
	int allPage = 0; //전체 페이지 수
	
	int start = (PG*ROWSIZE)-(ROWSIZE-1); //해당 페이지에서 시작번호
	int end = (PG*ROWSIZE); //해당 페이지에서 끝 번호
	
	int startPage = ((PG-1)/BLOCK*BLOCK)+1; //시작 블럭 숫자
	int endPage = ((PG-1)/BLOCK*BLOCK)+BLOCK; //끝 블럭 숫자
//----------------------------------------------------------

	request.setCharacterEncoding("utf-8");
	int space = Integer.parseInt(request.getParameter("space"));
	int total = 0;
	
	System.out.println(space);
		
	String select_board_result = "select * from found_board where space=" + space + " order by bnum desc limit " + start + ", " + ROWSIZE ;
	String select_board_count = "select count(*) from found_board where space=" + space;
	
	stmt = conn.createStatement();
	rs = stmt.executeQuery(select_board_count);
	if(rs.next()) total = rs.getInt(1);

	//페이징 처리----------------------------------------------------------
	allPage = (int)Math.ceil(total/(double)ROWSIZE);
	  
	if(endPage > allPage) endPage = allPage;
	
    int currentNum= total - ((PG-1)*ROWSIZE)-1; //게시판 번호 구하기
	//----------------------------------------------------------
	
	rs = stmt.executeQuery(select_board_result);
	
	if(total == 0){ %>
	<tr>
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
	<tr>
		<td><%= currentNum %></td>
		<td><%= d_day %></td>
		<td><a href="table_found_content.jsp?space=<%= space %>&bnum=<%= bnum %>"><%= title %></a></td>
		<td><%= id %></td>
		<td><%= date %></td>
	</tr>
<% 

	currentNum--;
	} 
		} 
if(cookie_id != null){%>
	<tr>
		<td colspan="5"><a href="table_found_write.jsp?space=<%= space %>"><button>글쓰기</button></a></td>
	</tr>
<% } %>
</table>

<%
//페이징 처리----------------------------------------------------------
  if(PG>BLOCK){
 %>
  [<a href="table_found.jsp?pg=1&space=<%= space %>">◀◀</a>]
  [<a href="table_found.jsp?pg=<%=startPage-1%>&space=<%= space %>">◀</a>]
 <%
  }
 %>
 <%
  for(int i=startPage; i<=endPage; i++){
   if(i==PG){
 %>
  <U><B>[<%=i %>]</B></U>
 <%
   }else{
 %>
  [<a href="table_found.jsp?pg=<%=i %>&space=<%= space %>"><%=i %></a>]
 <%
   }
  }
 %>
 <%
  if(endPage<allPage){
 %>
  [<a href="table_found.jsp?pg=<%=endPage+1 %>&space=<%= space %>">▶</a>]
  [<a href="table_found.jsp?pg=<%=allPage %>&space=<%= space %>">▶▶</a>]
 <%
  }

//----------------------------------------------------------
 %>
</body>
</html>