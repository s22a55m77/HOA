<%-- 
    Document   : deleteDonorProcess
    Created on : 11 29, 22, 12:39:21 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*, hoa.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Donation Specification</title>
    </head>
    <body>
        <jsp:useBean id="donationActionBean" class="hoa.donationAction" scope="session" />
        <jsp:useBean id="officerActionBean" class="hoa.officerAction" scope="session" />
        <% int assetID = 0;               %>
        <% String s_assetID = request.getParameter("assetID");                  %>
        <% assetID = Integer.parseInt(s_assetID);                                %>
        <% donation donation = donationActionBean.getDonation(assetID);                       %>
        <form action="deleteDonorSave.jsp" method="POST">
            <div>
                asset ID Selected:
                <select name="assetID" id="assetID">
                    <option value ="<%=donation.assetID%>"><%=donation.assetID%></option>
                </select>
            </div>
            <div>
                donor name: <%=donation.donor_completename%><br/>
                donor address: <%=donation.donor_address%> <br/>
                amount: <%=donation.amount%><br/>
                donation date: <%=donation.donation_date%><br/>
                accepting Offer: <%=officerActionBean.getName(donation.acceptingOfficer)%> <br />
                form filename: <%=donation.donorsform_filename%><br/>
                deleted: <%=donation.deleted%><br/>
                authorizing president: <%=officerActionBean.getName(donation.authorizing_president)%> <br />
            </div>   
            <input type="submit" value="Confirm" name="deleteDonor">
        </form>
        <br /><a href="deleteDonor.jsp">back</a>
    </body>
</html>
