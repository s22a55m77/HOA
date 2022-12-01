<%-- 
    Document   : registerAsset
    Created on : 11 18, 22, 1:39:10 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Asset Register</title>
    </head>
    <body>
        <!--TODO/-->
        <!--Provide input box for entering of variables/-->
        <form name="register" action="registerAssetSave.jsp" method="POST">
            <label for="aname:">Asset Name</label>
            <input type="text" id ="aname" name="aname"><br><br>
            <label for="adesc:">Asset Description</label><br>
            <textarea description="adesc" rows="10" cols="30">
            </textarea><br>
            <label for="aDate:">Acquisition Date</label>
            <input type="date" id ="aDate" name="aDate"><br><br>
            <label for="arent:">Renting availability</label>
            <select id="arent" name="arent">
                <option value="For Rent">For Rent</option>
                <option value="Not For Rent">Not For Rent</option>
            </select><br><br>
            <label for="avalue">Asset Value</label>
            <input type="text" id ="avalue" name="avalue"><br><br>
            <label for="atype">Asset Type</label>
            <select id="atype" name="atype">
                <option value="Property" selected>Property</option>
                <option value="Equipment">Equipment</option>
                <option value="Furniture and Fixtures">Furniture and Fixtures</option>
                <option value="Others">Others</option>
            </select><br><br>
            <label for="astatus">Status</label>
            <select id="astatus" name="astatus">
                <option value="Working condition" selected>Working condition</option>
                <option value="Deteriorated">Deteriorated</option>
                <option value="For Repair">For Repair</option>
                <option value="For Disposal">For Disposal</option>
                <option value="Disposed">Disposed</option>
            </select><br><br>
        </form>
    </body>
</html>
