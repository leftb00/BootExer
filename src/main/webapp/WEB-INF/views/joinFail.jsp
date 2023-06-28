<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/r/css/color1.css" id="color_css"/>
<link rel="stylesheet" href="/r/css/common.css"/>
<script type="text/javascript" src="/r/js/common.js"></script>
<title>** 회원 가입 실패 **</title>
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
        <table id="sub_table">
          <tr>
            <th>회원 가입 실패</th>
          </tr>
          <tr>
            <td class="center">
              <span class="skilltext02">회원 가입 실패! 다시 확인해 주세요.</span><br/><br/>
              <input class="button01" type="button" value="회원가입 돌아가기" onclick="javascript:history.go(-1);">
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
</div>
<%@ include file="footer.jsp"%>
</body>
</html>