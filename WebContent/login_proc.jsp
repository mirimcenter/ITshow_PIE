<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <meta charset=utf-8>
        <link rel="stylesheet" type="text/css" href="css/index.css">
    </head>
    <body>
        <form action="loginCheck.jsp" method="post">
            <div id = "header">
	            <table width="90%" cellpadding="10" border="1" align="center" rules="groups">
	                <tr>
	                    <td width=300 align="center"><input type="text" name="id" placeholder="아이디"></td>
	                </tr>
	                <tr>
	                    <td width=300 align="center"><input type="password" name="pw" placeholder="비밀번호"></td>
	                </tr>
	                <tr>
	                    <td colspan=2 align="center"><button type=submit id="button">로그인</td>
	                </tr>
	            </table>
            </div>
        </form>       
    </body>
</html>