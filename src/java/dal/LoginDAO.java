/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import common.EnCodingUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import models.Account;

/**
 *
 * @author thanh
 */
public class LoginDAO {

    private Connection con;
    private String status;

    public LoginDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Erorr connection " + e.getMessage();
        }
    }

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Account getLogin(String user, String pass) {
        String ePass = EnCodingUtils.encoding(pass);
        String sql = "select * from Accounts where UserName=? and Password=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, ePass);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Account a = new Account(rs.getInt("Id"), rs.getString("UserName"), rs.getString("Password"),
                        rs.getString("FullName"), rs.getString("Email"), rs.getString("Img"), rs.getBoolean("Male"),
                        rs.getDate("Dob"), rs.getInt("Role"));
                return a;
            } else {
                status = "Erorr enter account";
            }
        } catch (Exception e) {
            status = "Erorr connection " + e.getMessage();

        }
        return null;
    }

    public Account getLogin2(String user, String pass) {
        String sql = "select * from Accounts where UserName=? and Password=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Account a = new Account(rs.getInt("Id"), rs.getString("UserName"), rs.getString("Password"),
                        rs.getString("FullName"), rs.getString("Email"), rs.getString("Img"), rs.getBoolean("Male"),
                        rs.getDate("Dob"), rs.getInt("Role"));
                return a;
            } else {
                status = "Erorr enter account";
            }
        } catch (Exception e) {
            status = "Erorr connection " + e.getMessage();

        }
        return null;
    }

    public List<Account> getListAcc() {
        List<Account> listA = new ArrayList<>();
        String sql = "select * from Accounts order by Role";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account a = new Account(rs.getInt("Id"), rs.getString("UserName"), rs.getString("Password"),
                        rs.getString("FullName"), rs.getString("Email"), rs.getString("Img"), rs.getBoolean("Male"),
                        rs.getDate("Dob"), rs.getInt("Role"));
                listA.add(a);
            }
        } catch (Exception e) {
            status = "Erorr connection " + e.getMessage();
        }
        return listA;
    }

    public boolean checkAccount(String user) {
        String sql = "select UserName from Accounts where UserName=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ps.close();
                return true;
            }

        } catch (Exception e) {
            status = "Erorr connection at checkAccount  " + e.getMessage();
        }
        return false;
    }

    public void addAccount(String user, String pass, String email) {
        String ePass = EnCodingUtils.encoding(pass);
        String sql = "INSERT INTO [dbo].[Accounts]([UserName],[Password],"
                + "[FullName],[Email],[Img],[Male],[Dob],[Role]) VALUES(?,?,?,?,NULL, 0,NULL, 1)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, ePass);
            ps.setString(3, user);
            ps.setString(4, email);
            ps.execute();
            ps.close();
        } catch (Exception e) {
            status = "Erorr connection " + e.getMessage();

        }
    }

    public int getUserIdFromUsername(String userName) {
        int userId = 0;
        String sql = "SELECT Id FROM Accounts WHERE UserName = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, userName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                userId = rs.getInt("Id");
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            status = "Error connection " + e.getMessage();
        }
        return userId;
    }

    public void deleteArtistByUserId(int userId) {
        String sql = "DELETE FROM Artists WHERE Use_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            status = "Error connection " + e.getMessage();
        }
    }

    public void updateAccount(String fullname, String email, boolean gender, Date date, String userName) {
        String sql = "UPDATE [dbo].[Accounts] SET [FullName] =? , [Email] =? ,[Male] =? ,[Dob] =? WHERE UserName =?";
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setBoolean(3, gender);
            ps.setDate(4, sqlDate);
            ps.setString(5, userName);
            ps.execute();
            ps.close();
        } catch (Exception e) {
            status = "Erorr connection " + e.getMessage();

        }
    }

    public void updateAccount(String userName, String fullName, String email, int roleNo) {
        String sql = "UPDATE Accounts SET FullName=?, Email=?, Role=? WHERE UserName=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, fullName);
            ps.setString(2, email);
            ps.setInt(3, roleNo);
            ps.setString(4, userName);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateAccount2(String fullname, String email, boolean gender, Date date, String userName) {
        String sql = "UPDATE [dbo].[Accounts] SET [FullName] =? , [Email] =? ,[Male] =? ,[Dob] =? WHERE UserName =?";
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setBoolean(3, gender);
            ps.setDate(4, sqlDate);
            ps.setString(5, userName);
            ps.execute();
            ps.close();
        } catch (Exception e) {
            status = "Erorr connection " + e.getMessage();

        }
    }

    public void deleteAcc(String Id) {

        String sql = "DELETE FROM [dbo].[Accounts] WHERE Id =?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, Id);
            ps.execute();
            ps.close();
        } catch (Exception e) {
            status = "Erorr connection " + e.getMessage();
        }
    }

    public void updatePass(String nPass, String uname) {

        String ePass = EnCodingUtils.encoding(nPass);

        String sql = "UPDATE [dbo].[Accounts] SET Password=? WHERE UserName =?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, ePass);
            ps.setString(2, uname);
            ps.execute();
            ps.close();
        } catch (Exception e) {
            status = "Erorr connection " + e.getMessage();
        }
    }

    public void addArtist(String name, String userName) {
        int userId = 0;

        // Lấy userId từ bảng Accounts dựa trên userName
        String sqlGetUserId = "SELECT Id FROM Accounts WHERE UserName = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sqlGetUserId);
            ps.setString(1, userName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                userId = rs.getInt("Id");
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            status = "Error connection " + e.getMessage();
        }

        // Thêm dữ liệu vào bảng Artists
        String sqlInsert = "INSERT INTO Artists (Name, Use_id) VALUES (?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sqlInsert);
            ps.setString(1, name);
            ps.setInt(2, userId);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            status = "Error connection " + e.getMessage();
        }
    }

    public Account getAccountfromEmails(String user, String email) {
        String sql = "select * from Accounts where UserName=? and Email=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Account a = new Account(rs.getInt("Id"), rs.getString("UserName"), rs.getString("Password"), rs.getString("FullName"), rs.getString("Email"), rs.getString("Img"), rs.getBoolean("Male"), rs.getDate("Dob"), rs.getInt("Role"));
                return a;
            } else {
                status = "Erorr enter account";
            }
        } catch (Exception e) {
            status = "Erorr connection " + e.getMessage();

        }
        return null;
    }
}
