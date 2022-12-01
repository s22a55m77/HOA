<%-- 
    Document   : updateDonationProcess
    Created on : 11 29, 22, 11:59:28 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*, hoa.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Donation</title>
    </head>
    <body>
        <jsp:useBean id="assetActivityBean" class="hoa.activityAction" scope="session" />
        <% assetActivityBean.getOfficer();    %>
       <jsp:useBean id="donationBean" class="hoa.donationAction" scope="session" />
       <jsp:useBean id="officerActionBean" class="hoa.officerAction" scope="session" />
        <%
           officerActionBean.getNameForOfficer();
        %>
        <%
            int assetID;
            String s_assetID = request.getParameter("assetID");
            assetID = Integer.parseInt(s_assetID);
            donation donation = donationBean.getDonation(assetID);
        %>
        
        <form name="update_donation" action="updateDonationSave.jsp" method="POST">
            <div>
                Select Asset that was donated
                <select name="assetID" id="assetID">
                    <option value ="<%=assetID%>"><%=assetID%></option>
                </select>
            </div>
            
            <div>Enter Donor Complete Name <input type="text" name="donor_completename" id="donor_completename" value="<%=donation.donor_completename%>"><br></div>
            <div>Enter Donor Address <input type="text" name="donor_address" id="donor_address" value="<%=donation.donor_address%>"><br></div>
            <div>Enter Amount <input type="text" name="amount" id="amount" value="<%=donation.amount%>" ><br></div>
            <div>Enter Donor's form Filename <input type="text" name="donorsform_filename" id="donorsform_filename" value="<%=donation.donorsform_filename%>"><br></div>
            <div>Enter Date  <input type="date" name="donation_date" id="donation_date" value="<%=donation.donation_date%>"><br></div>
            
            <div>
                Select Accepting Officer
                <select name="acceptingOfficer" id="officers">
                    <% for (int i=0; i<officerActionBean.names.size(); i++) {     %>
                    <%     int officerID = officerActionBean.IDs.get(i);                    
                     if (officerID == donation.acceptingOfficer) {%>
                        <option value ="<%=officerID%>" selected="selected"><%=officerActionBean.names.get(i)%></option>
                    <% } else { %>  
                    <option value ="<%=officerID%>"><%=officerActionBean.names.get(i)%></option>
                    <% } }                                                     %>
                </select>
            </div>

            <div>
                Select Authorizing President
                <select name="authorizing_president" id="officers">
                    <% for (int i=0; i<officerActionBean.names.size(); i++) {     %>
                    <%     int officerID = officerActionBean.IDs.get(i);  
                           if (officerID == donation.authorizing_president) {%>
                        <option value ="<%=officerID%>" selected="selected"><%=officerActionBean.names.get(i)%></option>
                    <% } else {                                                     %>
                    
                    <option value ="<%=officerID%>" ><%=officerActionBean.names.get(i)%></option>
                    <% } }                                                     %>
                </select>
            </div> 
            
            <input type="submit" value="Update Donation" name="registerDonation">
        </form>
    </body>
</html>
