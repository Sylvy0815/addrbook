<%@page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title> 마이페이지</title>
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
                User user = new UserDAO().getUser(userID);
		
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
                                <li class="active"><a href="bbs.jsp"> 게시판</a></li>
                                <li><a href="https://sylvy0815.github.io/"> 블로그</a></li>
                                <li><a href="addrbook_list.jsp">주소록</a></li>
                                <li><a href="addrbook2_list.jsp">주소록2</a></li>
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
                                                <li><a href="logoutAction.jsp"> 로그아웃</a></li>
                                        </ul>
				</li>
			</ul>
                       		 <%}%>
                </div>
        </nav>
        <div class="container">
                <div class="col-lg-4"></div>
                <div class="col-lg-4">
                        <div class="jumbotron" style="padding-top: 20px;">
                                <form method="post" action="userUpdateAction.jsp">
                                        <h3 style="text-align: center;"> 마이페이지</h3>
                                        <div class="form-group">
                                                <input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20" value="<%=user.getUserID()%>">
                                        </div>
                                        <div class="form-group">
                                                <input type="password" class="form-control" placeholder="비밀 번호" name="userPassword" maxlength="20" value="<%=user.getUserPassword()%>">
                                        </div>
                                        <div class="form-group">
                                                <input type="text" class="form-control" placeholder="이름"  name="userName" maxlength="20" value="<%=user.getUserName()%>">
                                        </div>
                                        <div class="form-group" style="text-allign: center;">
                                                <div class="btn-group" data-toggle="buttons">
                                                        <label class="btn btn-primary active">
                                                                <input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
                                                        </label>
                                                        <label class="btn btn-primary active">
                                                                <input type="radio" name="userGender" autocomplete="off" value="여자" checked>여자
                                                        </label>
                                        </div>
                                        <div class="form-group">
                                                <input type="email" class="form-control" placeholder="이메일"  name="userEmail" maxlength="20" value="<%=user.getUserEmail() %>">
                                        </div>
                                        <input type="submit" class="btm btn-primary form-control" value="정보수정">
                                </form>
				<a onclick="return confirm('정말로 탈퇴하시겠습니까?')" href="userDeleteAction.jsp?userID=<%= userID %>" class="btn btn-primary">회원탈퇴</a>
                        </div>
                </div>
                <div class="col-lg-4"></div>
        </div>
	안녕하세요, <%=userID%>님
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <script src="js/bootstrap.js"></script>
</body>
</html>
