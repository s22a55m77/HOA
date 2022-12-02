<%-- 
    Document   : registerDonation
    Created on : 11 25, 22, 3:02:45 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*, hoa.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Record Donation</title>
    </head>
    <body>
        <jsp:useBean id="assetActionBean" class="hoa.assetAction" scope="session" />
        <jsp:useBean id="assetActivityBean" class="hoa.activityAction" scope="session" />
        <jsp:useBean id="officerActionBean" class="hoa.officerAction" scope="session" />
        <jsp:useBean id="assetActionbean" class="hoa.assetAction" scope="session" />   
        <jsp:useBean id="hoaActionBean" class="hoa.hoaAction" scope="session" />    
        <% assetActionBean.getAssetNames(); %>
        <% assetActionbean.getAssetIDs(); 
           hoaActionBean.getNames();
           assetActivityBean.getOfficer();   
           officerActionBean.getNameForOfficer();
        %>
        <form name="register_donation" action="registerDonationSave.jsp" method="POST">

            Asset Name : <input type="text" name="asset_name" id="asset_name"><br><br>
            Hoa Owner: 
            <select name="hoaname" id="hoaname">
                <%
                    for(int i=0; i<hoaActionBean.names.size(); i++){
                        String hoaname = hoaActionBean.names.get(i);
                %>
                <option name="hoaname" value="<%=hoaname%>"><%=hoaname%></option>
                <%
                    }
                %>
            </select><br>
            Asset Description : <textarea  id="for_rent" name="asset_desc" row="10" col="20"></textarea><br>
            Aquistion Date: <input type="date" name="aquistion_date" id="aquisition_date"><br><br>
            Renting Availability: <select id="for_rent" name="for_rent">
                <option value="for_rent">For Rent</option>
                <option value="Not for_rent">Not For Rent</option>
            </select><br><br>
            Asset Value: <input type="number" id ="asset_value" name="asset_value"><br><br>
            Asset Type:<select id="asset_type" name="asset_type">
                    <option value="P" selected>Property</option>
                    <option value="E">Equipment</option>
                    <option value="F">Furniture and Fixtures</option>
                    <option value="O">Others</option>
                </select><br><br>
            Asset Status:<select id="asset_status" name="asset_status">
                    <option value="W" selected>Working condition</option>
                    <option value="D">Deteriorated</option>
                    <option value="F">For Repair</option>
                    <option value="I">For Disposal</option>
                    <option value="P">Disposed</option>
                </select><br><br>
            Asset Location: <input type="number" id="asset_locX" name="asset_locX">
            <input type="number" id="asset_locY" name="asset_locY"><br><br>

            Containing Asset:
            <select name="containing_asset" id="containing_asset">
                <% for (int i=0; i<assetActionBean.assetID.size(); i++) {     %>
                <%     int assetID = assetActionBean.assetID.get(i);                    %>
                <option value ="<%=assetID%>"><%=assetActionBean.names.get(i)%></option>
                <% }                                                     %>
                <option value ="">none</option>
            </select>
            <br>
            <div>Enter Donor Complete Name <input type="text" name="donor_completename" id="donor_completename"><br></div>
            <div>Enter Donor Address <input type="text" name="donor_address" id="donor_address"><br></div>
            <div>Enter Amount <input type="text" name="amount" id="amount"><br></div>
            <div>Enter Donor's form Filename <input type="text" name="donorsform_filename" id="donorsform_filename"><br></div>
            <div>Enter Date <input type="date" name="donation_date" id="donation_date"><br></div>
            
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
