<%-- 
    Document   : registerAssetActivitySave
    Created on : 11 25, 22, 2:58:26 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*, hoa.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Submit Activity</title>
    </head>
    <body>
        <!-- TODO -->
        <jsp:useBean id="salesBean" class="hoa.activityAction" scope="session" />
        <% int authorizing_president = 0;                %>
        <% int authorizingOfficer = 0;                %>
        <% String s_authorizing_president = request.getParameter("authorizing_president");                  %>
        <% String s_authorizingOfficer   = request.getParameter("authorizingOfficer");                       %>
        <% String s_activity_date = request.getParameter("activity_date");                     %>
        <% authorizing_president = Integer.parseInt(s_authorizing_president);                                %>
        <% authorizingOfficer   = Integer.parseInt(s_authorizingOfficer);                                  %>
        <div><span value="<%=s_activity_date%>"></span></div> 
        <% salesBean.record(authorizing_president, authorizingOfficer, s_activity_date);                       %>
        Activity was submitted<br>
        <a href="index.html">Go back to Main Menu</a>
    </body>
</html>
