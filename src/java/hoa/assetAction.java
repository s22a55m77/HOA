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
    
    public int dispose() {
        return 1;
    }
}
