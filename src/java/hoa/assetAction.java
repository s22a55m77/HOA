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
public class assetAction {
    public ArrayList<Integer> assetID = new ArrayList<>();
    public ArrayList<String> names = new ArrayList<>();
    public String name;
    public assets asset = new assets();
    public int newAssetID;
    
    public int getAsset(int ID) {
        assets asset2 = new assets();
        asset2.assetID = ID;
        asset2.viewAsset();
        asset = asset2;
        return 1;
    }
    
    public int getAssetIDs() {
        assetID.clear();
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/HAMS?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");
            PreparedStatement   sqlstatement = conn.prepareStatement("SELECT assetID FROM assets ORDER BY assetID ASC;");
            ResultSet rs = sqlstatement.executeQuery();
            assetID.clear();
            while (rs.next()) {
                assetID.add(rs.getInt("assetID"));
            }
            sqlstatement.close();
            conn.close();
            return 1;    
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
        
    }
    
    public int getAssetNames() {
         try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/HAMS?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");
            PreparedStatement   sqlstatement = conn.prepareStatement("SELECT a.assetID, a.asset_name\n" +
                                                                    "FROM assets a\n" +
                                                                    "ORDER BY a.asset_name, a.assetID;");
            ResultSet rs = sqlstatement.executeQuery();
            assetID.clear();
            names.clear();
            while (rs.next()) {
                assetID.add(rs.getInt("a.assetID"));
                names.add(rs.getString("a.asset_name"));
            }
            sqlstatement.close();
            conn.close();
            return 1;    
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int getAssetNamesForDelete() {
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/HAMS?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");
            PreparedStatement   sqlstatement = conn.prepareStatement("SELECT assetID, asset_name\n" +
                                                                    "FROM assets\n" +
                                                                    "WHERE assetID NOT IN (SELECT assetID \n" +
                                                                    "                      FROM asset_activities)\n" +
                                                                    "AND assetID NOT IN (SELECT assetID \n" +
                                                                    "		         FROM asset_rentals)\n" +
                                                                    "ORDER BY asset_name, assetID;");
            ResultSet rs = sqlstatement.executeQuery();
            assetID.clear();
            names.clear();
            while (rs.next()) {
                assetID.add(rs.getInt("assetID"));
                names.add(rs.getString("asset_name"));
            }
            sqlstatement.close();
            conn.close();
            return 1;    
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int getAssetNamesForDispose() {
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/HAMS?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");
            PreparedStatement   sqlstatement = conn.prepareStatement("SELECT a.assetID, a.asset_name\n" +
                                                                    "FROM assets a\n" +
                                                                    "WHERE a.asset_status='F'\n" +
                                                                    "ORDER BY a.asset_name, a.assetID;");
            ResultSet rs = sqlstatement.executeQuery();
            assetID.clear();
            names.clear();
            while (rs.next()) {
                assetID.add(rs.getInt("a.assetID"));
                names.add(rs.getString("a.asset_name"));
            }
            sqlstatement.close();
            conn.close();
            return 1;    
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int getAssetName(int id) {
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/HAMS?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");
            PreparedStatement   sqlstatement = conn.prepareStatement("SELECT a.asset_name\n" +
                                                                    "FROM assets a\n"
                                                                    +"WHERE a.assetID = ?");
            sqlstatement.setInt(1, id);
            ResultSet rs = sqlstatement.executeQuery();
            while (rs.next()) {
                name = rs.getString("a.asset_name");
            }
            sqlstatement.close();
            conn.close();
            return 1;    
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int register(boolean for_rent, double asset_value, String asset_status, String date, String desc, String type,
                        double asset_locX, double asset_locY, String hoaname, String name, int contain) {
        assets a = new assets();
        a.assetID = newAssetID;
        a.for_rent = for_rent;
        a.aquisition_date = date;
        a.asset_desc = desc;
        a.asset_type = a.getType(type);
        a.asset_value = asset_value;
        a.asset_status = a.getStatus(asset_status);
        a.asset_locX = asset_locX;
        a.asset_locY = asset_locY;
        a.hoa_owner = hoaname;
        a.asset_name = name;
        a.containing_asset = contain;
        
        a.addAsset();
        return 1;
}
    public int update(boolean for_rent, double asset_value, String asset_status, double asset_locX, double asset_locY, int ID) {
        assets a = new assets();
        a.assetID = ID;
        a.for_rent = for_rent;
        a.asset_value = asset_value;
        a.asset_status = a.getStatus(asset_status);
        a.asset_locX = asset_locX;
        a.asset_locY = asset_locY;
        
        a.modAsset();
        
        return 1;
    }
    
    public int delete(int assetID) {
        try {
            Connection con;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HAMS?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = con.prepareStatement("SET FOREIGN_KEY_CHECKS=0;");
            pstmt.executeUpdate();
            pstmt = con.prepareStatement("DELETE FROM assets WHERE assetID = ?");

            // first param = place of questionmark
            // second param = value
            pstmt.setInt(1, assetID);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
            return 1;
        } catch (SQLException e) {
            System.out.println("error on assetAction, delete" + e.getMessage());
            return 0;
        }

    }
    
    public int dispose(int assetID) {
        try {
            Connection con;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HAMS?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = con.prepareStatement("UPDATE assets SET asset_status=?"
                    + "WHERE assetID=?");

            // first param = place of questionmark
            // second param = value
            pstmt.setString(1, "D");
            pstmt.setInt(2, assetID);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
            return 1;
        } catch (SQLException e) {
            System.out.println("error on assetAction, dispose" + e.getMessage());
            return 0;
        }
    }
   
    public int getNewAssetID() {
        try {
            Connection con;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HAMS?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = con.prepareStatement("SELECT MAX(assetID) as newNum FROM assets");

            // first param = place of questionmark
            // second param = value
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                newAssetID = rs.getInt("newNum") + 1;
            }
            pstmt.close();
            con.close();
            return 1;
        } catch (SQLException e) {
            System.out.println("error on assetAction, getNewAssetID" + e.getMessage());
            return 0;
        }
    }
}
