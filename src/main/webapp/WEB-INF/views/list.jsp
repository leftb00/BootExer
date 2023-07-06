<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/r/css/color1.css" id="color_css"/>
<link rel="stylesheet" href="/r/css/common.css"/>
<script type="text/javascript" src="/r/js/common.js"></script>
<title>글 목록 보기</title>
</head>
<body>
<%@ include file="header.jsp"%>
<article>
  <table id="main_table">
    <tr>
      <td>
        <span class="title01">게시판 글목록</span>
      </td>
    </tr>
    <tr>
      <td>
        <span class="title02">총 게시글 수: ${total}</span>
      </td>
    </tr>
    <tr>
      <td class="back-color4 width-100">
		<table id="board_table">
			<tr>
				<th>번호</th>
				<th class="width-40">제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>조회수</th>
			</tr>
			<c:forEach items="${dtos}" var="dto">
			<tr>
				<td>${dto.qnum}</td>
				<td class="text-left"><a href="view?page=${page}&qnum=${dto.qnum}">${dto.qtitle}</a></td>
				<td>${dto.qid}</td>
				<td><fmt:formatDate var="qdate" value="${dto.qdate}"
						 pattern="yyyy-MM-dd hh:mm:ss"/>${qdate}</td>
				<td>${dto.qhit}</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan=5>
					[
				<c:set var="start_page" value="${(page - 5) < 1 ? 1 : (page - 5)}" />
				<c:set var="end_page" value="${(page + 5) > page_count ? page_count : (page + 5)}" />
				<c:if test="${start_page > 1}">
					<a href="list?page=${start_page-1}">◀</a>
				</c:if>
				<c:forEach var="pageNum" begin="${start_page}" end="${end_page}">
				<c:choose>
				<c:when test="${page eq pageNum}">
					<span class="current_page">${pageNum}</span>
				</c:when>
				<c:otherwise>
					<a href="list?page=${pageNum}">${pageNum}</a>
				</c:otherwise>
				</c:choose>
				</c:forEach>
				<c:if test="${end_page < page_count}">
					<a href="list?page=${end_page+1}">▶</a>
				</c:if>
					]
					<input type="button" class="button01" value="글쓰기"
						onclick="javascript:window.location='write_form?page=${page}'">
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
</body>
</html>