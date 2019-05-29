<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <meta charset=utf-8>
        <link rel="stylesheet" type="text/css" href="index.css">
        <style>
            #header {
                top : 70%;
                left : 50%;
                position : absolute;
                height : 300px;
                width : 400px;
                margin : -150px 0px 0px -200px;
                padding : 5px;  
            }
            #button {
                font-size : 12pt;
                color : white;
                background-color : #38985A;
                width : 100px;
                height : 45px;
            }
            #id {
                width : 220px;
                height : 25px;
            }
            #num{
                margin:15px;
            }
            #tb{
                border:1px solid #d9d9d9;
                margin-top:15px;
            }
        </style>
    </head>
    <body>
        <table>
        <img src="img/logo.png" alt="logo" class="logo"  width=300px>
        <div>
            <input type="button" value="로그인" id="btn1" onclick="location.href='login.html'">
            <input type="button" value="회원가입" id="btn1">
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
            <table width=750px height=500px id=tb>
            <!--table 들어갈 자리-->
            </table> 
            <div align=center>
                <div id=num>&gt;</div>
                <div id=num>5</div>
                <div id=num>4</div>
                <div id=num>3</div>
                <div id=num>2</div>
                <div id=num>1</div>
                <div id=num>&lt;</div>
            </div>  
        </center>
    </body>
</html>l>