<%-- 
    Document   : updateAssetSave
    Created on : 11 25, 22, 2:59:17 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Asset Save</title>
    </head>
    <body>
        <jsp:useBean id="assetActionBean" class="hoa.assetAction" scope="session" />
        <%                               
            String s_assetID = request.getParameter("aname");               
            String s_rent = request.getParameter("arent");
            String s_value = request.getParameter("avalue");
            String status = request.getParameter("astatus");                     
            String s_locX = request.getParameter("locationX");   
            String s_locY = request.getParameter("locationY");   
            String s_containing_asset = request.getParameter("containing_asset"); 
            int containing_asset;
            
            int assetID = Integer.parseInt(s_assetID);         
            double value = Double.parseDouble(s_value);
            double locX = Double.parseDouble(s_locX);
            double locY = Double.parseDouble(s_locY);
            boolean rent = false;
            if (s_rent == "For rent")
                rent = true;
            if (s_containing_asset == "")
                containing_asset = 9999999;
            else
                containing_asset = Integer.parseInt(s_containing_asset);
            
        
            assetActionBean.update(rent, value, status, locX, locY, assetID, containing_asset);%>
        Asset was updated<br>
        <a href="index.html">Go back to Main Menu</a>
    </body>
</html>
