<%-- 
    Document   : PoseNet
    Created on : Mar 6, 2020, 4:30:52 PM
    Author     : Nihal Dwivedi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PoseNet</title>
        
<script src="../js/sketch.js"></script>
    </head>
    <body>
<!--        <h1>Welcome to Posenet&nbsp;&nbsp;<a href='Profile.jsp'>back</a>
            <a href='PoseNet.jsp'>Refresh</a></h1>-->
            
        
        <style>
            iframe{
                width: 100%;
                border: 2px solid #ccc;
            }
        </style> 
        
        <iframe src="js/index.html" id="pose" s>
      </iframe>
        <script>
            var iframe = document.getElementById("pose");
            iframe.onload = function(){
                iframe.style.height = iframe.contentWindow.document.body.scrollHeight + 'px';
            }
        </script>
    </body>
</html>
