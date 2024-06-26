/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoa;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ccslearner
 */
public class assetActivity {
    
    
    //ENUM of status
    public enum Status{
        S,
        O,
        C,
        D
    }
    
    public int assetID;
    public String activity_date;
    public String activity_description;
    public int authorizingOfficer;
    public String tentative_sdate;
    public String tentative_edate;
    public String actual_sdate;
    public String actual_edate;
    public double cost;
    public int ORnumber;
    public Status status;
    public int authorizing_president;
    
    
    // constructor
    public assetActivity(){
        
    }
    
    //getter of enum
    public Status getStatus(String string){
        switch(string){
            case "S":
                return Status.S;
            case "O":
                return Status.O;
            case "C":
                return Status.C;
            case "D":
                return Status.D;
            default:
                return null;
        }
    }
    
    public int addAssetActivity() {
        try {
            Connection con;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HAMS?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = con.prepareStatement("INSERT INTO asset_activities (assetID, activity_date, activity_description, authorizingOfficer, "
                    + "tentative_sdate, tentative_edate, actual_sdate, actual_edate, cost, ORnumber, status, authorizing_president) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

            // first param = place of questionmark
            // second param = value
            pstmt.setInt(1, assetID);
            pstmt.setString(2, activity_date);
            pstmt.setString(3, activity_description);
            pstmt.setInt(4, authorizingOfficer);
            pstmt.setString(5, tentative_sdate);
            pstmt.setString(6, tentative_edate);
            if (actual_sdate == "") pstmt.setNull(7, java.sql.Types.VARCHAR);
            else pstmt.setString(7, actual_sdate);
            if (actual_edate == "") pstmt.setNull(8, java.sql.Types.VARCHAR);
            else pstmt.setString(8, actual_edate);
            pstmt.setDouble(9, cost);
            pstmt.setInt(10, ORnumber);
            pstmt.setString(11, status.name());
            pstmt.setInt(12, authorizing_president);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
            return 1;
        } catch (SQLException e) {
            System.out.println("error on assetActivity, addAssetActivity" + e.getMessage());
            return 0;
        }
        
    }
    
    public int modAssetActivity() {
        // modify asset_activities
        try {
            Connection con;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HAMS?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = con.prepareStatement("UPDATE asset_activities SET status=?"
                    + "WHERE assetID=? AND activity_date=?");

            // first param = place of questionmark
            // second param = value
            pstmt.setString(1, status.name());
            pstmt.setInt(2, assetID);
            pstmt.setString(3, activity_date);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
            return 1;
        } catch (SQLException e) {
            System.out.println("error on assetActivity, modAssetActivity" + e.getMessage());
            return 0;
        }
    }
    
    public int deleteAssetActivity() {
        // delete asset_activities
        try {
            Connection con;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HAMS?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = con.prepareStatement("DELETE FROM asset_activities WHERE assetID=? AND activity_date=?");

            // first param = place of questionmark
            // second param = value
            pstmt.setInt(1, assetID);
            pstmt.setString(2, activity_date);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
            return 1;
        } catch (SQLException e) {
            System.out.println("error on assetActivity, deleteAssetActivity" + e.getMessage());
            return 0;
        }
    }
    
    public int viewAssetActivity() {
        // view record
        try {
            Connection con;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HAMS?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = con.prepareStatement("SELECT assetID, activity_date, activity_description, assetID, tentative_sdate, tentative_edate, "
                    + "actual_sdate, actual_edate, cost, ORnumber, `status`, authorizing_president "
                    + "FROM asset_activities WHERE assetID = ? AND activity_date=?");

            // first param = place of questionmark
            // second param = value
            pstmt.setInt(1, assetID);
            pstmt.setString(2, activity_date);
            
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                assetID = rs.getInt("assetID");
                activity_date = rs.getString("activity_date");
                activity_description = rs.getString("activity_description");
                authorizingOfficer = rs.getInt("assetID");;
                tentative_sdate = rs.getString("tentative_sdate");
                tentative_edate = rs.getString("tentative_edate");
                actual_sdate = rs.getString("actual_sdate");
                actual_edate = rs.getString("actual_edate");
                cost = rs.getDouble("cost");
                ORnumber = rs.getInt("ORnumber");
                status = getStatus(rs.getString("status"));
                authorizing_president = rs.getInt("authorizing_president");
            }
            
            rs.close();
            pstmt.close();
            con.close();
            return 1;
        } catch (SQLException e) {
            System.out.println("error on asset activity, viewAssetActivity" + e.getMessage());
            return 0;
        }
    }
    
}
