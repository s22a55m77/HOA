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
        
        <% int assetID = 0;               %>
        <% String s_assetID = request.getParameter("assetID");                  %>
        <% String date = request.getParameter("activity_date");                  %>
        <% assetID = Integer.parseInt(s_assetID);                                %>
        <% assetActivityBean.getIncompleteActivitiesDates(assetID); %>
        <form name="register_asset_activity" action="completeAssetActivityProcess2.jsp" method="POST">
        
            <div>
                Asset Selected
                <select name="assetID" id="assetID">
                    <option value ="<%=assetID%>"><%=assetID%></option>
                </select>
            </div>
            
            <div>
                Select Date 
                <select name="activity_date" id="activity_date">
                    <% for (int i=0; i<assetActivityBean.dates.size(); i++) {     %>
                    <%     String activity_date = assetActivityBean.dates.get(i);                    %>
                    <option value ="<%=activity_date%>"><%=activity_date%></option>
                    <% }                                                       %>
                </select>
            </div>
                

            <input type="submit" value="Next" name="completeAssetActivitySave">
        </form>
    </body>
</html>
