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
import pe.dto.Students;
import pe.util.DBUtils;
import static pe.util.DBUtils.getConnection;

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
                + "      ,[roleID]\n"
                + "      ,[status]\n"
                + "  FROM [StudentManagement].[dbo].[tblUsers]\n"
                + "  where [userID] = ? and password = ?";
        try {
            Connection connection = getConnection();
            PreparedStatement pre = connection.prepareStatement(querry);
            pre.setString(1, id);
            pre.setString(2, pass);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return new Account(rs.getString("userID"), rs.getString("fullName"), rs.getString("password"), rs.getString("roleID"), rs.getInt("status"));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Students> getListByName(String name) {
        List<Students> list = new ArrayList<>();
        String querry = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[major]\n"
                + "      ,[yearOfBirth]\n"
                + "  FROM tblStudents\n"
                + "  where name like ?";
        try {
            connection = getConnection();
            pre = connection.prepareStatement(querry);
            pre.setString(1, '%' + name + '%');
            rs = pre.executeQuery();

            while ((rs.next())) {
                list.add(new Students(rs.getString("id"), rs.getString("name"), rs.getString("major"), rs.getInt("yearOfBirth")));

            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public void deleteChangeStatus(String id) {
        String query = "DELETE tblStudents WHERE id=?";
        try {
            connection = new DBUtils().getConnection();
            pre = connection.prepareStatement(query);
            pre.setString(1, id);
            rs = pre.executeQuery();
        } catch (Exception e) {
        }
    }

    public boolean Update(Students student) {
        boolean checkUpdate = false;
        String query = "update tblStudents SET  name = ?, major = ? where id = ?";
        try {
            connection = new DBUtils().getConnection();
            pre = connection.prepareStatement(query);
            pre.setString(1, student.getName());
            pre.setString(2, student.getMajor());
            pre.setString(3, student.getId());
            checkUpdate = pre.executeUpdate() > 0 ? true : false;
        } catch (Exception e) {
        }
        return checkUpdate;
    }
    public boolean inser(Students student) {
        boolean checkInsert = false;
        String query = "insert into tblStudents(id, name, major, yearOfBirth) values(?, ?, ?, ?)";
        try {
            connection = new DBUtils().getConnection();
            pre = connection.prepareStatement(query);
            pre.setString(1, student.getId());
            pre.setString(2, student.getName());
            pre.setString(3, student.getMajor());
            pre.setInt(4, student.getYearOfBirth());
            checkInsert = pre.executeUpdate() > 0 ? true : false;
        } catch (Exception e) {
        }
        return checkInsert;
    }
}
