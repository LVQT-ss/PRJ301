/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import dto.Account;
import dto.Mobile;
import util.DBUtils;
import static util.DBUtils.getConnection;

/**
 *
 * @author ocbu0
 */
public class DAO extends DBUtils {

    Connection connection = null;
    PreparedStatement pre = null;
    ResultSet rs = null;

    public Account checkAccount(String id, String pass) {
        String querry = "SELECT TOP (1000) [userID]\n"
                + "      ,[fullName]\n"
                + "      ,[password]\n"
                + "      ,[role]\n"
                + "  FROM [WS_1].[dbo].[tbl_User]\n"
                + "  where [userID] = ? and password = ?";
        try {
            Connection connection = getConnection();
            PreparedStatement pre = connection.prepareStatement(querry);
            pre.setString(1, id);
            pre.setString(2, pass);
            ResultSet rs = pre.executeQuery();
            
            while (rs.next()) {
                return new Account(rs.getString("userID"), rs.getString("fullName"), rs.getString("password"), rs.getString("role"));
        }
        } catch (Exception e) {
        }
        return null;
    }
// list for staff 
 public List<Mobile> getListByName(String name) {
        List<Mobile> list = new ArrayList<>();
       String querry = "SELECT [mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]\n"
            + "FROM tbl_Mobile\n"
            + "WHERE mobileId like ?";
    try {
            connection = getConnection();
            pre = connection.prepareStatement(querry);
            pre.setString(1, '%' + name + '%');
            rs = pre.executeQuery();

             while (rs.next()) {
            Mobile mobile = new Mobile(
                    rs.getString("mobileId"),
                    rs.getString("description"),
                    rs.getFloat("price"),
                    rs.getString("mobileName"),
                    rs.getInt("yearOfProduction"),
                    rs.getInt("quantity"),
                    rs.getBoolean("notSale")
            );
            list.add(mobile);
        }
            return list;
        } catch (Exception e) {
        }
        return null;
    }
 // list for user 
 public List<Mobile> getListByPriceRange(float minPrice, float maxPrice) {
    List<Mobile> list = new ArrayList<>();
    String query = "SELECT [mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]\n"
            + "FROM tbl_Mobile\n"
            + "WHERE price BETWEEN ? AND ?";
    try {
        connection = getConnection();
        pre = connection.prepareStatement(query);
        pre.setFloat(1, minPrice);
        pre.setFloat(2, maxPrice);
        rs = pre.executeQuery();

        while (rs.next()) {
            Mobile mobile = new Mobile(
                    rs.getString("mobileId"),
                    rs.getString("description"),
                    rs.getFloat("price"),
                    rs.getString("mobileName"),
                    rs.getInt("yearOfProduction"),
                    rs.getInt("quantity"),
                    rs.getBoolean("notSale")
            );
            list.add(mobile);
        }
        return list;
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close resources
    }
    return null;
}

 

 
  public void deleteChangeStatus(String mobileId) {
        String query = "DELETE tbl_Mobile WHERE mobileId=?";
        try {
            connection = new DBUtils().getConnection();
            pre = connection.prepareStatement(query);
            pre.setString(1, mobileId);
            rs = pre.executeQuery();
        } catch (Exception e) {
        }
    }

    public boolean Update(Mobile mobile) {
        boolean checkUpdate = false;
        String query = "update tbl_Mobile SET  price = ?, description = ?, quantity = ?, notSale = ? where mobileId = ?";
        try {
            connection = new DBUtils().getConnection();
            pre = connection.prepareStatement(query);
            pre.setFloat(1, mobile.getPrice());
            pre.setString(2, mobile.getDescription());
            pre.setInt(3, mobile.getQuantity());
            pre.setBoolean(4, mobile.isNotSale());
            pre.setString(5, mobile.getMobileId());
            checkUpdate = pre.executeUpdate() > 0 ? true : false;
        } catch (Exception e) {
        }
        return checkUpdate;
    }
    
    
        public boolean inser(Mobile mobile) {
            boolean checkInsert = false;
            String query = "INSERT INTO tbl_Mobile(mobileId, description, price, mobileName, yearOfProduction, quantity, notSale) VALUES (?, ?, ?, ?, ?, ?, ?)";
            try {
                connection = getConnection();
                pre = connection.prepareStatement(query);
                pre.setString(1, mobile.getMobileId());
                pre.setString(2, mobile.getDescription());
                pre.setFloat(3, mobile.getPrice());
                pre.setString(4, mobile.getMobileName());
                pre.setInt(5, mobile.getYearOfProduction());
                pre.setInt(6, mobile.getQuantity());
                pre.setBoolean(7, mobile.isNotSale());
                checkInsert = pre.executeUpdate() > 0;
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                closeResources();
            }
            return checkInsert;
        }
        
        
    private void closeResources() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pre != null) {
                pre.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
   
}