<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String contentpage = request.getParameter("CONTENTPAGE");
%>
<head>
<title>미림 분실물 센터</title>
<style>
	@font-face {
	    font-family: BebasNeueRegular, "나눔스퀘어라운드OTF";
	    src: url('fonts/BebasNeue-webfont.eot');
	    src: url('fonts/BebasNeue-webfont.eot?#iefix') format('embedded-opentype'),
	         url('fonts/BebasNeue-webfont.woff') format('woff'),
	         url('fonts/BebasNeue-webfont.ttf') format('truetype'),
	         url('fonts/BebasNeue-webfont.svg#BebasNeueRegular') format('svg');
	    font-weight: normal;
	    font-style: normal;
	}
</style>
</head>
<body>
<table width=100% height=100% border=0 cellpadding=0 cellspacing=0>
	<tr height="100px">
		<td>
			<jsp:include page="nav.jsp" flush="false"/>
		</td>
		
	</tr>
	
	<tr>
		<td>
			<jsp:include page="<%=contentpage %>" flush="false"/>
		</td>
	</tr>
	

</table>
</body>
</html>