<%-- 
    Document   : registration
    Created on : Mar 8, 2020, 3:04:53 PM
    Author     : Nihal Dwivedi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <head>
    <link href="css/registration.css" rel="stylesheet" media="all">
      
</head>  

<body >
<%
    String m=(String)session.getAttribute("msg");
    if(m!=null){
%>
<hr><%= m %><hr>
<%
    session.setAttribute("msg",null);
    }
%>    
<div class="page-wrapper bg-gra-01 p-t-180 p-b-100 font-poppins">
        <div class="wrapper wrapper--w780">
            <div class="card card-3">
                <div class="card-heading"></div>
                <div class="card-body">
                    <h2 class="title"><b>Registration Info</b></h2>
<form action='Register.jsp' method='post'>
<div class="input-group">
                            <input class="input--style-3" type="email" placeholder="Enter Your Username" name="email">
                        </div>
						<div class="input-group">
                            <input class="input--style-3" type="text" placeholder="Enter Your Name" name="name">
                        </div>
						<div class="input-group">
                            <input class="input--style-3" type="number" placeholder="Enter Your Phone Number" name="phone">
                        </div>
						<div class="input-group">
                            <input class="input--style-3" type="number" placeholder="Enter Your Age" name="age">
                        </div>
						<div class="input-group">
                            <input class="input--style-3" type="password" placeholder="Enter Your Password" name="pass">
                        </div>
                        
                        <div class="p-t-10">
                            <button class="btn btn--pill btn--green" type="submit" onclick="myFunction()">Submit</button>
                        </div>
                    </form></br>
				    <font size="3" color="white"><p>Already have an account? </font><br><font size="4" color="pink"><a href='home.jsp'>Sign in</a></font></p>
                </div>
            </div>
        </div>
    </div>
<script>

function myFunction() {

alert("Registration Successful!!");

}

</script>
</body>
</html>
   