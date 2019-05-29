<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String db_url = "jdbc:mysql://localhost:3306/lost_and_found?useUnicode=yes&amp;characterEncoding=utf8&amp;useSSL=false&amp;serverTimezone=UTC";
String db_user = "mirim";
String db_pw = "mirim12345!"; 

/* String db_url = "jdbc:mysql://localhost:3306/lost_and_found?useUnicode=yes&amp;characterEncoding=utf8&amp;useSSL=false&amp;serverTimezone=UTC";
String db_user = "root";
String db_pw = "apmsetup";  */

Connection conn = null;
Statement stmt = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(db_url, db_user, db_pw);
	System.out.println("연결 성공");
}catch(ClassNotFoundException e1){
	System.out.println("드라이버 ㅅㅂ 로드문제");
	e1.printStackTrace();
}catch(SQLException e2){
	System.out.println("몰라 아무튼 연결실패;;ㅠ");
	System.out.println("SQLException: " + e2.getMessage());
	System.out.println("SQLState: " + e2.getSQLState());
	System.out.println("VendorError: " + e2.getErrorCode());
}

%>