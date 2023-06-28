<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/r/css/color1.css" id="color_css"/>
<link rel="stylesheet" href="/r/css/common.css"/>
<script type="text/javascript" src="/r/js/common.js"></script>
<title>** 로그인 **</title>
</head>
<body>
<%@ include file="header.jsp"%>
<div id="main">
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
        <form action="login">
          <table id="sub_table">
            <tr>
              <th colspan=2>로그인</th>
            </tr>
            <tr>
              <td class="right">아이디:</td>
              <td><input type="text" name="mid"/></td>
            </tr>
            <tr>
              <td class="right">비빌번호:</td>
              <td><input type="password" name="mpw"/></td>
            </tr>
            <tr>
              <td></td>
              <td><input type="submit" class="button01" value="로그인"/></td>
            </tr>
          </table>
        </form>
      </td>
    </tr>
    <tr>
      <td>
      </td>
    </tr>
  </table>
</div>
<%@ include file="footer.jsp"%>
</body>
</html>