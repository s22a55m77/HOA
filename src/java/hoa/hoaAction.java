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
public class hoaAction {
    public ArrayList<String> names = new ArrayList();
    
    public int getNames() {
        names.clear();
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/HAMS?user=root&password=12345678&useTimezone=true&serverTimezone=UTC&useSSL=false");
            PreparedStatement   sqlstatement = conn.prepareStatement("SELECT hoaname FROM hoa ORDER BY hoaname ASC;");
            ResultSet rs = sqlstatement.executeQuery();
            names.clear();
            while (rs.next()) {
                names.add(rs.getString("hoaname"));
            }
            sqlstatement.close();
            conn.close();
            return 1;    
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
        
    }
}
