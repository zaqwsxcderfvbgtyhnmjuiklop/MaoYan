<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.maoyan.Maoyan" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	img{
		height: 190px;
	}
	.a{
		font-size:30px;
		font-weight: bold;
		color:#ea7500;
	}
	.b{
		font-weight: bold;
		font-size:24px;
	}
	.c{
		font-size:12px;
	}
	.d{
		font-size:12px;
		color:grey;
	}
	.e{
		font-size:45px;
		font-weight: bold;
		color:#ea7500;
	}
</style>
</head>
<body>
	<jsp:useBean id="MaoyanPage" class="com.maoyan.MaoyanPage" />
 	<%	
 		int count = 0;
 		for(int i=0;i<=MaoyanPage.getName1().size();i++){
 			count++;
 			if(count==11){
 				break;
 			}%>
 			<table align="center" width="800" bgcolor="pink">
 				<tr>
 					<td class="a" width=150px align="right"><%=count %></td>
 					<td width=150px height="200"><img src="<%=((Maoyan) MaoyanPage.getName1().get(i)).getMovieImgSrc() %> height=1010px"></td>
 					<td width=250px><p class="b"><%=((Maoyan) MaoyanPage.getName1().get(i)).getMovieName() %></p>
 						<p class="c">主演:<%=((Maoyan) MaoyanPage.getName1().get(i)).getMovieActress() %></p>
 						<p class="d">上映时间:<%=((Maoyan) MaoyanPage.getName1().get(i)).getMovieTime() %></p></td>
 					<td align="center" class="e"><%=((Maoyan) MaoyanPage.getName1().get(i)).getMovieScore() %></td>
 				</tr>
 			</table>
		<%} %> 		
</body>
</html>