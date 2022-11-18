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
    // TODO
    // viriables
    
    
    // constructor
    public assets(){
        // TODO 
        // initialize the variable
    }
    
    public int addAsset() {
        // TODO
        // code below are not yet completed
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
        // modify asset
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
        // delete asset
        try {
            Connection con;
            // <> contain databse name
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/<>?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = con.prepareStatement("DELETE FROM WHERE assetID=?");

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
    
    public int viewAsset() {
        // TODO
        // view record
        try {
            Connection con;
            // <> contain databse name
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/<>?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = con.prepareStatement("SELECT variable FROM WHERE assetID=?");

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
    
    
    
}
