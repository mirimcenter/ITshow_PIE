<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db_conn.jsp"%>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/login_join.css">
    <script type="text/javascript">
        function checkValue(){
        	if(!document.userInfo.email.value){
                alert("이메일을 입력하세요.");
                document.userInfo.email.focus();
                return false;
            }
            if(!document.userInfo.id.value){
                alert("아이디를 입력하세요.");
                document.userInfo.id.focus();
                return false;
            }
            
            if(!document.userInfo.pw.value){
                alert("비밀번호를 입력하세요.");
                document.userInfo.pw.focus();
                return false;
            }
            
            // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
            if(document.userInfo.pw.value != document.userInfo.pw2.value ){
                alert("비밀번호를 동일하게 입력하세요.");
                document.userInfo.pw2.focus();
                return false;
            }
        	if(document.userInfo.email.value.indexOf('@e-mirim.hs.kr') != -1){
        		return true;
        	}
        	else {
        		alert("학교 이메일을 입력주세요");
        		document.userInfo.email.focus();
        		return false;
        	}
        }
    </script>
</head>
<body>
<%-- <%
	request.setCharacterEncoding("UTF-8");
	
	String result;
	String sql = "select id from member";
	
	try{
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			if(rs.getString("id").equals(id)){
				result = pageContext.setAttribute("result", true);
			}
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	result = pageContext.setAttribute("result", false);
%> --%>
    <div align="center">
            <form action="join_result.jsp" method="post" name="userInfo" onsubmit="return checkValue()">
                <div class="userbox" style="width: 700px; height: 500px;">
                    <p class="login_docu"><font color="#00a651"><b>미림센터에 가입</b></font>하시고 물건을 보호하세요!</p>
                    <p class="little">미림센터를 이용하기 위해서 회원가입을 해주세요</p>
                    <font class="attend">* 체크된 항목은 필수로 기입하셔야합니다</font>
                    <hr>
                    <table class="tbl join">
                        <tr>
                            <td>
                                *학교이메일
                            </td>
                            <td>
                                <input type="text" name="email" maxlength="30">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                *아이디
                            </td>
                            <td>
                                <input type="text" name="id" maxlength="30">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                *비밀번호
                            </td>
                            <td>
                                <input type="password" name="pw" maxlength="30">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                *비밀번호 확인
                            </td>
                            <td>
                                <input type="password" name="pw2" maxlength="30">
                            </td>
                        </tr>
                    </table>
                    <hr>
                    <button type=submit id="button" class="join_btn">회원가입</button>
                </div>
            </form>
        </div>
</body>