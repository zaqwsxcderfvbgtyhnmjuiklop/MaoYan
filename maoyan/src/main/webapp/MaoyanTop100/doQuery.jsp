<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.maoyan.MaoyanDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String getMaoyan = request.getParameter("getMaoyan");
		request.setAttribute("getMaoyan",getMaoyan);
		request.setAttribute("list",MaoyanDao.getMaoyanByAny(getMaoyan));
		request.getRequestDispatcher("MaoyanTop100.jsp").forward(request,response);
	%>
</body>
</html>