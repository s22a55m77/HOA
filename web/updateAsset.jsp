<%-- 
    Document   : updateAsset
    Created on : 11 25, 22, 2:59:04 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Asset</title>
    </head>
    <body>
        <jsp:useBean id="assetActionBean" class="hoa.assetAction" scope="session" />
        <% assetActionBean.getAssetNames(); %>
        <form name="update_asset_select" action="updateAssetProcess.jsp" method="POST">
            <div>
                Select Asset that you want to update
                <select name="assetID" id="assetID">
                    <% for (int i=0; i<assetActionBean.assetID.size(); i++) {     %>
                    <%     int assetID = assetActionBean.assetID.get(i);                    %>
                    <option value ="<%=assetID%>"><%=assetActionBean.names.get(i)%></option>
                    <% }                                                     %>
                </select>
            </div>
            <input type="submit" value="Select Asset" name="updateAssetSelect">
        </form>
    </body>
</html>
