<%-- 
    Document   : registerAssetSave
    Created on : 11 18, 22, 2:04:09 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="hoa.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Save Register</title>
    </head>
    <body>
        <jsp:useBean id="assetActionBean" class="hoa.assetAction" scope="session" />
        <% String asset_type = request.getParameter("asset_type");                %>
        <% String asset_desc = request.getParameter("asset_desc");               %>
        <% String aquisition_date = request.getParameter("aquisition_date");           %>
        <% String s_for_rent = request.getParameter("for_rent");                    %>
        <% String s_asset_value = request.getParameter("asset_value");                %>
        <% String asset_status = request.getParameter("asset_status"); %>
        <% String s_asset_locX = request.getParameter("asset_locX"); %>
        <% String s_asset_locY = request.getParameter("asset_locY"); 
           String hoaname = request.getParameter("hoaname"); 
           String asset_name = request.getParameter("asset_name"); 
           String s_containing_asset = request.getParameter("containing_asset"); 
           int containing_asset;
            boolean for_rent = false;
            if (s_for_rent == "for_rent")
                for_rent = true;
            
            double asset_value = Double.parseDouble(s_asset_value);
            double locX = Double.parseDouble(s_asset_locX);
            double locY = Double.parseDouble(s_asset_locY);
            if (s_containing_asset == "")
                containing_asset = 9999999;
            else
                containing_asset = Integer.parseInt(s_containing_asset);
            

        %>    
        
        <% assetActionBean.register(for_rent, asset_value, asset_status, aquisition_date, asset_desc, asset_type, locX, locY, hoaname, asset_name, containing_asset);               %>             
        Asset was registered<br>
        <a href="index.html">Go back to Main Menu</a>
    </body>
</html>
