<%-- 
    Document   : registerDonation
    Created on : 11 25, 22, 3:02:45 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Record Donation</title>
    </head>
    <body>
        <jsp:useBean id="assetBean" class="hoa.assetAction" scope="session" />
        <%                                                %>
        <jsp:useBean id="assetActivityBean" class="hoa.activityAction" scope="session" />
        <jsp:useBean id="officerActionBean" class="hoa.officerAction" scope="session" />
        <%  assetBean.getAssetNames();
            assetActivityBean.getOfficer();   
            officerActionBean.getNameForOfficer();
        %>
        <form name="register_donation" action="registerDonationSave.jsp" method="POST">
        
            <div>
                Select Asset that was donated
                <select name="assetID" id="assetID">
                    <% for (int i=0; i<assetBean.assetID.size(); i++) {     %>
                    <%     int assetID = assetBean.assetID.get(i);                    %>
                    <option value ="<%=assetID%>"><%=assetBean.names.get(i)%></option>
                    <% }                                                     %>
                </select>
            </div>
            
            <div>Enter Donor Complete Name <input type="text" name="donor_completename" id="donor_completename"><br></div>
            <div>Enter Donor Address <input type="text" name="donor_address" id="donor_address"><br></div>
            <div>Enter Amount <input type="text" name="amount" id="amount"><br></div>
            <div>Enter Donor's form Filename <input type="text" name="donorsform_filename" id="donorsform_filename"><br></div>
            <div>Enter Date YYYY-MM-DD <input type="date" name="donation_date" id="donation_date"><br></div>
            
            <div>
                Select Accepting Officer
                <select name="acceptingOfficer" id="officers">
                    <% for (int i=0; i<officerActionBean.names.size(); i++) {     %>
                    <%     int officerID = officerActionBean.IDs.get(i);                    %>
                    <option value ="<%=officerID%>"><%=officerActionBean.names.get(i)%></option>
                    <% }                                                     %>
                </select>
            </div>

            <div>
                Select Authorizing President
                <select name="authorizing_president" id="officers">
                    <% for (int i=0; i<officerActionBean.names.size(); i++) {     %>
                    <%     int officerID = officerActionBean.IDs.get(i);                    %>
                    <option value ="<%=officerID%>"><%=officerActionBean.names.get(i)%></option>
                    <% }                                                     %>
                </select>
            </div> 
            
            <input type="submit" value="Register Donation" name="registerDonation">
        </form>
                
                
        
    </body>
</html>
