<%@page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ page import="ab2.Ab2" %>
<%@ page import="ab2.Ab2DAO" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title> ab2Update </title>
</head>

<body>

        <%
                String userID = null;
                if(session.getAttribute("userID") != null){
                        userID = (String) session.getAttribute("userID");
                }
		if(userID == null){
                         %><script type="text/javascript">
                        alert('로그인을 하세요.');
                        location.href = 'index.jsp'</script><%
		}
                int ab2ID = 0;
                if(request.getParameter("ab2ID") != null){
                        ab2ID = Integer.parseInt(request.getParameter("ab2ID"));
                }
                if(ab2ID == 0){
                         %><script type="text/javascript">
                        alert('유효하지않은 글입니다.');
                        location.href = 'ab2.jsp'</script><%
                }
		Ab2 ab2 = new Ab2DAO().getAb2(ab2ID);
		if(!userID.equals(ab2.getUserID()) && !userID.equals("admin")){
			%><script type="text/javascript">
                        alert('권한이 없습니다.');
                        location.href = 'ab2.jsp'</script><%
		}
        %>

        <nav class="navbar navbar-default">
                <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed"
                                data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                                aria-expanded="false">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="main.jsp"> 로그인화면</a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                                <li><a href="main.jsp"> 메인 </a></li>
                                <li><a href="bbs.jsp"> 게시판</a></li>
                                <li><a href="https://sylvy0815.github.io/"> 블로그</a></li>
                                <li><a href="addrbook_list.jsp">주소록</a></li>
                                <li class="active"><a href="addrbook2_list.jsp">주소록2</a></li>
                        </ul>
                        <%
                                if(userID == null){
                        %>
                        <ul class="nav navbar-nav navbar-right">
                                <li class="dropdown">
                                        <a href="#" class="dropdown-toggle"
                                                data-toggle="dropdown" role="button" aria-haspopup="true"
                                                aria-expanded="false"> 접속하기<span class="caret"></span></a>
                                        <ul class="dropdown-menu">
                                                <li class="active"><a href="index.jsp"> 로그인</a></li>
                                                <li><a href="join.jsp"> 회원가입</a></li>
                                        </ul>
                                </li>
                        </ul>
                        <%
                                }else{
                        %>
                        <ul class="nav navbar-nav navbar-right">
                                <li class="dropdown">
                                        <a href="#" class="dropdown-toggle"
                                                data-toggle="dropdown" role="button" aria-haspopup="true"
                                                aria-expanded="false"> 회원관리<span class="caret"></span></a>
                                        <ul class="dropdown-menu">
                                                <li class="active"><a href="mypage.jsp"> 마이페이지</a></li>
                                                <li class="active"><a href="logoutAction.jsp"> 로그아웃</a></li>
                                        </ul>
				</li>
			</ul>
                       		 <%}%>
                </div>
        </nav>
        <div class="container">
                <div class="row">
                   <form method="post" action="ab2updateAction.jsp?ab2ID=<%= ab2ID %>">
                        <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
                                <thead>
                                        <tr>
                                                <th colspan="2" style="background-color: #eeeeee; text-align: center;">주소록:주소록 수정</th>
                                        </tr>
                                </thead>
                                <tbody>
                                        <tr>
                                                <td><input type="text" class="form-control" placeholder="이름"name="ab2Name" maxlength="15" value="<%= ab2.getAb2Name() %>"></td>
                                        </tr>
                                        <tr>
                                                <td><input type="text" class="form-control" placeholder="전화번호"name="ab2Tel" maxlength="20" value="<%= ab2.getAb2Tel() %>"></td>
                                        </tr>
                                        <tr>
                                                <td><input type="date" class="form-control" placeholder="생일" name="ab2Birth" maxlength="10" value="<%= ab2.getAb2Birth() %>"</td>
                                        </tr>
                                        <tr>
                                                <td><input type="text" class="form-control" placeholder="회사" name="ab2Com" maxlength="20" value="<%= ab2.getAb2Com() %>"</td>
                                        </tr>
                                        <tr>
                                                <td><textarea class="form-control" placeholder="메모" name="ab2Memo" maxlength="100" style="height: 200px;"><%= ab2.getAb2Memo() %></textarea></td>
                                        </tr>
                                </tbody>
                        </table>
                        <input type="submit" class="btn btn-primary pull-right" value="수정하기">
                   </form>
                </div>
        </div>
	안녕하세요, <%=userID%>님
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <script src="js/bootstrap.js"></script>
</body>
</html>
