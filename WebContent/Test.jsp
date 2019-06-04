<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db_conn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/slick.css">
<link rel="stylesheet" type="text/css" href="css/slick-theme.css">

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
  		
<style>
    	* {
      box-sizing: border-box;
    }
    .slider {
        width: 100%;
        margin: 100px auto;
    }
    .slick-slide {
      margin: 0px 20px;
    }
    .slick-slide img {
    
    }
    .slick-prev:before,
    .slick-next:before {
      color: black;
    }
    .slick-slide {
      transition: all ease-in-out .3s;
      opacity: .2;
    }
    .slick-active {
      opacity: .5;
    }
    .slick-current {
      opacity: 1;
    }
    	</style>
</head>
<body>
<%
ArrayList<String> entire_title=new ArrayList<String>();
ArrayList<String> entire_bnum = new ArrayList<String>();
ArrayList<String> entire_img = new ArrayList<String>();

int today_date,null_chk;


String select_title = "select * from found_board";

pstmt = conn.prepareStatement(select_title);
rs = pstmt.executeQuery();

while(rs.next()) {
	int d = Integer.parseInt(rs.getString("date").substring(8,10));
	
	null_chk = rs.getString("img")==null?0:1;
	
	entire_title.add(rs.getString("title"));
	entire_bnum.add(rs.getString("bnum"));
	if(null_chk==1) entire_img.add(rs.getString("bnum"));

}
%>

<div class="section" id="section2" style="background-image:url('img/school.jpg');background-size:cover">
				<section class="autoplay slider" style="position:absolute;margin-left: 50px;margin-right:50px; width:1000px;">
					<%
						for(int i=0;i<entire_img.size();i++) {
					%>
					<div>
						<a href="table_found_content.jsp?bnum=<%= entire_img.get(i) %>"><img style="width:200px;height:200px"src="img_view.jsp?bnum=<%= entire_img.get(i) %>"></a>
					</div>
					<%
						}
					%>
				</section>
				<input type="button" value="찾아가세요"></input>
				<input type="button" value="찾았어요"></input>
</div>

 <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
  <script src="./slick/slick.js" type="text/javascript" charset="utf-8"></script>
  <script type="text/javascript">
    $(document).on('ready', function() {
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