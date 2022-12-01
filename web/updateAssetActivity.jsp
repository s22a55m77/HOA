<%-- 
    Document   : updateAssetAcitivity
    Created on : 11 25, 22, 3:00:43 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Asset Activity</title>
    </head>
    <body>
        <jsp:useBean id="activityBean" class="hoa.activityAction" scope="session" />
        <%activityBean.getActivities(); %>
        <form name="update_activity_select" action="updateAssetActivityProcess.jsp" method="POST">
            <div>
                Select Asset
                <select name="assetID" id="assetID">
                    <% for (int i=0; i<activityBean.IDs.size(); i++) {     %>
                    <%     int assetID = activityBean.IDs.get(i);                    %>
                    <option value ="<%=assetID%>"><%=activityBean.names.get(i)%></option>
                    <% }                                                     %>
                </select>
            </div>
            <input type="submit" value="Select" name="update_activity_select">
        </form>
    </body>
</html>
