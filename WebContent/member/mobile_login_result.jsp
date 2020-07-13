<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// request 객체에 전달된 loginResult 값을 가져와서 출력
out.println("로그인 결과:" + request.getAttribute("loginResult"));
%>