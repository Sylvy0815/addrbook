<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ab2.Ab2DAO" %>
<%--@ page import="java.io.PrintWriter" --%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="ab2" class="ab2.Ab2" scope="page" />
<jsp:setProperty name="ab2" property="ab2Name" />
<jsp:setProperty name="ab2" property="ab2Tel" />
<jsp:setProperty name="ab2" property="ab2Birth" />
<jsp:setProperty name="ab2" property="ab2Com" />
<jsp:setProperty name="ab2" property="ab2Memo" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> ab2writeAction </title>
</head>
<body>
<%
        String userID = null;
        if(session.getAttribute("userID") != null){
                userID = (String) session.getAttribute("userID");
        }
        if(userID == null){
                %><script type="text/javascript">
                alert('로그인을하세요.');
                location.href = 'index.jsp'</script><%
        } else{
		if(ab2.getAb2Name() == null || ab2.getAb2Tel() == null || ab2.getAb2Birth() == null || ab2.getAb2Com() == null || ab2.getAb2Memo() == null){%><script>
			alert('입력이 안 된 사항이 있습니다.');
			history.back();</script><%
		} else{
			Ab2DAO ab2DAO = new Ab2DAO();
			int result = ab2DAO.write(ab2.getAb2Name(), userID, ab2.getAb2Tel(), ab2.getAb2Birth(), ab2.getAb2Com(), ab2.getAb2Memo());
			if(result==-1){%><script> var result=<%=result%>;
				alert('글쓰기에 실패했습니다.'+result);
				history.back();</script><%
			} else{%><script>
				location.href = 'addrbook2_list.jsp';</script><%
			}
		}				
	}
%>
</body>
</html>
