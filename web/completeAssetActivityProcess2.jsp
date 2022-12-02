<%-- 
    Document   : completeAssetActivity
    Created on : 11 25, 22, 2:32:37 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complete Asset Activity</title>
    </head>
    <body>
        <jsp:useBean id="assetActivityBean" class="hoa.activityAction" scope="session" />
        <% int assetID = 0;               %>
        <% String s_assetID = request.getParameter("assetID");                  %>
        <% String date = request.getParameter("activity_date");                  %>
        <% assetID = Integer.parseInt(s_assetID);                                %>
        <% assetActivityBean.getActivity(assetID, date); %>
        <form name="complete_asset_activity" action="completeAssetActivitySave.jsp" method="POST">
        
            <div>
                Asset Selected
                <select name="assetID" id="assetID">
                    <option value ="<%=assetID%>"><%=assetID%></option>
                </select>
            </div>
                
            <div>
                Date Selected
                <select name="activity_date" id="activity_date">
                    <option value ="<%=date%>"><%=date%></option>
                </select>
            </div>
                
            <div>Current actual start Date: <%=assetActivityBean.actual_sdate%> <input type="date" name="actual_sdate" id="actual_sdate"><br></div>
            <div>Current actual end date: <%=assetActivityBean.actual_edate%> <input type="date" name="actual_edate" id="actual_edate"><br></div>

            <input type="submit" value="Submit" name="completeAssetActivitySave">
        </form>
    </body>
</html>
