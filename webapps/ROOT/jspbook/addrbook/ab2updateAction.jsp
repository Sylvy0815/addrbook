<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ab2.Ab2DAO" %>
<%@ page import="ab2.Ab2" %>
<%--@ page import="java.io.PrintWriter" --%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Ab2 UpdateAction </title>
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

	else{
                if(request.getParameter("ab2Name") == null || request.getParameter("ab2Tel") == null || request.getParameter("ab2Birth") == null || request.getParameter("ab2Com") == null || request.getParameter("ab2Memo") == null){%><script>
                        alert('입력이 안 된 사항이 있습니다.');
                        history.back();</script><%
                } else{
                        Ab2DAO ab2DAO = new Ab2DAO();
                        int result = ab2DAO.update(ab2ID, request.getParameter("ab2Name"), request.getParameter("ab2Tel"), request.getParameter("ab2Birth"), request.getParameter("ab2Com"), request.getParameter("ab2Memo"));
                        if(result==-1){%><script> var result=<%=result%>;
                                alert('주소록 수정에 실패했습니다.'+result);
                                history.back();</script><%
                        } else{%><script>
                                location.href = 'addrbook2_list.jsp';</script><%
                        }
                }
	}
%>
</body>
</html>
