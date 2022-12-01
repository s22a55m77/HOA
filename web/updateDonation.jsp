<%-- 
    Document   : updateDonation
    Created on : 11 25, 22, 3:03:09 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Donation</title>
    </head>
    <body>
        <jsp:useBean id="donationBean" class="hoa.donationAction" scope="session" />
        <%
            donationBean.getDonations(); %>
            
            
        <form name="update_donation_select" action="updateDonationProcess.jsp" method="POST">
            <div>
                Select Asset
                <select name="assetID" id="assetID">
                    <% for (int i=0; i<donationBean.donations.size(); i++) {     %>
                    <%     int assetID = donationBean.donations.get(i);                    %>
                    <option value ="<%=assetID%>"><%=donationBean.names.get(i)%></option>
                    <% }                                                     %>
                </select>
            </div>
            <input type="submit" value="Select" name="update_donation_select">
        </form>
                
                
    </body>
</html>
