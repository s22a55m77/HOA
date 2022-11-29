<%-- 
    Document   : deleteDonorSave
    Created on : 11 25, 22, 3:03:58 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*, hoa.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Submit Delete Donor</title>
    </head>
    <body>
        <jsp:useBean id="donationActionBean" class="hoa.donationAction" scope="session" />
        <% int assetID = 0;                %>
        <% String s_assetID = request.getParameter("assetID");                  %>
        <% assetID = Integer.parseInt(s_assetID);                                %>
        <% donationActionBean.delDonor(assetID);                       %>
        Donor Information was successfully deleted<br>
        <a href="index.html">Go back to Main Menu</a>
    </body>
</html>
