<%-- 
    Document   : registerAssetActivity
    Created on : 11 25, 22, 2:32:37 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Asset Activity</title>
    </head>
    <body>
        <jsp:useBean id="assetActivityBean" class="hoa.activityAction" scope="session" />
        <jsp:useBean id="assetBean" class="hoa.assetAction" scope="session" />
        <jsp:useBean id="officerActionBean" class="hoa.officerAction" scope="session" />
        <jsp:useBean id="ornumberActionBean" class="hoa.ornumberAction" scope="session" />
        <% assetBean.getAssetNames();                                                
           assetActivityBean.getOfficer();
           officerActionBean.getNameForOfficer();
           ornumberActionBean.getORnumber();
        %>
        <form name="register_asset_activity" action="registerAssetActivitySave.jsp" method="POST">
        
            <div>
                Select Asset 
                <select name="assetID" id="assetID">
                    <% for (int i=0; i<assetBean.assetID.size(); i++) {     %>
                    <%     int assetID = assetBean.assetID.get(i);                    %>
                    <option value ="<%=assetID%>"><%=assetBean.names.get(i)%></option>
                    <% }                                                       %>
                </select>
            </div>
            <div>Enter activity date <input type="date" name="activity_date" id="activity_date" required><br></div>

            <div>
                Select authorizing officer
                <select name="authorizingOfficer" id="authorizingOfficer">
                    <% for (int i=0; i<officerActionBean.names.size(); i++) {     %>
                    <%     int officerID = officerActionBean.IDs.get(i);                    %>
                    <option value ="<%=officerID%>"><%=officerActionBean.names.get(i)%></option>
                    <% }                                                      %>
                </select>
            </div>
            <div>Enter description <textarea description="activity_description" name="activity_description" id="activity_description" row="10" col="20"></textarea><br></div>
            <div>
                Select authorizing president
                <select name="authorizing_president" id="authorizing_president">
                    <% for (int i=0; i<officerActionBean.names.size(); i++) {     %>
                    <%     int officerID = officerActionBean.IDs.get(i);                    %>
                    <option value ="<%=officerID%>"><%=officerActionBean.names.get(i)%></option>
                    <% }                                                     %>
                </select>
            </div>
                
            <div>Enter tentative start date <input type="date" name="tentative_sdate" id="tentative_sdate" required><br></div>
            <div>Enter tentative end date <input type="date" name="tentative_edate" id="tentative_edate" required><br></div>
            <div>Enter actual start date <input type="date" name="actual_sdate" id="actual_sdate"><br></div>
            <div>Enter actual end date <input type="date" name="actual_edate" id="actual_edate"><br></div>
            <div>Enter cost <input type="text" name="cost" id="cost" required><br></div>
            <div>Select OR number 
                <select name="ORnumber" id="ORnumber">
                    <% for (int i=0; i<ornumberActionBean.ORnumber.size(); i++) {     %>
                    <%     int ORnumber = ornumberActionBean.ORnumber.get(i);                    %>
                    <option value ="<%=ORnumber%>"><%=ORnumber%></option>
                    <% }                                                     %>
                </select>
            </div>
            <div>Select status 
                <select name="status" id="status">
                    <option value ="S">Scheduled</option>
                    <option value ="O">Ongoing</option>  
                    <option value ="C">Completed</option>  
                    <option value ="D">Deleted</option>
                </select>
            </div>
            <input type="submit" value="registerAssetActivity" name="registerAssetActivity">
        </form>
    </body>
</html>
