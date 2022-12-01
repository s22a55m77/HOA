<%-- 
    Document   : updateAssetActivitySave
    Created on : 11 25, 22, 3:00:56 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*, hoa.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Asset Activity Save</title>
    </head>
    <body>
        <jsp:useBean id="activityActionBean" class="hoa.activityAction" scope="session" />
        <% int assetID = 0;                              %>
        <% String s_assetID = request.getParameter("assetID");                  %>

        <% String status = request.getParameter("status");                     %>
        <% String activity_date = request.getParameter("activity_date");                     %>
        <% assetID = Integer.parseInt(s_assetID);                                %>
        
        <% activityActionBean.update(assetID, activity_date, status);                       %>
        Activity was updated<br>
        <a href="index.html">Go back to Main Menu</a>
    </body>
</html>
