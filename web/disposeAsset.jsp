<%-- 
    Document   : disposeAsset
    Created on : 11 25, 22, 3:00:05 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dispose Asset</title>
    </head>
    <body>
        <jsp:useBean id="assetActionBean" class="hoa.assetAction" scope="session" />
        <%assetActionBean.getAssetNamesForDispose(); %>
        <form name="disposeAssetProcess" action="disposeAssetProcess.jsp" method="POST">
            <div>
                Select Asset to dispose
                <select name="assetID" id="assetID">
                    <% for (int i=0; i<assetActionBean.assetID.size(); i++) {     %>
                    <%     int assetID = assetActionBean.assetID.get(i);                    %>
                    <option value ="<%=assetID%>"><%=assetActionBean.names.get(i)%></option>
                    <% }                                                     %>
                </select>
            </div>
            <input type="submit" value="Select" name="disposeAssetProcess">
        </form>
    </body>
</html>
