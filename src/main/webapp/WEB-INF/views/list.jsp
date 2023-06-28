<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록 보기</title>
</head>
<body>
	<h2>게시판 글목록</h2>
	<hr/>
	총 게시글 수: ${total}
	<table border=1 cellspacing=0 cellpadding=0 width=800>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
			<th>조회수</th>
		</tr>
<c:forEach items="${list}" var="dtoBoard">
		<tr>
			<td>${dtoBoard.qnum}</td>
			<td><a href="view?qnum=${dtoBoard.qnum}">${dtoBoard.qtitle}</a></td>
			<td>${dtoBoard.qid}</td>
			<td>${dtoBoard.qdate}</td>
			<td>${dtoBoard.qhit}</td>
		</tr>
</c:forEach>
		<tr>
			<td colspan=5>
			<input type="button" value="글쓰기" onclick="javascript:window.location='write_form'">
			</td>
		</tr>
	</table>
</body>
</html>