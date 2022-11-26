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

/**
 *
 * @author ccslearner
 */
public class donation {
    public int assetID;
    public String donor_completename;
    public String donor_address;
    public double amount;
    public int acceptingOfficer;
    public String donorsform_filename;
    public String donation_date;
    public boolean deleted;
    public int authorizing_president;
    
    public donation(){
        
    }
    
    public int addDonation() {
        try {
            Connection con;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hoa?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = con.prepareStatement("INSERT INTO asset_donation (assetID, donor_completename, donor_address, amount,"
                    + "acceptingOfficer, donorsform_filename, donation_date, deleted, authorizing_president) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");

            // first param = place of questionmark
            // second param = value
            pstmt.setInt(1, assetID);
            pstmt.setString(2, donor_completename);
            pstmt.setString(3, donor_address);
            pstmt.setDouble(4, amount);
            pstmt.setInt(5, acceptingOfficer);
            pstmt.setString(6, donorsform_filename);
            pstmt.setString(7, donation_date);
            pstmt.setBoolean(8, deleted);
            pstmt.setInt(9, authorizing_president);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
            return 1;
        } catch (SQLException e) {
            System.out.println("error on donation, addDonation" + e.getMessage());
            return 0;
        }
        
    }
    
    public int modDonation() {
        // modify donation
        try {
            Connection con;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hoa?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = con.prepareStatement("UPDATE asset_donation SET donor_completename=?, donor_address=?, amount=?, acceptingOfficer=?,"
                    + "donorsform_filename=?, donation_date=?, deleted=?, authorizing_president=? "
                    + "WHERE assetID=?");

            // first param = place of questionmark
            // second param = value     
            pstmt.setString(1, donor_completename);
            pstmt.setString(2, donor_address);
            pstmt.setDouble(3, amount);
            pstmt.setInt(4, acceptingOfficer);
            pstmt.setString(5, donorsform_filename);
            pstmt.setString(6, donation_date);
            pstmt.setBoolean(7, deleted);
            pstmt.setInt(8, authorizing_president);
            pstmt.setInt(9, assetID);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
            return 1;
        } catch (SQLException e) {
            System.out.println("error on donation, modDonation" + e.getMessage());
            return 0;
        }
    }
    
    public int deleteDonation() {
        // delete donation
        try {
            Connection con;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hoa?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = con.prepareStatement("DELETE FROM asset_donation WHERE assetID=?");

            // first param = place of questionmark
            // second param = value
            pstmt.setInt(1, assetID);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
            return 1;
        } catch (SQLException e) {
            System.out.println("error on donation, deleteDonation" + e.getMessage());
            return 0;
        }
    }
    
    public int viewDonation() {
        // view record
        try {
            Connection con;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hoa?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = con.prepareStatement("SELECT assetID, donor_completename, donor_address, amount, acceptingOfficer, donorsform_filename, "
                    + "donation_date, deleted, authorizing_president "
                    + "FROM asset_activities WHERE assetID=?");

            // first param = place of questionmark
            // second param = value
            pstmt.setInt(1, assetID);
            
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                assetID = rs.getInt("assetID");
                donor_completename = rs.getString("donor_completename");
                donor_address = rs.getString("donor_address");
                amount = rs.getDouble("amount");
                acceptingOfficer = rs.getInt("acceptingOfficer");
                donorsform_filename = rs.getString("donorsform_filename");
                donation_date = rs.getString("donation_date");
                deleted = rs.getBoolean("deleted");
                authorizing_president = rs.getInt("authorizing_president");
            }
            
            rs.close();
            pstmt.close();
            con.close();
            return 1;
        } catch (SQLException e) {
            System.out.println("error on donation, viewDonation" + e.getMessage());
            return 0;
        }
    }
    
}
