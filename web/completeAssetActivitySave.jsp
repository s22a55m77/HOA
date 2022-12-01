<%-- 
    Document   : completeAssetActivitySave
    Created on : 11 25, 22, 3:01:40 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*, hoa.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complete Asset Activity</title>
    </head>
    <body>
        <jsp:useBean id="activityActionBean" class="hoa.activityAction" scope="session" />
        <% int assetID = 0;                %>
        <% String actual_sdate = request.getParameter("actual_sdate");                     %>
        <% String actual_edate = request.getParameter("actual_edate");                     %>
        <% String s_assetID = request.getParameter("assetID");                  %>
        <% String activity_date = request.getParameter("activity_date");                     %>
        <% assetID = Integer.parseInt(s_assetID);                                %>
        <% activityActionBean.updateDate(assetID, activity_date, actual_sdate, actual_edate);                       %>
        <h1>Submitted!</h1>
        <a href="index.html">Go back to Main Menu</a>
    </body>
</html>
