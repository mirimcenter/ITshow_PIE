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
       	
    	<link rel="stylesheet" type="text/css" href="css/fullpage.css" />
    	<link rel="stylesheet" type="text/css" href="css/examples.css" />
    	<link rel="stylesheet" type="text/css" href="css/index_slide.css"/>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
		
 		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  		<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    	
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
	
	<div id="fullpage">
		<div class="section" id="section2" style="background-image:url('img/school.jpg');background-size:cover">
				
				<div >
					
					<center>
					<div class="bxslider">
					
					<%
						for(int i=0;i<entire_img.size();i++) {
					%>
					<div>
						<a href="table_found_content.jsp?bnum=<%= entire_img.get(i) %>"><img src="img_view.jsp?bnum=<%= entire_img.get(i) %>"></a>
					</div>
					<%
						}
					%>
						
					</div>
					</center>
				</div>
				<input type="button" value="찾아가세요"></input>
				<input type="button" value="찾았어요"></input>
			
		
		</div>
		
				<div class="section" id="section0">
			<div style="float:left">
				dfsfdfsdf	
			</div>
			<div style="float:left">
			<section class="number">
				<article id="yesterday">
					<span class="title">어제 들어온 분실물</span><br> 
					<span class="yester_num">
					<%=yester_title.size() %>
					</span>
					        <select multiple size="5" style="width:100px;text-align:center;display:none;font-size:15px;" id="yester_mul" onchange="if(this.value) location.href=(this.value);">
            				<%
            					for(int i=0;i<yester_title.size();i++) {
            		   			%>
            		   				
            		   				<option value="table_found_content.jsp?bnum=<%= yester_bnum.get(i) %>"><%=yester_title.get(i)%></option>
            		   				
            		   			<% 
            					}
            				%>
        </select>
				</article>

				<article id="today">
					<span class="title">오늘 들어온 분실물</span><br> 
					<span class="today_num"><%=today_title.size() %></span>
					        <select multiple size="5" style="width:100px;text-align:center;display:none;font-size:15px;" id="today_mul" onchange="if(this.value) location.href=(this.value);">
            				<%
            					for(int i=0;i<today_title.size();i++) {
            						
            		   			%>
            		   				<option value="table_found_content.jsp?bnum=<%= today_bnum.get(i) %>"><%=today_title.get(i)%></option>
            		   				
            		   			<% 
            					}
            				%>            				
        </select>
				</article>

			</section>
			</div>
			

		</div>
	</div>

	<script type="text/javascript" src="js/fullpage.js"></script>
<script type="text/javascript" src="js/examples.js"></script>
<script type="text/javascript">
	var myFullpage = new fullpage('#fullpage',
			{
				sectionsColor : [ '#ffffff', '#ffffff'],
				anchors : ['firstPage', 'secondPage'],
				menu : '#menu',
				lazyLoad : true
			});
</script>
 		
    </body>
</html>
