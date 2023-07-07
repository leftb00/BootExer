<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
  <ul>
    <li><a href="/index">Home</a></li>
    <li><a href="/list">Board</a></li>
    <c:choose>
    <c:when test="${empty mid}">
    <li><a href="/login_form">Login</a></li>
    <li><a href="/join_form">Join</a></li>
    </c:when>
    <c:otherwise>
    <li><a href="/logout">Logout</a></li>
    <li><a href="/modify_member_form">Profile</a></li>
    </c:otherwise>
    </c:choose>
  </ul>
  <select id="color_list">
  </select>
</header>