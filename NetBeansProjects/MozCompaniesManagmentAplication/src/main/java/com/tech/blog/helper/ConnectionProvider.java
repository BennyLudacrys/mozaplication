package com.tech.blog.helper;

import java.sql.*;
import javax.swing.JOptionPane;

public class ConnectionProvider {

    private static Connection con;

    public static Connection getConnection() {
        try {

            if (con == null) {
                //carregando a classe de drivers
                Class.forName("com.mysql.jdbc.Driver");

                //criando a conexao
                con = DriverManager.
                        getConnection("jdbc:mysql://localhost:3300/MMS", "root", "");

            }

        } catch (Exception e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(null, e);
        }

        return con;
    }

}
