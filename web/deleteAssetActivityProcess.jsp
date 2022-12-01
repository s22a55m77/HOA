<%-- 
    Document   : deleteAssetActivityProcess
    Created on : 12 1, 22, 6:39:29 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*, hoa.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Asset Activity</title>
    </head>
    <body>
        <jsp:useBean id="assetActionBean" class="hoa.assetAction" scope="session" />
        <jsp:useBean id="activityActionBean" class="hoa.activityAction" scope="session" />
        <%
            int assetID;
            String s_assetID = request.getParameter("assetID");
            assetID = Integer.parseInt(s_assetID);
            assetActionBean.getAssetName(assetID);
            activityActionBean.getDates(assetID);
        %>
        <form name="delete_asset_activity_select" action="deleteAssetActivityProcess2.jsp" method="POST">
        
            <div>
                Select Asset 
                <select name="assetID" id="assetID">           
                    <option value ="<%=assetID%>"><%=assetActionBean.name%></option>
                </select>
            </div>
                
            <div>
                Select Date
                <select name="activity_date" id="activity_date">
                    <% for (int i=0; i<activityActionBean.dates.size(); i++) {     %>
                    <%     String activity_date = activityActionBean.dates.get(i);                    %>
                    <option value ="<%=activity_date%>"><%=activityActionBean.dates.get(i)%></option>
                    <% }                                                     %>
                </select>
            </div>
                
            <input type="submit" value="Select" name="deleteAssetActivity">
        </form>
    </body>
</html>
