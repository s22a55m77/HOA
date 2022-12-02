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
import java.util.ArrayList;

/**
 *
 * @author ccslearner
 */
public class ornumberAction {
    public ArrayList<Integer> ORnumber = new ArrayList<>();
    
    public int getORnumber() {
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/HAMS?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");
            PreparedStatement   sqlstatement = conn.prepareStatement("SELECT ORnumber \n" +
                                                                        "FROM REF_OR\n" +
                                                                        "WHERE ORnumber NOT IN (SELECT ORnumber FROM asset_activities)\n" +
                                                                        "AND  ORnumber NOT IN (SELECT ORnumber FROM asset_transfers)\n" +
                                                                        "AND ORnumber NOT IN (SELECT ORnumber FROM asset_rentals)\n" +
                                                                        "ORDER BY ORnumber;");
            ResultSet rs = sqlstatement.executeQuery();
            ORnumber.clear();
            while (rs.next()) {
                ORnumber.add(rs.getInt("ORnumber"));
            }
            sqlstatement.close();
            conn.close();
            return 1;    
        } catch (SQLException e) {
            System.out.println("error on ornumberAction, getORnumber" + e.getMessage());
            return 0;
        }
    }
}
