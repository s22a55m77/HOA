<%-- 
    Document   : addPictureSave
    Created on : 11 29, 22, 9:15:11 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*, hoa.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Save Donation Picture</title>
    </head>
    <body>
        <jsp:useBean id="assetActivityBean" class="hoa.activityAction" scope="session" />
        <% assetActivityBean.getOfficer();    %>
        <jsp:useBean id="donationBean" class="hoa.donationAction" scope="session" />
        <%
            int assetID;
            String s_assetID = request.getParameter("assetID");
            String filename = request.getParameter("filename");
            assetID = Integer.parseInt(s_assetID);
        %>
        <%   donationBean.savePicture(assetID, filename); %>
        
        
        <h1>Picture added</h1>
        <div>Click <a href="addPicture.jsp">here</a> to add another picture</div>
        <div>Click <a href="index.html">here</a> to back to main menu</div>
    </body>
</html>
