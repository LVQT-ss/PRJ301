/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import pe.dto.Account;
import pe.utils.DBUtils;

/**
 *
 * @author Final stage
 */
public class DAO extends DBUtils {
     Connection connection = null;
    PreparedStatement pre = null;
    ResultSet rs = null;

 
        public Account checkAccount(String userID, String password) {
        String querry = "SELECT TOP (1000) [userID]\n"
                + "      ,[fullName]\n"
                + "      ,[password]\n"
                + "      ,[roleID]\n"
                 + "      ,[status]\n"
                + "  FROM [UserManagement].[dbo].[tblUsers]\n"
                + "  where [userID] = ? and password = ?";
        try {
            Connection connection = getConnection();
            PreparedStatement pre = connection.prepareStatement(querry);
            pre.setString(1, userID);
            pre.setString(2, password);
            ResultSet rs = pre.executeQuery();
            
            while (rs.next()) {
                 return new Account(rs.getString("userID"), rs.getString("fullName"), rs.getString("password"),rs.getString("roleID"), rs.getBoolean("status"));
        }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Account> getListByName(String name) {
        List<Account> list = new ArrayList<>();
        String querry = "SELECT [userID]\n"
                + "      ,[fullName]\n"
                + "      ,[password]\n"
                + "      ,[roleID]\n"
                + "      ,[status]\n"
                + "  FROM tblUers\n"
                + "  where fullName like ?";
        try {
            connection = getConnection();
            pre = connection.prepareStatement(querry);
            pre.setString(1, '%' + name + '%');
            rs = pre.executeQuery();

            while ((rs.next())) {
                list.add(new Account(rs.getString("userID"), rs.getString("fullName"),rs.getString("roleID"), rs.getString("password"), rs.getBoolean("status")));

            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }
}
