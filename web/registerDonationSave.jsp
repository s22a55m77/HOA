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
        <jsp:useBean id="assetActionBean" class="hoa.assetAction" scope="session" />
        <% String asset_type = request.getParameter("asset_type");                %>
        <% String asset_desc = request.getParameter("asset_desc");               %>
        <% String aquisition_date = request.getParameter("aquisition_date");           %>
        <% String s_for_rent = request.getParameter("for_rent");                    %>
        <% String s_asset_value = request.getParameter("asset_value");                %>
        <% String asset_status = request.getParameter("asset_status"); %>
        <% String s_asset_locX = request.getParameter("asset_locX"); %>
        <% String s_asset_locY = request.getParameter("asset_locY"); 
           String hoaname = request.getParameter("hoaname"); 
           String asset_name = request.getParameter("asset_name"); 
           String s_containing_asset = request.getParameter("containing_asset"); 
           int containing_asset;
            boolean for_rent = false;
            if (s_for_rent == "for_rent")
                for_rent = true;
            
            double asset_value = Double.parseDouble(s_asset_value);
            double locX = Double.parseDouble(s_asset_locX);
            double locY = Double.parseDouble(s_asset_locY);
            if (s_containing_asset == "")
                containing_asset = 9999999;
            else
                containing_asset = Integer.parseInt(s_containing_asset);
            
            assetActionBean.getNewAssetID();
            int assetID = assetActionBean.newAssetID;
        %>    
        
        <% assetActionBean.register(for_rent, asset_value, asset_status, aquisition_date, asset_desc, asset_type, locX, locY, hoaname, asset_name, containing_asset);               %>
        <% int authorizing_president;                %>
        <% int acceptingOfficer;                %>
        <% 
           String donor_completename;
           String donor_address;
           double amount;
           String donorsform_filename;
           String donation_date;%>
        <% String s_authorizing_president = request.getParameter("authorizing_president");
           String s_acceptingOfficer   = request.getParameter("acceptingOfficer");                       
           String s_amount = request.getParameter("amount");
           
           donor_completename = request.getParameter("donor_completename");
           donor_address = request.getParameter("donor_address");  
           donorsform_filename = request.getParameter("donorsform_filename");
           donation_date = request.getParameter("donation_date");
           
           authorizing_president = Integer.parseInt(s_authorizing_president);                                
           acceptingOfficer   = Integer.parseInt(s_acceptingOfficer);                                  
           amount = Double.parseDouble(s_amount);
        %>
           
        <% donationBean.record(assetID, donor_completename, donor_address, amount, acceptingOfficer, donorsform_filename, donation_date, authorizing_president);                       %>
        Donation was submitted<br>
        <a href="index.html">Go back to Main Menu</a>
    </body>
</html>
