<%-- 
    Document   : updateAssetActivityProcess2
    Created on : 12 1, 22, 5:03:57 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*, hoa.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Asset Activity</title>
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
        <form name="update_asset_activity_select" action="updateAssetActivitySave.jsp" method="POST">
        
            <div>
                Select Asset 
                <select name="assetID" id="assetID">           
                    <option value ="<%=assetID%>"><%=assetActionBean.name%></option>
                </select>
            </div>
                
            <div>
                Select Date
                <select name="activity_date" id="activity_date">
                    <option value ="<%=activity_date%>"><%=activity_date%></option>
                </select>
            </div>
                
            <div>Select status 
                <select name="status" id="status">
                    <option value ="S" <% if(assetActivityBean.status.name() == "S") {%> selected="selected" <%} %>>Scheduled</option>
                    <option value ="O" <% if(assetActivityBean.status.name() == "O") {%> selected="selected" <%} %>>Ongoing</option>  
                    <option value ="C" <% if(assetActivityBean.status.name() == "C") {%> selected="selected" <%} %>>Completed</option>  
                    <option value ="D" <% if(assetActivityBean.status.name() == "D") {%> selected="selected" <%} %>>Deleted</option>
                </select>
            </div>
                
            <input type="submit" value="Select" name="updateAsseetActivity">
        </form>
    </body>
</html>
