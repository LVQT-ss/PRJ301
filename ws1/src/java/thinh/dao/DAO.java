/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thinh.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import thinh.dto.Account;
import thinh.dto.Mobile;
import thinh.util.DBUtils;
import static thinh.util.DBUtils.getConnection;

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

   
}