<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/r/css/color1.css" id="color_css"/>
<link rel="stylesheet" href="/r/css/common.css"/>
<script type="text/javascript" src="/r/js/common.js"></script>
<title>게시판 글 수정</title>
</head>
<body>
<%@ include file="header.jsp"%>
<article>
  <table id="main_table">
    <tr>
      <td>
        <span class="title01">게시판 글 수정</span>
      </td>
    </tr>
    <tr>
      <td class="back-color4 width-100">
		<form action="modify">
		  <table id="sub_table">
		    <tr>
		      <td>이 름</td>
		      <td>${dto.qid}</td>
		    </tr>
		    <tr>
		      <td>제 목</td>
		      <td><input type="text" name="qtitle" size="60" value="${dto.qtitle}"></td>
		    </tr>
		    <tr>
		      <td>내 용</td>
		      <td><textarea rows=10 cols=45 name="qcontent">${dto.qcontent}</textarea></td>
		    </tr>
		    <tr>
		      <td></td>
		      <td>
		      	<input type="hidden" name="page" value="${page}">
		      	<input type="hidden" name="qnum" value="${dto.qnum}">
		      	<input type="submit" class="button01" value="저장"/>
		      	<input type="button" class="button01" value="목록"
		      		onclick="javascript:window.location='list?page=${page}'"/>
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