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
import java.util.*;
/**
 *
 * @author ccslearner
 */
public class officerAction {
    public String lastname;
    public String firstname;
    public ArrayList<String> names = new ArrayList();
    public ArrayList<Integer> IDs = new ArrayList();
    
    public String getNameForAssetDonation(int ID) {
        try {
            Connection con;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HAMS?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = con.prepareStatement("SELECT DISTINCT u.lastname, u.firstname\n" +
                                                            "FROM users u JOIN ho ON ho.hoID=u.userID\n" +
                                                            "             JOIN officer o ON o.hoID=ho.hoID\n" +
                                                            "             JOIN asset_donation ad ON o.officerID=ad.acceptingOfficer\n" +
                                                            "WHERE ad.acceptingOfficer = ?;");
            pstmt.setInt(1, ID);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
                lastname = rs.getString("u.lastname");
                firstname = rs.getString("u.firstname");
            }
            
            return lastname + " " + firstname;
        } catch (SQLException e) {
            System.out.println("error on officerAction, getNameForAssetDonation" + e.getMessage());
            return "";
        }
    }
    

    public int getNameForOfficer() {
        try {
            Connection con;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HAMS?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = con.prepareStatement("SELECT DISTINCT u.lastname, u.firstname, o.officerID\n" +
                                                            "FROM users u JOIN ho ON ho.hoID=u.userID\n" +
                                                            "JOIN officer o ON o.hoID=ho.hoID\n" +
                                                            "ORDER BY u.lastname, u.firstname, o.officerID;");
            ResultSet rs = pstmt.executeQuery();
            names.clear();
            IDs.clear();
            while(rs.next()) {
                names.add(rs.getString("u.lastname") + " " + rs.getString("u.firstname"));
                IDs.add(rs.getInt("o.officerID"));
            }
            
            return 1;

        } catch (SQLException e) {
            System.out.println("error on officerAction, getNameForOfficer" + e.getMessage());
            return 0;
        }
    }
    
}
