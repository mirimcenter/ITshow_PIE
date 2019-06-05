
<%@ page import="java.sql.*"%>

<%@ page import="java.io.*"%>

<%@ include file="db_conn.jsp" %>
<% 

request.setCharacterEncoding("utf-8");
int bnum = Integer.parseInt(request.getParameter("bnum"));

Blob image = null;
byte[ ] imgData = null ;

out.clear(); //out--> jsp자체 객체
out=pageContext.pushBody();

try {
stmt = conn.createStatement();
rs = stmt.executeQuery("select img from find_board where bnum =" + bnum);

if (rs.next()) {
	
image = rs.getBlob(1);
imgData = image.getBytes(1,(int)image.length());

} else {
	
out.println("Display Blob Example");
out.println("image not found for given id>");

return;

}

// display the image 

response.setContentType("application/octet-stream");
OutputStream o = response.getOutputStream();

o.write(imgData);

o.flush();

o.close();

} catch (Exception e) {

out.println("Unable To Display image");

out.println("Image Display Error=" + e.getMessage());

return;

} finally {

try {

rs.close();

stmt.close();

conn.close();

} catch (SQLException e) {

e.printStackTrace();

}

}

%> 