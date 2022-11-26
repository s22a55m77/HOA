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
public class donationAction {
    public ArrayList<Integer> donations = new ArrayList<Integer>();
    
    public int getDonations() {
      try {
            Connection con;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hoa?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = con.prepareStatement("SELECT assetID FROM asset_donation;");
            
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                int assetID = rs.getInt("assetID");
                donations.add(assetID);
            }
            
            rs.close();
            pstmt.close();
            con.close();
            return 1;
        } catch (SQLException e) {
            System.out.println("error on donation, viewDonation" + e.getMessage());
            return 0;
        }
    };
    
    public int delDonor(int assetID) {
        try {
            Connection con;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hoa?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = con.prepareStatement("UPDATE asset_donation SET donor_completename=null, donor_address=null WHERE assetID = ?;");
            
            pstmt.setInt(1, assetID);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
            return 1;
        } catch (SQLException e) {
            System.out.println("error on donation, viewDonation" + e.getMessage());
            return 0;
        }
    };
}
