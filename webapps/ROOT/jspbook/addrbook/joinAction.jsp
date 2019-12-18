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
<title> LoginAction </title>
</head>
<body>
<%
        String userID = null;
        if(session.getAttribute("userID") != null){
                userID = (String) session.getAttribute("userID");
        }
        if(userID != null){
                %><script type="text/javascript">
                alert('이미 로그인 되어있습니다.');
                location.href = 'main.jsp'</script><%
        }
%>
<script type="text/javascript">
	var id=<%=user.getUserID()%>;
        var pw=<%=user.getUserPassword()%>;
        var nm=<%=user.getUserName()%>;
        var gd=<%=user.getUserGender()%>;
        var em=<%=user.getUserEmail()%>;
	if(id==null||pw==null||nm||null||gd||null||em||null){
		alert('기입되지않은 항목이 있습니다.');
		history.back();
	}else{
</script>
<%
	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(user);
	if(result == -1){%><script>
		alert('이미 존재하는 아이디입니다.');
		history.back();</script><%
	}
	else{
		session.setAttribute("userID", user.getUserID());%><script>
		location.href='main.jsp';</script><%
	}
		
 %>
</body>
</html>
