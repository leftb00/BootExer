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
<title>게시판 글쓰기</title>
</head>
<body>
<%@ include file="header.jsp"%>
<article>
  <table id="main_table">
    <tr>
      <td>
        <span class="title01">게시판 글쓰기</span>
      </td>
    </tr>
    <tr>
      <td class="back-color4 width-100">
		<form action="write">
		<input type="hidden" name="page" value="${page}" />
		<table id="sub_table">
		  <tr>
		    <td>아이디</td>
		    <td>
		    	<input type="text" name="qid" size="60"
		    		value="<c:out value='${mid}' default='guest'/>" readonly/>
		    </td>
		  </tr>
		  <tr>
		    <td>제 목</td>
		    <td><input type="text" name="qtitle" size="60"></td>
		  </tr>
		  <tr>
		    <td>내 용</td>
		    <td><textarea rows=10 cols=45 name="qcontent"></textarea></td>
		  </tr>
		  <tr>
		    <td></td>
		    <td>
		   	  <input type="submit" class="button01" value="글입력"/>
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