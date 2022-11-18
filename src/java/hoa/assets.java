/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoa;
import java.sql.*;
/**
 *
 * @author ccslearner
 */
public class assets {
    // viriables
    public int assetID;
    public String hoa_owner;
    public char asset_type;
    public String asset_desc;
    public String asset_name;
    public String aquisition_date;
    public boolean for_rent;
    public double asset_value;
    public char asset_status;
    public double asset_locX;
    public double asset_locY;
    public int containing_asset;
    
    // constructor
    public assets(){
        
    }
    
    public int addAsset() {
        // TODO
        // insert all variable to the table
        try {
            Connection con;
            // <> contain databse name
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/<>?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // wait for database to be released to know the variables
            PreparedStatement pstmt = con.prepareStatement("INSERT INTO assets (<variable>) VALUES (?)");

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
    
    public int modAsset() {
        // TODO
        // update the table based on the varaible
        // code below are not yet completed
        try {
            Connection con;
            // <> contain databse name
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/<>?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // wait for database to be released to know the variables
            PreparedStatement pstmt = con.prepareStatement("UPDATE assets SET variable=?, variable=? WHERE assetID=?");

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
    
    public int deleteAsset() {
        // TODO
        // database name
        // delete asset
        try {
            Connection con;
            // <> contain databse name
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/<>?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = con.prepareStatement("DELETE FROM assets WHERE assetID=?");

            // first param = place of questionmark
            // second param = value
            pstmt.setInt(1, assetID);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
            return 1;
        } catch (SQLException e) {
            System.out.println("error on asset, addAsset" + e.getMessage());
            return 0;
        }
    }
    
    public int viewAsset() {
        // TODO
        // complete thewhile part code
        // view record
        try {
            Connection con;
            // <> contain databse name
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/<>?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = con.prepareStatement("SELECT variable FROM assets WHERE assetID=?");

            // first param = place of questionmark
            // second param = value
            pstmt.setInt(1, assetID);
            
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                assetID = rs.getInt("assetID");
                hoa_owner = rs.getString("hoa_owner");
                asset_type = 
                asset_desc;
                asset_name;
                aquisition_date;
                for_rent;
                asset_value;
                asset_status;
                asset_locX;
                asset_locY;
                containing_asset;

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
