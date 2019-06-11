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
	</style>
    </head>
    <body>

	<img src="img/main.png" style="margin-bottom: 100px">
	<img src="img/first.png">
	<div class="img" style="background-image:url('img/img1.png');"></div>
	<div class="img" style="background-image:url('img/img2.png');"></div>
	<div class="img" style="background-image:url('img/img3.png');"></div>
  </body>
</html>
