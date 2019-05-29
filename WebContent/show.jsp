<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet"  type="text/css" href="show.css">
        <link rel="stylesheet"  type="text/css" href="index.css">
        <script language = "javascript" src="show.js"></script>
        
 
    </head>
    <body>
        
            <table style=margin-bottom:30px;>
        <img src="img/logo.png" alt="logo" class="logo" width=300px onclick="location.href='index.html'">
        <div>
            <input type="button" value="로그인" id="btn1" onclick="location.href='login.html'">
            <input type="button" value="회원가입" id="btn1" onclick="location.href='join.html'">
        </div>
        <table class="menu">
            <tr class="menu">
                <td><button id="btn2">찾습니다</button></td>
                <td><button id="btn2">찾아가세요</button></td>
                <td><button id="btn2">유기물품</button></td>
                <td><button id="btn2">My page</button></td>
            </tr>
        </table>
        <center>
            <img src=img/logo.png width=400 onclick="location.href='index.html'" style=margin-top:30px;>
            <form>
                ID <input type=text style=margin-top:50px;>
            </form>
            <p><button onclick=show()>내가 쓴 글 보기</button><br>
                
            <div id="div1" >
                <!--<table>
                    <tr bgcolor=#D9D9D9>
                        <td>No.</td>
                        <td>제목</td>
                        <td>날짜</td>
                    </tr>
                    <tr id=t>
                        <td>01</td>
                        <td>~~</td>
                        <td>0202</td>
                    </tr>
                </table> -->
            </div>
            </form>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button>탈퇴하기</button>
        </center>
    </body>
</html>