<%-- 
    Document   : deleteAsset
    Created on : 11 25, 22, 2:59:37 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Asset</title>
    </head>
    <body>
        <jsp:useBean id="assetActionBean" class="hoa.assetAction" scope="session" />
        <%assetActionBean.getAssetNamesForDelete(); %>
        <form name="deleteAssetProcess" action="deleteAssetProcess.jsp" method="POST">
            <div>
                Select Asset to delete
                <select name="assetID" id="assetID">
                    <% for (int i=0; i<assetActionBean.assetID.size(); i++) {     %>
                    <%     int assetID = assetActionBean.assetID.get(i);                    %>
                    <option value ="<%=assetID%>"><%=assetActionBean.names.get(i)%></option>
                    <% }                                                     %>
                </select>
            </div>
            <input type="submit" value="Select" name="deleteAssetProcess">
        </form>
    </body>
</html>
