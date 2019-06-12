<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<%@ include file="db_conn.jsp"%>
<!DOCTYPE html>
<html>
    <head>
    
        <meta charset=utf-8>
        <title>미림 분실물 센터</title>
       	<link rel="stylesheet" type="text/css" href="css/slick.css">
		<link rel="stylesheet" type="text/css" href="css/slick-theme.css">
    	<link rel="stylesheet" type="text/css" href="css/examples.css" />
    	<link rel="stylesheet" type="text/css" href="css/index_slide.css"/>
	<style>
		div.img{
		margin-top:50px;
			width:100%;
			height:300px
		}
		
		input {
		background-color:transparent;
		font-size:13px;
  		border: 2px solid black;
  		border-radius:5px;
 		color: black;
 		font-weight:bold;
		padding: 13px 45px;
		text-decoration: none;
		margin: 4px 2px;
		cursor: pointer;
		position:relative;
		top:180px;
		}
	</style>
    </head>
    <body>
<%
ArrayList<String> entire_img = new ArrayList<String>();
int null_chk;
String select_title = "select * from found_board";
pstmt = conn.prepareStatement(select_title);
rs = pstmt.executeQuery();

while(rs.next()) {
	null_chk = rs.getString("img")==null?0:1;
	if(null_chk==1) entire_img.add(rs.getString("bnum"));
}

%>
	<img src="img/main.png" style="margin-bottom: 100px">
	<img src="img/first.png">
	<div style="color:black;">
	<center>
	<section class="autoplay slider" style="width:1500px;padding:100px;display:inline-block;background-color: rgba( 255, 255, 255, 0.5 );" >
					<%
						for(int i=0;i<entire_img.size();i++) {
					%>
					<div>
						<a href="table_found_content.jsp?bnum=<%= entire_img.get(i) %>"><img style="width:250px;height:250px;" src="img_view.jsp?bnum=<%= entire_img.get(i) %>"></a>
					</div>
					<%
						}
					%>
	</section>
	</center>
	<div style="margin-left: 300px;font-weight: bold;">
	| 오늘 들어온 분실물은 <%=entire_img.size()%>개입니다.</div>
	</div>
	
	<div class="img" style="background-image:url('img/img1.png');">
	<input type="button" value="찾으러 가기" style="left:1080px;" onClick="location.href='table_find.jsp'">
	</div>
	<div class="img" style="background-image:url('img/img2.png');">
	<input type="button" value="올리러 가기" style="left:480px" onClick="location.href='map_main1F.jsp'">
	</div>
	<div class="img" style="background-image:url('img/img3.png');">
	<input type="button" value="만나러 가기"style="left:1100px;" onClick="location.href='table_lost.jsp'">
	</div>
	<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
  <script src="js/slick.js" charset="utf-8"></script>
  <script>
  $(document).on('ready',function(){
	  $('.autoplay').slick({
		  slidesToShow: 3,
		  slidesToScroll: 1,
		  autoplay: true,
		  autoplaySpeed: 2000,
		});   
  });
  </script>
  </body>
</html>
