<%-- 
    Document   : registerAsset
    Created on : 11 18, 22, 1:39:10 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Asset Register</title>
    </head>
    
    <body>
        <!--TODO/-->
        <!--Provide input box for entering of variables/-->
        <jsp:useBean id="assetActionbean" class="hoa.assetAction" scope="session" />   
        <jsp:useBean id="hoaActionBean" class="hoa.hoaAction" scope="session" />    
        <jsp:useBean id="assetActionBean" class="hoa.assetAction" scope="session" />
        <% assetActionBean.getAssetNames(); %>
        <% assetActionbean.getAssetIDs(); 
           hoaActionBean.getNames();
        %>
        
        <form name="register_asset" action="registerAssetSave.jsp">
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
        Asset Location: <input type="number" id="asset_locX" name="asset_locX" step=".00001">
        <input type="number" id="asset_locY" name="asset_locY" step=".00001"><br><br>
        
        Containing Asset:
        <select name="containing_asset" id="containing_asset">
            <option value ="">None</option>
            <% for (int i=0; i<assetActionBean.assetID.size(); i++) {     %>
            <%     int assetID = assetActionBean.assetID.get(i);                    %>
            <option value ="<%=assetID%>"><%=assetActionBean.names.get(i)%></option>
            <% }                                                     %>
        </select>
        <br>
        Submit<input type="submit" value="registerAsset" name="registerAsset">
       
        </form>
    </body>

