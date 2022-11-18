<%-- 
    Document   : registerAssetSave
    Created on : 11 18, 22, 2:04:09 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="hoa.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Save Register</title>
    </head>
    <body>
        <jsp:useBean id="assetbean" class="hoa.assetAction" scope="session" />
        <%
            assetbean.register();
        %>
    </body>
</html>
