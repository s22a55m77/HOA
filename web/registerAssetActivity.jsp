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
        <% assetActivityBean.getOfficer();                                                 %>
        <form name="register_asset_activity" action="registerAssetActivitySave.jsp" method="POST">
        
            
            <div>Enter activity date <input type="text" name="activity_date" id="activity_date"><br></div>

            <div>
                Select Officer authorizing officer
                <select name="authorizingOfficer" id="products">
                    <% for (int i=0; i<assetActivityBean.officers.size(); i++) {     %>
                    <%     int officerID = assetActivityBean.officers.get(i);                    %>
                    <option value ="<%=officerID%>"><%=officerID%></option>
                    <% }                                                     %>
                </select>
            </div>

            <div>
                Select Officer authorizing president
                <select name="authorizing_president" id="products">
                    <% for (int i=0; i<assetActivityBean.officers.size(); i++) {     %>
                    <%     int officerID = assetActivityBean.officers.get(i);                    %>
                    <option value ="<%=officerID%>"><%=officerID%></option>
                    <% }                                                     %>
                </select>
            </div>
            <input type="submit" value="registerAssetActivity" name="registerAssetActivity">
        </form>
    </body>
</html>
