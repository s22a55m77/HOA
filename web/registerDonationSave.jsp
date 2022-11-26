<%-- 
    Document   : registerDonationSave
    Created on : 11 25, 22, 3:02:55 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*, hoa.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Submit Donation</title>
    </head>
    <body>
        <jsp:useBean id="donationBean" class="hoa.donationAction" scope="session" />
        <% int authorizing_president;                %>
        <% int acceptingOfficer;                %>
        <% int assetID;
           String donor_completename;
           String donor_address;
           double amount;
           String donorsform_filename;
           String donation_date;%>
        <% String s_authorizing_president = request.getParameter("authorizing_president");
           String s_acceptingOfficer   = request.getParameter("acceptingOfficer");                       
           String s_assetID = request.getParameter("assetID");
           String s_amount = request.getParameter("amount");
           
           donor_completename = request.getParameter("donor_completename");
           donor_address = request.getParameter("donor_address");  
           donorsform_filename = request.getParameter("donorsform_filename");
           donation_date = request.getParameter("donation_date");
           
           authorizing_president = Integer.parseInt(s_authorizing_president);                                
           acceptingOfficer   = Integer.parseInt(s_acceptingOfficer);                                  
           assetID = Integer.parseInt(s_assetID);
           amount = Double.parseDouble(s_amount);
        %>
           
        <% donationBean.record(assetID, donor_completename, donor_address, amount, acceptingOfficer, donorsform_filename, donation_date, authorizing_president);                       %>
        Donation was submitted<br>
        <a href="index.html">Go back to Main Menu</a>
    </body>
</html>
