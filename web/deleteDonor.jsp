<%-- 
    Document   : deleteDonor
    Created on : 11 25, 22, 3:03:48 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Donor Information</title>
    </head>
    <body>
        <jsp:useBean id="donationActivityBean" class="hoa.donationAction" scope="session" />
        <% donationActivityBean.getDonations();                                                 %>
        <form name="delete_donor" action="deleteDonorProcess.jsp" method="POST">
            <div>
                Select which asset of donor information you want to delete
                <select name="assetID" id="assetID">
                    <% for (int i=0; i<donationActivityBean.donations.size(); i++) {     %>
                    <%     int assetID = donationActivityBean.donations.get(i);                    %>
                    <option value ="<%=assetID%>"><%=donationActivityBean.names.get(i)%></option>
                    <% }                                                     %>
                </select>
            </div>

            <input type="submit" value="Next" name="deleteDonor">
        </form>
        <a href="index.html">Go back to Main Menu</a>
    </body>
</html>
