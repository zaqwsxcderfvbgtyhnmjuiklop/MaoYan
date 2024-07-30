<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.maoyan.Maoyan" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		img {
			height: 190px;
		}

		.a {
			font-size: 30px;
			font-weight: bold;
			color: #ea7500;
		}

		.b {
			font-weight: bold;
			font-size: 24px;
		}

		.c {
			font-size: 12px;
		}

		.d {
			font-size: 12px;
			color: grey;
		}

		.e {
			font-size: 45px;
			font-weight: bold;
			color: #ea7500;
		}
	</style>
</head>

<body>
	<jsp:useBean id="MaoyanPage" class="com.maoyan.MaoyanPage" />
	<% request.setCharacterEncoding("utf-8"); String getMaoyan=(String)request.getAttribute("getMaoyan");
		List list=(List)request.getAttribute("list"); if(list==null){%>

		<% String curPage=request.getParameter("curPage"); if(curPage!=null){ int
			curPage1=Integer.parseInt(curPage); %>
			<jsp:setProperty name="MaoyanPage" property="curPage" value="<%=curPage1 %>" />
			<% }%>

				<table align="center" width="800" bgcolor="pink">
					<% int PageSize=MaoyanPage.getCurPage()*10; int count=0; for(int
						i=0;i<MaoyanPage.getName2().size();i++){ count++; if(count==11){ break; }%>
						<tr>
							<td class="a" width=150px align="right">
								<%=PageSize+i+1 %>
							</td>
							<td width=150px height="200"><img
									src="<%=((Maoyan) MaoyanPage.getName2().get(PageSize+i)).getMovieImgSrc() %>">
							</td>
							<td width=250px>
								<p class="b">
									<%=((Maoyan) MaoyanPage.getName2().get(PageSize+i)).getMovieName() %>
								</p>
								<p class="c">主演:<%=((Maoyan)
										MaoyanPage.getName2().get(PageSize+i)).getMovieActress() %>
								</p>
								<p class="d">上映时间:<%=((Maoyan)
										MaoyanPage.getName2().get(PageSize+i)).getMovieTime() %>
								</p>
							</td>
							<td align="center" class="e">
								<%=((Maoyan) MaoyanPage.getName2().get(PageSize+i)).getMovieScore() %>
							</td>
						</tr>
						<%} %>
							<tr>
								<td colspan="9" align="center">
									<a href="MaoyanTop100.jsp?curPage=0">首页</a>
									<a
										href="MaoyanTop100.jsp?curPage=<%=MaoyanPage.getCurPage()-1%>">上一页</a>
									<a href="MaoyanTop100.jsp?curPage=0">1</a>
									<a href="MaoyanTop100.jsp?curPage=1">2</a>
									<a href="MaoyanTop100.jsp?curPage=2">3</a>
									<a href="MaoyanTop100.jsp?curPage=3">4</a>
									<a href="MaoyanTop100.jsp?curPage=4">5</a>
									<a href="MaoyanTop100.jsp?curPage=5">6</a>
									<a href="MaoyanTop100.jsp?curPage=6">7</a>
									<a href="MaoyanTop100.jsp?curPage=7">8</a>
									<a href="MaoyanTop100.jsp?curPage=8">9</a>
									<a href="MaoyanTop100.jsp?curPage=9">10</a>
									<a
										href="MaoyanTop100.jsp?curPage=<%=MaoyanPage.getCurPage()+1%>">下一页</a>
									<a href="MaoyanTop100.jsp?curPage=9">末页</a>
								</td>
							</tr>
				</table>
				<% }else{%>
					<form action="doQuery.jsp" method="post">
						<table align="center" width="800" bgcolor="pink">
							<tr>
								<td align="center" colspan="9">
									<input type="text" name="getMaoyan" value=<%=getMaoyan %>>
									<input type="submit" value="搜索">
								</td>
							</tr>
							<%for(int i=0;i<list.size();i++){ %>

								<tr>
									<td class="a" width=150px align="right">
										<%=((Maoyan)list.get(i)).getId()+1 %>
									</td>
									<td width=150px height="200"><img
											src="<%=((Maoyan)list.get(i)).getMovieImgSrc() %>"></td>
									<td width=250px>
										<p class="b">
											<%=((Maoyan)list.get(i)).getMovieName() %>
										</p>
										<p class="c">主演:<%=((Maoyan)list.get(i)).getMovieActress() %>
										</p>
										<p class="d">上映时间:<%=((Maoyan)list.get(i)).getMovieTime() %>
										</p>
									</td>
									<td align="center" class="e">
										<%=((Maoyan)list.get(i)).getMovieScore() %>
									</td>
								</tr>


								<%}%>
									<tr>
										<td colspan="9" align="center"><a href="MaoyanTop100.jsp">首页</a>
										</td>
									</tr>
						</table>
					</form>
					<%}%>
</body>

</html>