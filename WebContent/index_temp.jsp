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

	<img src="img/main.png" style="margin-bottom: 100px">
	<img src="img/first.png">
	<div class="img" style="background-image:url('img/img1.png');">
	<input type="button" value="찾으러 가기" style="left:1080px;" onClick="location.href='table_find.jsp'">
	</div>
	<div class="img" style="background-image:url('img/img2.png');">
	<input type="button" value="올리러 가기" style="left:480px" onClick="location.href='map_main1F.jsp'">
	</div>
	<div class="img" style="background-image:url('img/img3.png');">
	<input type="button" value="만나러 가기"style="left:1100px;" onClick="location.href='table_lost.jsp'">
	</div>
  </body>
</html>
