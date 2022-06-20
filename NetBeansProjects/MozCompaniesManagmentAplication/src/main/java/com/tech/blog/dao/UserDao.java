
package com.tech.blog.dao;

import com.tech.blog.entities.User;
import com.tech.blog.helper.Hash;
import java.sql.*;
import javax.swing.JOptionPane;

public class UserDao {

    private Connection con;
      private static final String SELECT_SQL = "select * from usuario";
    private static final String SELECT_BY_EMAIL_SQL = "select * from user where email =? and password=?";
    private static final String INSERT_SQL = "insert into user(name,email,password,gender,about) values (?,?,?,?,?)";
    private static final String UPDATE_SQL = "update user set name=? , email=? , password=? , gender=? ,about=? , profile=?, cellphone=?  where  id =?";
    private static final String DELETE_SQL = "delete from usuario where id=?";
   

    public UserDao(Connection con) {
        this.con = con;
    }

    //metodo que salva todos os dados na data base:
    public boolean saveUser(User user) {
        boolean f = false;
        try {

            String query = INSERT_SQL;
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());

            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(null, e);
        }
        return f;

    }

    //pegando o usuario por id e email
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;

        try {

            String query = SELECT_BY_EMAIL_SQL;
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                user = new User();

//             dados da tabela
                String name = set.getString("name");
//             pegado o objecto usuario
                user.setName(name);
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
                user.setCellphone(set.getString("cellphone"));

            }

        } catch (Exception e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(null, e);
        }

        return user;
    }

    public boolean updateUser(User user) {

        boolean f = false;
        try {

            String query = UPDATE_SQL;
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getGender());
            p.setString(5, user.getAbout());
            p.setString(6, user.getProfile());
            p.setInt(7, user.getId());
            p.setString(8, user.getCellphone());

            p.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(null, e);
        }
        return f;
    }

    public User getUserByUserId(int userId) {
        User user = null;
        try {
            String q = "select * from user where id=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, userId);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                user = new User();

//             data from db
                String name = set.getString("name");
//             set to user object
                user.setName(name);

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(null, e);
        }

        return user;
    }
    
    
    
     public  boolean deleteUser(User u) {
        boolean sucess = false;
        try {
            Connection con ;
           PreparedStatement ps = this.con.prepareStatement(DELETE_SQL);
            
            ps.setLong(1, u.getId());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                sucess = true;
                ps.close();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sucess;
    }
}
