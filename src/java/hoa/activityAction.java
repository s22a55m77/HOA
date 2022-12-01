/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoa;
import java.sql.*;
import java.util.*;

/**
 *
 * @author ccslearner
 */
public class activityAction {
    public ArrayList<Integer> officers = new ArrayList<>();
    
    public int getOfficer() {
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/HAMS?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");
            PreparedStatement   sqlstatement = conn.prepareStatement("SELECT officerID FROM officer");
            ResultSet rs = sqlstatement.executeQuery();
            officers.clear();
            while (rs.next()) {
                officers.add(rs.getInt("officerID"));
            }
            sqlstatement.close();
            conn.close();
            return 1;    
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    };
    
    //TODO
    public int record(
            int assetID, 
            String activity_description,
            int authorizing_president, 
            int authorizingOfficer, 
            double cost, 
            int ORnumber, 
            String activity_date, 
            String tentative_sdate,
            String tentative_edate,
            String actual_sdate,
            String actual_edate,
            String status
    ) {
        assetActivity assetActivity = new assetActivity();
        assetActivity.assetID = assetID;
        assetActivity.activity_description = activity_description;
        assetActivity.authorizing_president = authorizing_president;
        assetActivity.authorizingOfficer = authorizingOfficer;
        assetActivity.cost = cost;
        assetActivity.ORnumber = ORnumber;
        assetActivity.activity_date = activity_date;
        assetActivity.tentative_sdate = tentative_sdate;
        assetActivity.tentative_edate = tentative_edate;
        assetActivity.actual_sdate = actual_sdate;
        assetActivity.actual_edate = actual_edate;
        assetActivity.status = assetActivity.getStatus(status);
        assetActivity.addAssetActivity();
        return 1;
    }
    
    public int update() {
        return 1;
    }
    
    public int complete() {
        return 1;
    }
    
    public int delete() {
        return 1;
    }
}
