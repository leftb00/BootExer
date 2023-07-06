<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/r/css/color1.css" id="color_css"/>
<link rel="stylesheet" href="/r/css/common.css"/>
<script type="text/javascript" src="/r/js/common.js"></script>
<title>글 내용 보기</title>
<script>
function confirmDelete(qnum) {
    if (confirm("정말로 삭제하시겠습니까?")) {
        window.location.href = "delete?page=${page}&qnum=" + qnum;
    }
}
</script>
</head>
<body>
<%@ include file="header.jsp"%>
<article>
  <table id="main_table">
    <tr>
      <td>
        <span class="title01">글 내용 보기</span>
      </td>
    </tr>
    <tr>
      <td>
        <span class="title02">${dto.qtitle}</span>
      </td>
    </tr>
    <tr>
      <td class="back-color4 width-100">
		<table id="sub_table">
			<tr>
				<td>번호</td>
				<td>${dto.qnum}</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${dto.qhit}</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${dto.qid}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${dto.qtitle}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${dto.qcontent}</td>
			</tr>
			<tr>
				<td>등록일</td>
				<td><fmt:formatDate var="qdate" value="${dto.qdate}"
						 pattern="yyyy-MM-dd hh:mm:ss"/>${qdate}
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
				<c:if test="${mid eq dto.qid}">
				<input type="button" class="button01" value="수정"
					onclick="javascript:window.location='modify_form?page=${page}&qnum=${dto.qnum}'"/>
				<input type="button" class="button01" value="삭제"
					onclick="confirmDelete(${dto.qnum})"/>
				</c:if>
				<input type="button" class="button01" value="목록"
					onclick="javascript:window.location='list?page=${page}'"/>
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