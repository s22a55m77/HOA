<%-- 
    Document   : deleteAssetProcess
    Created on : 12 2, 22, 11:11:12 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*, hoa.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Asset</title>
    </head>
    <body>
        <jsp:useBean id="assetActionBean" class="hoa.assetAction" scope="session" />
        <%
            int assetID;
            String s_assetID = request.getParameter("assetID");
            assetID = Integer.parseInt(s_assetID);
            assetActionBean.getAsset(assetID);
        %>
        <form name="deleteAssetSave" action="deleteAssetSave.jsp" method="POST">
        
            <div>
                Asset Selected
                <select name="assetID" id="assetID" readonly>           
                    <option value ="<%=assetID%>"><%=assetActionBean.asset.asset_name%></option>
                </select>
            </div>
                
            <div>
                hoa owner: <%=assetActionBean.asset.hoa_owner%> <br />
                description: <%=assetActionBean.asset.asset_desc%> <br />
                value: <%=assetActionBean.asset.asset_value%> <br />
                locx: <%=assetActionBean.asset.asset_locX%> <br />
                locy: <%=assetActionBean.asset.asset_locY%> <br />
            </div>
                

            <input type="submit" value="Confirm" name="disposeAssetSave">
        </form>
    </body>
</html>
