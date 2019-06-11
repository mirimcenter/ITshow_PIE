<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <meta charset=utf-8>
        <link rel="stylesheet" type="text/css" href="css/login_join.css">
    </head>
    <body>
        <form action="loginCheck.jsp" method="post">
            <div class = "userbox" style="width: 700px; height: 400px;">
                <p class="login_docu"><font color="#00a651"><b>미림센터에 로그인</b></font>하시고 서비스를 이용하세요!</p>
                <p class="little">미림센터를 이용하기 위해서 로그인을 해주세요</p>
                <hr>
	            <table class="tbl">
	                <tr>
                        <td>아이디</td>
	                    <td><input type="text" name="id"></td>
                        <td rowspan="2"><button type=submit class="login_btn">로그인</button></td>
	                </tr>
	                <tr>
                        <td>비밀번호</td>
	                    <td><input type="password" name="pw"></td>
	                </tr>
	            </table>
                <hr>
                <p class="little"><font color="#00a651">●</font> 회원가입을 아직 하지 않으셨나요?
<%
				out.print("\t\t\t");
%>                
                <a href="join.jsp">신규회원가입</a></p>
            </div>
        </form>       
    </body>
</html>