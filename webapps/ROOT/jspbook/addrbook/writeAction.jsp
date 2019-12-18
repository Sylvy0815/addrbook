<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%--@ page import="java.io.PrintWriter" --%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> writeAction </title>
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
		if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null){%><script>
			alert('입력이 안 된 사항이 있습니다.');
			history.back();</script><%
		} else{
			BbsDAO bbsDAO = new BbsDAO();
			int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
			if(result==-1){%><script> var result=<%=result%>;
				alert('글쓰기에 실패했습니다.'+result);
				history.back();</script><%
			} else{%><script>
				location.href = 'bbs.jsp';</script><%
			}
		}				
	}
%>
</body>
</html>
