<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/r/css/color1.css" id="color_css"/>
<link rel="stylesheet" href="/r/css/common.css"/>
<script type="text/javascript" src="/r/js/common.js"></script>
<title>** 회원 수정 **</title>
</head>
<body>
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
        <form name="member_form" action="modify_member">
          <table id="sub_table">
            <tr>
              <th colspan=2>회원 수정</th>
            </tr>
            <tr>
              <td class="text-right">아이디:</td>
              <td>${dto.mid}</td>
            </tr>
            <tr>
              <td class="text-right">비빌번호:</td>
              <td><input type="password" name="mpw" value="${dto.mpw}"/></td>
            </tr>
            <tr>
              <td class="text-right">비빌번호 확인:</td>
              <td><input type="password" name="mpw2"/></td>
            </tr>
            <tr>
              <td class="text-right">이름:</td>
              <td><input type="text" name="mname" value="${dto.mname}"/></td>
            </tr>
            <tr>
              <td class="text-right">이메일:</td>
              <td><input type="text" name="memail" value="${dto.memail}"/></td>
            </tr>
            <tr>
              <td class="text-center" colspan=2>
                <input type="submit" class="button01" value="정보수정"
                  onClick="javasript:return joinCheck()"/>
                <input type="button" class="button01" value="수정취소"
                  onClick="javasript:window.history.back()"/>
              </td>
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
</article>
<%@ include file="footer.jsp"%>
</body>
</html>