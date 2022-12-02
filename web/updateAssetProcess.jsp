<%-- 
    Document   : updateAssetProcess
    Created on : 11 29, 22, 11:55:20 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*, hoa.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Asset</title>
    </head>
    <body>
        <jsp:useBean id="assetActionBean" class="hoa.assetAction" scope="session" />
        <jsp:useBean id="assetBean" class="hoa.assets" scope="session" />
        <%
            int assetID;
            String s_assetID = request.getParameter("assetID");
            String activity_date = request.getParameter("activity_date");
            assetID = Integer.parseInt(s_assetID);
            assetActionBean.getAssetName(assetID);
            
            assetBean.assetID = assetID;
            assetBean.viewAsset();
            
        %>
        <form name="update_asset" action="updateAssetSave.jsp" method="POST">
            <label for="aname:">Asset Name</label>
            <select id ="aname" name="aname" readonly >
                <option value="<%=assetID%>"> <%=assetActionBean.name%> </option>
            </select><br><br>
            
            <select id="arent" name="arent">
                <option value="For Rent" <%if(assetBean.for_rent == true) { %> selected="selected" <%}%>>For Rent</option>
                <option value="Not For Rent" <%if(assetBean.for_rent == false) { %> selected="selected" <%}%> >Not For Rent</option>
            </select><br><br>
           
            <label for="avalue">Asset Value</label>
            <input type="text" id ="avalue" name="avalue" value="<%=assetBean.asset_value%>"><br><br>
            
            <label for="astatus">Status</label>
            <select id="astatus" name="astatus">
                <option value="W" <%if(assetBean.asset_status.name() == "W") { %> selected="selected" <%}%> >Working condition</option>
                <option value="D" <%if(assetBean.asset_status.name() == "D") { %> selected="selected" <%}%>>Deteriorated</option>
                <option value="F" <%if(assetBean.asset_status.name() == "F") { %> selected="selected" <%}%>>For Repair</option>
                <option value="I" <%if(assetBean.asset_status.name() == "I") { %> selected="selected" <%}%>>For Disposal</option>
            </select><br><br>
            
            <label for="location">Location X</label>
            <input type="text" id="locationX" name="locationX" value="<%=assetBean.asset_locX%>"><br><br>
            
            <label for="location">Location Y</label>
            <input type="text" id="locationY" name="locationY" value="<%=assetBean.asset_locY%>"><br><br>
            
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
