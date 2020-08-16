<%@page import="java.util.HashMap"%>
<%@page import="java.sql.*"%>
<%
String ea=request.getParameter("Aemail");
String pa=request.getParameter("Apass");
db.AdminDbConnect d=new db.AdminDbConnect();
HashMap hma=d.AdmincheckLogin(ea, pa);
if(hma!=null){
        session.setAttribute("AdminDetails",hma);
        response.sendRedirect("AdminProfile.jsp");
}else{
    session.setAttribute("msg","Wrong Entries!");
    response.sendRedirect("home.jsp");
}
%>