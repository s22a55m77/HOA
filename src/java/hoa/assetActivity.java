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
    public char status;
    public int authorizing_president;
    
    
    // constructor
    public assetActivity(){
        // TODO 
        // insert all variable
    }
    
    public int addAssetActivity() {
        // TODO
        // code below are not yet completed
        try {
            Connection con;
            // <> contain databse name
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/<>?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // wait for database to be released to know the variables
            PreparedStatement pstmt = con.prepareStatement("INSERT INTO asset_activities (<variable>) VALUES (?)");

            // first param = place of questionmark
            // second param = value
            pstmt.setInt(1, 3);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
            return 1;
        } catch (SQLException e) {
            System.out.println("error on asset, addAsset" + e.getMessage());
            return 0;
        }
        
    }
    
    public int modAssetActivity() {
        // TODO
        // modify asset
        // code below are not yet completed
        try {
            Connection con;
            // <> contain databse name
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/<>?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // wait for database to be released to know the variables
            PreparedStatement pstmt = con.prepareStatement("UPDATE asset_activities SET variable=?, variable=? WHERE assetID=? AND activity_date=?");

            // first param = place of questionmark
            // second param = value
            pstmt.setInt(1, 3);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
            return 1;
        } catch (SQLException e) {
            System.out.println("error on asset, addAsset" + e.getMessage());
            return 0;
        }
    }
    
    public int deleteAssetActivity() {
        // TODO
        // delete asset
        try {
            Connection con;
            // <> contain databse name
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/<>?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = con.prepareStatement("DELETE FROM asset_activities WHERE assetID=? AND activity_date=?");

            // first param = place of questionmark
            // second param = value
            pstmt.setInt(1, 3);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
            return 1;
        } catch (SQLException e) {
            System.out.println("error on asset, addAsset" + e.getMessage());
            return 0;
        }
    }
    
    public int viewAssetActivity() {
        // TODO
        // view record
        try {
            Connection con;
            // <> contain databse name
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/<>?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = con.prepareStatement("SELECT variable FROM asset_activities WHERE assetID=? AND activity_date=?");

            // first param = place of questionmark
            // second param = value
            pstmt.setInt(1, 3);
            
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                variable = rs.getString("variable name");
                variable = rs.getInt("variable name");
            }
            
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
            return 1;
        } catch (SQLException e) {
            System.out.println("error on asset, addAsset" + e.getMessage());
            return 0;
        }
    }
}
