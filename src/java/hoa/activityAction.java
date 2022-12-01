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
            int authorizing_president,
            int authorizingOfficer,
            String activity_date
    ) {
        assetActivity test = new assetActivity();
        test.assetID = authorizing_president;
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
