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
    
    // ENUM of asset_type
    public enum Type {
        P,
        F,
        O,
        E
    }
    
    // ENUM of asset_status
    public enum Status {
        W,
        D,
        F,
        I,
        P
    }
    
    // viriables
    public int assetID;
    public String hoa_owner;
    public Type asset_type;
    public String asset_desc;
    public String asset_name;
    public String aquisition_date;
    public boolean for_rent;
    public double asset_value;
    public Status asset_status;
    public double asset_locX;
    public double asset_locY;
    public int containing_asset;
    
    // constructor
    public assets(){
        
    }
    
    // getter of enum
    public String getType(Type type) {
        switch(type) { 
            case P:
                return "P";
            case F: 
                return "F";
            case O:
                return "O";
            case E:
                return "E";
            default:
                return "Invalid";
        }
    }
    
    public String getStatus(Status status) {
        switch(status) { 
            case W:
                return "W";
            case D: 
                return "D";
            case F:
                return "F";
            case I:
                return "I";
            case P:
                return "P";
            default:
                return "Invalid";
        }
    }
   
    public Type getType(String string) {
        switch(string){
            case "P":
                return Type.P;
            case "F":
                return Type.F;
            case "O":
                return Type.O;
            case "E":
                return Type.E;
            default:
                return null;
        }
    }
    
    public Status getStatus(String string) {
        switch(string) {
            case "W":
                return Status.W;
            case "D":
                return Status.D;
            case "F":
                return Status.F;
            case "I":
                return Status.I;
            case "P":
                return Status.P;
            default:
                return null;
        }
    }
    
    public int addAsset() {
        // insert all variable to the table
        try {
            Connection con;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HAMS?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = con.prepareStatement("INSERT INTO assets (assetID, hoa_owner, asset_type, asset_desc, "
                    + "asset_name, aquisition_date, for_rent, asset_value, asset_status, asset_locX, asset_locY, containing_asset) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

            // first param = place of questionmark
            // second param = value
            pstmt.setInt(1, assetID);
            pstmt.setString(2, hoa_owner);
            pstmt.setString(3, getType(asset_type));
            pstmt.setString(4, asset_desc);
            pstmt.setString(5, asset_name);
            pstmt.setString(6, aquisition_date);
            pstmt.setBoolean(7, for_rent);
            pstmt.setDouble(8, asset_value);
            pstmt.setString(9, getStatus(asset_status));
            pstmt.setDouble(10, asset_locX);
            pstmt.setDouble(11, asset_locY);
            pstmt.setInt(12, containing_asset);
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
        // update the table based on the varaible
        try {
            Connection con;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HAMS?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = con.prepareStatement("UPDATE assets SET hoa_owner=?, asset_type=?, asset_desc=?, asset_name=?, aquisition_date=?, "
                    + "for_rent=?, asset_value=?, asset_status=?, asset_locX=?, asset_locY=?, containing_asset=? "
                    + "WHERE assetID=?");

            // first param = place of questionmark
            // second param = value
            pstmt.setString(1, hoa_owner);
            pstmt.setString(2, getType(asset_type));
            pstmt.setString(3, asset_desc);
            pstmt.setString(4, asset_name);
            pstmt.setString(5, aquisition_date);
            pstmt.setBoolean(6, for_rent);
            pstmt.setDouble(7, asset_value);
            pstmt.setString(8, getStatus(asset_status));
            pstmt.setDouble(9, asset_locX);
            pstmt.setDouble(10, asset_locY);
            pstmt.setInt(11, containing_asset);
            pstmt.setInt(12, assetID);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
            return 1;
        } catch (SQLException e) {
            System.out.println("error on asset, modAsset" + e.getMessage());
            return 0;
        }
    }
    
    public int deleteAsset() {
        // delete asset
        try {
            Connection con;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HAMS?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = con.prepareStatement("DELETE FROM assets WHERE assetID=?");

            // first param = place of questionmark
            // second param = value
            pstmt.setInt(1, assetID);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
            return 1;
        } catch (SQLException e) {
            System.out.println("error on asset, deleteAsset" + e.getMessage());
            return 0;
        }
    }
    
    public int viewAsset() {
        // view record
        try {
            Connection con;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HAMS?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = con.prepareStatement("SELECT assetID, hoa_owner, asset_type, asset_desc, asset_name, aquisition_date, "
                    + "for_rent, asset_value, asset_status, asset_locX, asset_locY, containing_asset "
                    + "FROM assets WHERE assetID=?");

            // first param = place of questionmark
            // second param = value
            pstmt.setInt(1, assetID);
            
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                assetID = rs.getInt("assetID");
                hoa_owner = rs.getString("hoa_owner");
                asset_type = getType(rs.getString("asset_type"));
                asset_desc = rs.getString("asset_desc");
                asset_name = rs.getString("asset_name");
                aquisition_date = rs.getString("aquisition_date");
                for_rent = rs.getBoolean("for_rent");
                asset_value = rs.getDouble("asset_value");
                asset_status = getStatus(rs.getString("asset_status"));
                asset_locX = rs.getDouble("asset_locX");
                asset_locY = rs.getDouble("asset_locY");
                containing_asset = rs.getInt("containing_asset");

            }
            rs.close();
            pstmt.close();
            con.close();
            return 1;
        } catch (SQLException e) {
            System.out.println("error on asset, viewAsset" + e.getMessage());
            return 0;
        }
    }
    
}
