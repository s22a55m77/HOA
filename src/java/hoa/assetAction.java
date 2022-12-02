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
    //TODO
    public int register() {
        return 1;
    }
    
    public int update() {
        return 1;
    }
    
    public int delete() {
        return 1;
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
}
