<%-- 
    Document   : deleteAssetActivityProcess2
    Created on : 12 1, 22, 6:40:29 PM
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
        <jsp:useBean id="assetActivityBean" class="hoa.assetActivity" scope="session" />
        <%
            int assetID;
            String s_assetID = request.getParameter("assetID");
            String activity_date = request.getParameter("activity_date");
            assetID = Integer.parseInt(s_assetID);
            assetActionBean.getAssetName(assetID);
            
            assetActivityBean.assetID = assetID;
            assetActivityBean.activity_date = activity_date;
            assetActivityBean.viewAssetActivity();
        %>
        <form name="delete_asset_activity_select" action="deleteAssetActivitySave.jsp" method="POST">
        
            <div>
                Select Asset 
                <select name="assetID" id="assetID" readonly>           
                    <option value ="<%=assetID%>"><%=assetActionBean.name%></option>
                </select>
            </div>
                
            <div>
                Select Date
                <select name="activity_date" id="activity_date" readonly>
                    <option value ="<%=activity_date%>"><%=activity_date%></option>
                </select>
            </div>
                
            <div>Change Status to Deleted
                <select name="status" id="status" readonly>
                    <option value ="D" <% if(assetActivityBean.status.name() == "D") {%> selected="selected" <%} %>>Deleted</option>
                </select>
            </div>
                
            <input type="submit" value="Confirm" name="deleteAssetActivity">
        </form>
    </body>
</html>
