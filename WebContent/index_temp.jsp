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

    	
    	<script>
    	
    	 $(function() {
    		  $('.bxslider').bxSlider({
    			  auto: true,
    			  autoControls: true,
    			  stopAutoOnClick: true,
    			  pager: true,
    			  slideWidth: 300
    			}); 
    		  
    		  $('.yester_num').click(function() {
    			  $('#yester_mul').css("display","inline");
    		  });
    		  $('.today_num').click(function() {
    			  $('#today_mul').css("display","inline");
    		  });    		  
    	  });
    	
    	
        </script>
    </head>
    <body>


	<%
		ArrayList<String> today_title = new ArrayList<String>();
		ArrayList<String> yester_title = new ArrayList<String>();
		ArrayList<String> today_bnum = new ArrayList<String>();
		ArrayList<String> yester_bnum = new ArrayList<String>();
		ArrayList<String> today_img = new ArrayList<String>();
		ArrayList<String> yester_img = new ArrayList<String>();
		
		ArrayList<String> entire_title=new ArrayList<String>();
		ArrayList<String> entire_bnum = new ArrayList<String>();
		ArrayList<String> entire_img = new ArrayList<String>();
		
		int today_date,null_chk;
	%>
	
	
	<%
	
	SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "dd", Locale.KOREA );
	Date currentTime = new Date();
	String mTime = mSimpleDateFormat.format (currentTime);
	today_date = Integer.parseInt(mTime);
	
	String select_title = "select * from found_board";
	
	pstmt = conn.prepareStatement(select_title);
	rs = pstmt.executeQuery();
	
	while(rs.next()) {
		int d = Integer.parseInt(rs.getString("date").substring(8,10));
		
		null_chk = rs.getString("img")==null?0:1;
		
		if(today_date == d){
			today_title.add(rs.getString("title"));
			today_bnum.add(rs.getString("bnum"));
			if(null_chk==1) today_img.add(rs.getString("bnum"));
		}
		else if((today_date-1)==d){
			yester_title.add(rs.getString("title"));
			yester_bnum.add(rs.getString("bnum"));
			if(null_chk==1) yester_img.add(rs.getString("bnum"));
		}
		
		entire_title.add(rs.getString("title"));
		entire_bnum.add(rs.getString("bnum"));
		if(null_chk==1) entire_img.add(rs.getString("bnum"));
	
	}
	%>
	
		<div style="background-image:url('img/school.jpg');background-size:cover">
					<div>
					<center>
					
					<section class="autoplay slider" style="width:1500px;padding:50px;display:inline-block;background-color: rgba( 255, 255, 255, 0.5 );margin-top:250px;margin-bottom:280px" >
					<%
						for(int i=0;i<entire_img.size();i++) {
					%>
					<div>
						<a href="table_found_content.jsp?bnum=<%= entire_img.get(i) %>"><img style="width:200px;height:200px;" src="img_view.jsp?bnum=<%= entire_img.get(i) %>"></a>
					</div>
					<%
						}
					%>
					</section>
					</center>	
					</div>
		</div>
		
		<div style="margin-top:50px">
		
			<div class="listview" style="margin:10px; ">
			<select multiple size="5" style="position:absolute;display:none;width:300px;height:300px;text-align:center;font-size:15px;" id="yester_mul" onchange="if(this.value) location.href=(this.value);">
            				<%
            					for(int i=0;i<yester_title.size();i++) {
            		   			%>
            		   				
            		   				<option value="table_found_content.jsp?bnum=<%= yester_bnum.get(i) %>"><%=yester_title.get(i)%></option>
            		   				
            		   			<% 
            					}
            				%>
       		</select>
       		<select multiple size="5" style="position:absolute;width:100px;text-align:center;width:300px;height:300px;display:none;font-size:15px;" id="today_mul" onchange="if(this.value) location.href=(this.value);">
            				<%
            					for(int i=0;i<today_title.size();i++) {
            						
            		   			%>
            		   				<option value="table_found_content.jsp?bnum=<%= today_bnum.get(i) %>"><%=today_title.get(i)%></option>
            		   				
            		   			<% 
            					}
            				%>            				
        </select>
			</div>
			
			<div >
			<section class="number">
				<div id="yesterday">
					<span class="title" >어제 들어온 분실물</span><br> 
					<span class="yester_num" >
					<%=yester_title.size() %>
					</span>
					        
				</div>

				<div id="today">
					<span class="title">오늘 들어온 분실물</span><br> 
					<span class="today_num" ><%=today_title.size() %></span>
					        
				</div>

			</section>
			</div>
</div>
 <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
  <script src="js/slick.js" charset="utf-8"></script>
  
  <script>
  
    $(document).on('ready', function() {
    	$('.yester_num').click(function() {
    		$('#yester_mul').css("display","inline-block");
    		$('#today_mul').css("display","none");
    	});
    	
    	$('.today_num').click(function() {
    		$('#today_mul').css("display","inline-block");
    		$('#yester_mul').css("display","none");
    	});
    	
    $('.autoplay').slick({
  slidesToShow: 4,
  slidesToScroll: 1,
  autoplay: true,
  autoplaySpeed: 2000,
});    
        
    });
</script>
 		
    </body>
</html>
