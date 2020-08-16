<html>
<head>
    <%@page import="java.sql.*;"%>
    <%@page import="java.util.HashMap"%>
    <style type="text/css">
    
    body{
        background-image: url(ExtraFiles/Background.png);
        margin-top: 15%;
       
    }
    #admindetail h2{
            opacity: 70%;
            color: white; 
            margin-left: 2em;
            letter-spacing: 5px; 
            padding: 10px;
            min-width: 1200px;
            display: flex;
            justify-content: space-between;
            background: linear-gradient(top, #3c3c3c 0%, #222222 100%);
            background: -webkit-linear-gradient(top, #3c3c3c 0%, #222222 100%);
        
        }
        #admindetail{
            position: absolute;
            top:1em;
        }
         #admindetail h2 a{
            text-decoration: none;
            color: white;
        }
    table{
        opacity: 70%;
        width: 1330px;
        margin: auto;
        text-align: center;
        table-layout: fixed;
    }
    table, tr, th, td{
        padding: 20px;
        color: white;
        border: 1px solid #080808;
        border-collapse: collapse;
        font-size: 18px;
        font-family: Arial;
        background: linear-gradient(top, #3c3c3c 0%, #222222 100%);
        background: -webkit-linear-gradient(top, #3c3c3c 0%, #222222 100%);
    }
    td:hover{
        background: lightseagreen;
    }
    
    #abc a:active{
         background-color: lightseagreen;
  box-shadow: 0 5px black;
  transform: translateY(4px);
    }
  .submit-btn ,#abc a {
  padding: 10px 20px;
  font-size: 24px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: white;
  text-decoration: none;
  background-color: black;
  border: none;
  height: 30px;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}

.submit-btn:hover {background-color: black}

.submit-btn:active {
  background-color: lightseagreen;
  box-shadow: 0 5px black;
  transform: translateY(4px);
}
  #abc {
      opacity: 0.7;
      background: linear-gradient(top, #3c3c3c 0%, #222222 100%);
      background: -webkit-linear-gradient(top, #3c3c3c 0%, #222222 100%);
      color: white;
      height: 60px;
      font-family: monospace;
      font-size: 1.6em;
      /*font-weight:;*/
      margin-left: 2em;
      display: flex;
      justify-content: space-between
  }
  #abc span{
      margin-top: 1em;
      margin-left: 1em;
  }
  

    
</style>

</head>
<body>
    
    
    <%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=(Connection)DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/testdb","root","nihal");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from user_info;");
    %><table border=1 align=center style="text-align:center">
      <thead>
          <tr>
             <th>Email</th>
             <th>Name</th>
             <th>Phone</th>
             <th>Age</th>
          </tr>
      </thead>
      <tbody>
        <%while(rs.next())
        {
            %>
            <tr>
                <td><%=rs.getString("email") %></td>
                <td><%=rs.getString("name") %></td>
                <td><%=rs.getString("phone") %></td>
                <td><%=rs.getString("age") %></td>
            </tr>
            <%}%>
           </tbody>
        </table><br>
    <%}
    catch(Exception e){
        out.print(e.getMessage());%><br><%
    } 
    %>
</body>
</html>

<%
HashMap hma=(HashMap)session.getAttribute("AdminDetails");
if(hma!=null){
    String ea=(String)hma.get("Aemail");
    String na=(String)hma.get("Name");
    out.println("<html><body><div id='admindetail'>");
    out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
    + "<h2 '>Hello! "+na+"<a href='Logout.jsp'>Logout</a></h2>");
    out.println("<div id='abc'><span>Email: "+ea+"</span>");
    out.println("&nbsp;&nbsp;&nbsp;&nbsp;<a href='js/trainindex.html'>save</a>");
    out.println("&nbsp;&nbsp;&nbsp;&nbsp;<a href='js/neuralindex.html'>train</a> ");
    out.println("</div></div></body></html>");
    out.close();
}else{session.setAttribute("msg","Plz Login First!");
    response.sendRedirect("home.jsp");
}
%>