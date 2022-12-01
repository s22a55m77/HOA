<%-- 
    Document   : addPicture
    Created on : 11 29, 22, 9:13:46 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Donation Picture</title>
    </head>
    <body>
        <jsp:useBean id="donationBean" class="hoa.donationAction" scope="session" />
        <% donationBean.getDonations(); %>
        <form name="add_picture" action="addPictureSave.jsp" method="POST">
            
            <div>
                Select Asset
                <select name="assetID" id="assetID">
                    <% for (int i=0; i<donationBean.donations.size(); i++) {     %>
                    <%     int assetID = donationBean.donations.get(i);                    %>
                    <option value ="<%=assetID%>"><%=donationBean.names.get(i)%></option>
                    <% }                                                     %>
                </select>
            </div>
            
            <div>Enter Picture Filename <input type="text" name="filename" id="donorsform_filename"><br></div>
            <input type="submit" value="Add Picture" name="add_picture">
        </form>
    </body>
</html>
