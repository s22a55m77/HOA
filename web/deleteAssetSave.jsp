<%-- 
    Document   : deleteAssetSave
    Created on : 11 25, 22, 2:59:50 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*, hoa.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Asset</title>
    </head>
    <body>
        <jsp:useBean id="assetActionBean" class="hoa.assetAction" scope="session" />
        <%
            int assetID;
            String s_assetID = request.getParameter("assetID");
            assetID = Integer.parseInt(s_assetID);
            assetActionBean.delete(assetID);
        %>
        <h1>Submitted!</h1>
        <a href="index.html">Go back to Main Menu</a>
    </body>
</html>
