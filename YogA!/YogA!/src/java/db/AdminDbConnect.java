package db;

import java.sql.*;
import java.util.HashMap;

public class AdminDbConnect {
    private Connection c;
    private Statement st;
    private PreparedStatement AdmincheckLogin;
    public AdminDbConnect() throws Exception{
        Class.forName("com.mysql.jdbc.Driver");
c=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/testdb","root","nihal");
st=c.createStatement();
AdmincheckLogin=c.prepareStatement("select * from admin_info where Aemail=? and Apass=?");
    }
    public HashMap AdmincheckLogin(String ea,String pa)throws Exception{
        AdmincheckLogin.setString(1, ea);
        AdmincheckLogin.setString(2, pa);
        ResultSet rsa=AdmincheckLogin.executeQuery();
        if(rsa.next()){
            HashMap hma=new HashMap();
            hma.put("Aemail",ea);
            hma.put("Name",rsa.getString("name"));
            //session.setAttribute("AdminDetails",hma);
            //response.sendRedirect("Alogin.jsp");
            return hma;
        }else{
            return null;
        }
    }
}
