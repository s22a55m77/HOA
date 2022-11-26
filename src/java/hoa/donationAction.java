/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoa;

import java.util.*;
import java.sql.*;

/**
 *
 * @author ccslearner
 */
public class donationAction {
    
    
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
    
}
