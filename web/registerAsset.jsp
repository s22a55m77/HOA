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
    
        <!--TODO/-->
        <!--Provide input box for entering of variables/-->
        <jsp:useBean id="assetActionbean" class="hoa.assetAction" scope="session" />        
        <% assetActionbean.getAssetIDs(); %>
        
        <form>
        Asset type : <input type="text" name="asset_type" id="asset_type"><br><br>
        Asset Description : <textarea  id="for_rent" name="asset_desc" row="10" col="20"></textarea><br>
        Aquistion Date: <input type="date" name="aquistion_date" id="aquisition_date"><br><br>
        Renting Availability: <select id="for_rent" name="for_rent">
            <option value="for_rent">For Rent</option>
            <option value="Not for_rent">Not For Rent</option>
        </select><br><br>
        Asset Value: <input type="number" id ="asset_value" name="asset_value"><br><br>
        Asset Type:<select id="asset_type" name="asset_type">
                <option value="Property" selected>Property</option>
                <option value="Equipment">Equipment</option>
                <option value="Furniture and Fixtures">Furniture and Fixtures</option>
                <option value="Others">Others</option>
            </select><br><br>
        Asset Status:<select id="asset_status" name="asset_status">
                <option value="Working condition" selected>Working condition</option>
                <option value="Deteriorated">Deteriorated</option>
                <option value="For Repair">For Repair</option>
                <option value="For Disposal">For Disposal</option>
                <option value="Disposed">Disposed</option>
            </select><br><br>
        Asset Location: <input type="number" id="asset_locX" name="asset_locX">
        <input type="number" id="asset_locY" name="asset_locY"><br><br>
        Submit<input type="submit" value="registerAsset" name="registerAsset">
       
        </form>
    

