<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
  font-family: "La
  
  to", sans-serif;
}

/* Fixed sidenav, full height */
.sidenav {
  height: 100%;
  width: 200px;
  position: fixed;
  z-index: 1;
  top: 80px;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  padding-top: 20px;
}

/* Style the sidenav links and the dropdown button */
.sidenav a, .dropdown-btn {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 20px;
  color: #818181;
  display: block;
  border: none;
  background: none;
  width: 100%;
  text-align: left;
  cursor: pointer;
  outline: none;
}

/* On mouse-over */
.sidenav a:hover, .dropdown-btn:hover {
  color: #f1f1f1;
}

/* Main content */
.main {
  margin-left: 200px; /* Same as the width of the sidenav */
  font-size: 20px; /* Increased text to enable scrolling */
  padding: 0px 10px;
}

/* Add an active class to the active dropdown button */
.active {
  background-color: green;
  color: white;
}

/* Dropdown container (hidden by default). Optional: add a lighter background color and some left padding to change the design of the dropdown content */
.dropdown-container {
  display: none;
  background-color: #262626;
  padding-left: 8px;
}

/* Optional: Style the caret down icon */
.fa-caret-down {
  float: right;
  padding-right: 8px;
}

/* Some media queries for responsiveness */
@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}

</style>
</head>
<%
	String pagename = request.getParameter("PAGENAME");
%>
<body>
<table width="100%" height="100%">
	<tr height="100px">
		<td>
			<jsp:include page="nav.jsp" flush="false"/>
		</td>
	</tr>
	<tr>
		<td>
			<div class="sidenav">
			  <button class="dropdown-btn">본관 
			    <i class="fa fa-caret-down"></i>
			  </button>
			  <div class="dropdown-container">
			    <a href="map_main1F.jsp">1층</a>
			    <a href="map_main1.5F.jsp">1.5층</a>
			    <a href="map_main2F.jsp">2층</a>
			    <a href="map_main3F.jsp">3층</a>
			    <a href="map_main4F.jsp">4층</a>
			  </div>
			  <button class="dropdown-btn">강당동
			    <i class="fa fa-caret-down"></i>
			  </button>
			  <div class="dropdown-container">
			  	<a href="map_audi1B.jsp">지하</a>
			    <a href="map_audi1F.jsp">1층</a>
			    <a href="map_audi2F.jsp">2층</a>
			  </div>
			  <button class="dropdown-btn" onclick="javascript:location.href='table_found.jsp?space=76'">복도</button>
			</div>
		</td>
		<td align="center">	
			<div class="main">
				<jsp:include page="<%=pagename%>"></jsp:include>
			</div>
		</td>
	</tr>
</table>
<script>
/* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
  dropdown[i].addEventListener("click", function() {
  this.classList.toggle("active");
  var dropdownContent = this.nextElementSibling;
  if (dropdownContent.style.display === "block") {
  dropdownContent.style.display = "none";
  } else {
  dropdownContent.style.display = "block";
  }
  });
}
</script>

</body>
</html> 