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

import java.util.*;
import java.sql.*;

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
            donations.clear();
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
    
    public void record(int assetID, String donor_completename, String donor_address,
                       double amount, int acceptingOfficer, String donorsform_filename,
                       String donation_date, int authorizing_president) {
        donation donation = new donation();
        donation.assetID = assetID;
        donation.donor_completename = donor_completename;
        donation.donor_address = donor_address;
        donation.amount = amount;
        donation.acceptingOfficer = acceptingOfficer;
        donation.donorsform_filename = donorsform_filename;
        donation.donation_date = donation_date;
        donation.authorizing_president = authorizing_president;
        
        donation.addDonation();
    }
    
    public int savePicture(int assetID, String filename) {
        try {
            Connection con;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hoa?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = con.prepareStatement("INSERT INTO donation_pictures (assetID, filename) VALUES (?, ?)");

            // first param = place of questionmark
            // second param = value
            pstmt.setInt(1, assetID);
            pstmt.setString(2, filename);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
            return 1;
        } catch (SQLException e) {
            System.out.println("error on asset, addAsset" + e.getMessage());
            return 0;
        }
    }
    
    public donation getDonation(int assetID) {
        donation donation = new donation();
        donation.assetID=assetID;
        
        return donation;
    }
}
