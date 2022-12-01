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
        <jsp:useBean id="activityActionBean" class="hoa.activityAction" scope="session" />
        <% int assetID = 0;                %>
        <% int authorizing_president = 0;                %>
        <% int authorizingOfficer = 0;                %>
        <% double cost = 0;                %>
        <% int ORnumber = 0;                %>
        <% String s_assetID = request.getParameter("assetID");                  %>
        <% String activity_description = request.getParameter("activity_description");                     %>
        <% String s_authorizing_president = request.getParameter("authorizing_president");                  %>
        <% String s_authorizingOfficer   = request.getParameter("authorizingOfficer");                       %>
        <% String activity_date = request.getParameter("activity_date");                     %>
        <% String tentative_sdate = request.getParameter("tentative_sdate");                     %>
        <% String tentative_edate = request.getParameter("tentative_edate");                     %>
        <% String actual_sdate = request.getParameter("actual_sdate");                     %>
        <% String actual_edate = request.getParameter("actual_edate");                     %>
        <% String s_cost = request.getParameter("cost");                     %>
        <% String s_ORnumber = request.getParameter("ORnumber");                     %>
        <% String status = request.getParameter("status");                     %>
        
        <% assetID = Integer.parseInt(s_assetID);                                %>
        <% authorizing_president = Integer.parseInt(s_authorizing_president);                                %>
        <% authorizingOfficer   = Integer.parseInt(s_authorizingOfficer);                                  %>
        <% cost   = Integer.parseInt(s_cost);                                  %>
        <% ORnumber   = Integer.parseInt(s_ORnumber);                                  %>
        
        <% activityActionBean.record(assetID, 
                            activity_description,
                            authorizing_president, 
                            authorizingOfficer, 
                            cost, 
                            ORnumber, 
                            activity_date, 
                            tentative_sdate,
                            tentative_edate,
                            actual_sdate,
                            actual_edate,
                            status);                       %>
        Activity was submitted<br>
        <a href="index.html">Go back to Main Menu</a>
    </body>
</html>
