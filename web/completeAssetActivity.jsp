<%-- 
    Document   : completeAssetActivity
    Created on : 11 25, 22, 2:32:37 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complete Asset Activity</title>
    </head>
    <body>
        <jsp:useBean id="assetActivityBean" class="hoa.activityAction" scope="session" />
        <%                                           
           assetActivityBean.getIncompleteActivitiesAssetIDs();
        %>
        <form name="complete_asset_activity" action="completeAssetActivityProcess.jsp" method="POST">
        
            <div>
                Select Asset 
                <select name="assetID" id="assetID">
                    <% for (int i=0; i<assetActivityBean.assetID.size(); i++) {     %>
                    <%     int assetID = assetActivityBean.assetID.get(i);                    %>
                    <option value ="<%=assetID%>"><%=assetActivityBean.names.get(i)%></option>
                    <% }                                                       %>
                </select>
            </div>
                
            <input type="submit" value="Next" name="completeAssetActivityProcess">
        </form>
    </body>
</html>
