<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%--@ page import="java.io.PrintWriter" --%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
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
//                session.setAttribute("userID",user.getUserID());
                %><script type="text/javascript">
                alert('이미 로그인 되어있습니다.');
                location.href = 'main.jsp';</script><%
        }


  UserDAO userDAO = new UserDAO();
//  String id = user.getUserID(); String pw = user.getUserPassword;
  int result = userDAO.login(user.getUserID(), user.getUserPassword());

  if(result == 1){%><script>
   alert('login success'); </script><%
   session.setAttribute("userID",user.getUserID());%><script>
   location.href = 'main.jsp';</script><%
  }else if(result == 0){%><script>
   alert('비밀번호가 틀립니다.');
   history.back();</script><%
  }else if(result == -1){%><script>
   alert('존재하지 않는 아이디입니다.');
   history.back();</script><%
  }else if(result == -2){%><script>
   alert('DB 오류가 발생했습니다.');
   history.back();</script><%
  }else if(result == -3){%><script>
   alert('asdfjasdfjkla');
   history.back();</script><%
  }
%>
</body>
</html>
