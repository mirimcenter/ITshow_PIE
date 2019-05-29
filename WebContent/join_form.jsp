<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db_conn.jsp"%>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <script type="text/javascript">
        function checkValue(){
        	if(!document.userInfo.email.value){
                alert("이메일을 입력하세요.");
                return false;
            }
            if(!document.userInfo.id.value){
                alert("아이디를 입력하세요.");
                return false;
            }
            
            if(!document.userInfo.pw.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
            
            // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
            if(document.userInfo.pw.value != document.userInfo.pw2.value ){
                alert("비밀번호를 동일하게 입력하세요.");
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
    <form action="join_result.jsp" method="post" name="userInfo" onsubmit="return checkValue()">
        <div id = "header">
	        <table width="90%" cellpadding="10" border= "1" align="center" rules="groups">
	        	<tr>
                    <td width=300 align="center">
                    	<input type="text" name="email" maxlength="30" placeholder="학교 이메일">
					</td>
                </tr>
                <tr>
                    <td width=300 align="center">
                    	<input type="text" name="id" maxlength="30" placeholder="아이디">
					</td>
                </tr>
                <tr>
                    <td width=300 align="center">
                    	<input type="password" name="pw" placeholder="비밀번호" maxlength="30">
                    </td>
                </tr>
                <tr>
                    <td width=300 align="center">
                    	<input type="password" name="pw2" placeholder="비밀번호 확인" maxlength="30">
                    </td>
                </tr>
                <tr>
                    <td colspan=2 align="center">
                    	<button type=submit id="button">가입하기
                    </td>
                </tr>
            </table>
        </div>
    </form>       
</body>