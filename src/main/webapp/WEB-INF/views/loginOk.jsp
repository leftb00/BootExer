<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/r/css/color1.css" id="color_css"/>
<link rel="stylesheet" href="/r/css/common.css"/>
<script type="text/javascript" src="/r/js/common.js"></script>
<title>** 로그인 성공 **</title>
</head>
<body>
<%
	String loginCheck = request.getAttribute("loginCheck").toString();
	if(loginCheck.equals("0")) {
%>
		<script type="text/javascript">
			alert('아이디 또는 비밀번호가 다릅니다. 다시 확인하시기 바랍니다!');
			history.go(-1);
		</script>
<%
	} else {
		String mid = session.getAttribute("mid").toString();
%>
<%@ include file="header.jsp"%>
<article>
  <table id="main_table">
    <tr>
      <td>
        <span class="title01">흐소흐 연습용</span>
      </td>
    </tr>
    <tr>
      <td>
        <span class="title02">I'm 흐소흐</span>
      </td>
    </tr>
    <tr>
      <td>
        <table id="sub_table">
          <tr>
            <th>로그인 성공</th>
          </tr>
          <tr>
            <td>
              <span class="skilltext02">${mid}님 로그인 하셨습니다.</span>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td>
      </td>
    </tr>
  </table>
</article>
<%@ include file="footer.jsp"%>
<%
	}
%>
</body>
</html>