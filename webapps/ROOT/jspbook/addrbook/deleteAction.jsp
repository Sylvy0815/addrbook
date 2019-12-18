<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%--@ page import="java.io.PrintWriter" --%>
<% request.setCharacterEncoding("UTF-8"); %>
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
        } 

                int bbsID = 0;
                if(request.getParameter("bbsID") != null){
                        bbsID = Integer.parseInt(request.getParameter("bbsID"));
                }
                if(bbsID == 0){
                         %><script type="text/javascript">
                        alert('유효하지않은 글입니다.');
                        location.href = 'bbs.jsp'</script><%
                }
                Bbs bbs = new BbsDAO().getBbs(bbsID);
                if(!userID.equals(bbs.getUserID())){
                        %><script type="text/javascript">
                        alert('권한이 없습니다.');
                        location.href = 'bbs.jsp'</script><%
                }

	else{
			BbsDAO bbsDAO = new BbsDAO();
			int result = bbsDAO.delete(bbsID);
			if(result==-1){%><script> var result=<%=result%>;
				alert('글삭제에 실패했습니다.'+result);
				history.back();</script><%
			} else{%><script>
				location.href = 'bbs.jsp';</script><%
			}
	}
%>
</body>
</html>
