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
        <jsp:useBean id="assetActionBean" class="hoa.assetAction" scope="session" />
        <% int assetID = 0;                %>
        <% String asset_type = request.getParameter("asset_type");                %>
        <% String asset_desc = request.getParameter("asset_desc");               %>
        <% String aquisition_date = request.getParameter("aquisition_date");           %>
        <% boolean for_rent = false;                       %>
        <% double asset_value = 0;                %>
        <% String asset_status = request.getParameter("asset_status"); %>
        <% double asset_locX = 0; %>
        <% double asset_locY = 0; %>                               %>
        
        <% assetActionBean.register(for_rent, asset_value, asset_status, asset_locX, asset_locY, assetID);               %>             
        Asset was registered<br>
        <a href="index.html">Go back to Main Menu</a>
    </body>
</html>
