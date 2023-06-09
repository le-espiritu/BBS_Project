<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID=null;
		if(session.getAttribute("userID")!=null){
			userID=(String)session.getAttribute("userID");
		}
		
		if(userID==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 되어있지 않습니다.')");
			script.println("location.href='login.jsp");
			script.println("</script>");
		}
		
		int bbsID = 0;
		if(request.getParameter("bbsID")!=null){
			bbsID=Integer.parseInt(request.getParameter("bbsID"));
		}
		
		if(bbsID==0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('게시글 번호가 옳바르지 않습니다.')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
		}
		
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if(!userID.equals(bbs.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
		}
		
	%>
	
	<nav>
		<div>
			<button>
				<span></span>
				<span></span>
				<span></span>
			</button>
			<a href='main.jsp'>JSP 게시판 웹 사이트</a>
		</div>
		<div>
			<ul>
				<li><a href='mian.jsp'>메인</a></li>
				<li><a href='bbs.jsp'>게시판</a></li>
			</ul>
			<ul>
				<li>
					<a href='#'>회원관리</a>
					<ul>
						<li><a href='logoutAction.jsp'>로그아웃</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	
	<div class="container">
		<div>
			<form method="post" action="updateAction.jsp">
				<input type="hidden" name="bbsID" value="<%=bbsID%>">
				<table style="text-align; border:1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color:#eeeeee; text-align:center">게시판 글수정 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" placeholder="게시글 제목" name="bbsTitle" mexlength="20" value="<%=bbs.getBbsTitle()%>"></td>
						</tr>
						<tr>
							<td><textarea placeholder="글 내용" name="bbsContent" maxlength="2048" style="height:350px;"><%=bbs.getBbsContent() %></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" value="글수정">
			</form>
			
		</div>
	</div>
	
	
</body>
</html>