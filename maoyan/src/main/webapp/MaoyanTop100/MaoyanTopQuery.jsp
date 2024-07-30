<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		padding: 20px
	}
	.a{
		width: 300px;
	}
</style>
</head>
<body>
	<form action="doQuery.jsp" method="post">
		<table align="center" bgcolor="pink">
			<tr>
				<td><input type="text" name="getMaoyan" class="a"></td>
				<td><input type="submit" value="搜索"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><a href="MaoyanTop100.jsp">首页</a></td>
			</tr>
		</table>
	</form>
</body>
</html>