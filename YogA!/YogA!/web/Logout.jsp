<%@page import="java.util.HashMap"%>
<%
    HashMap hm=(HashMap)session.getAttribute("userDetails");
if(hm!=null){
    session.invalidate();
    response.sendRedirect("home.jsp");
}else{
    session.setAttribute("msg","");
    response.sendRedirect("home.jsp");
}
%>