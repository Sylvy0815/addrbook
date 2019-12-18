<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%--@ page import="java.io.PrintWriter" --%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> UserDeleteAction </title>
</head>
<body>
<%
        String userID = null;
        if(session.getAttribute("userID") != null){
                userID = (String) session.getAttribute("userID");
        }
        
%>
<%
	UserDAO userDAO = new UserDAO();
        int result = userDAO.delete(userID);
        if(result == -1){%><script>
                alert('탈퇴 실패 DB ERROR');
                history.back();</script><%
        } 
        else{
                session.invalidate();%><script>
                alert('탈퇴되었습니다.');
		location.href='main.jsp';</script><%
        }
%>
</body>
</html>
         
