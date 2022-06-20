<%@page import="com.tech.blog.helper.Hash"%>
<%@page import="javax.swing.JOptionPane"%>
<%@ page import="connection.ConnectionProvider"%>
<%@page import="java.sql.*" %>



<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String mobilenumber = request.getParameter("mobilenumber");
String securityQuestion = request.getParameter("securityQuestion");
String answer = request.getParameter("answer");
String password = Hash.encrypt(request.getParameter("password"));
String address="";
String city="";
String state="";
String country="";

try {
      Connection con = ConnectionProvider.getConnection(); 
      PreparedStatement ps= con.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?,?)");
      ps.setString(1, name);
      ps.setString(2, email);
      ps.setString(3, mobilenumber);
      ps.setString(4, securityQuestion);
      ps.setString(5, answer);
      ps.setString(6, password);
      ps.setString(7, address);
      ps.setString(8, city);
      ps.setString(9, state);
      ps.setString(10, country);
      ps.executeUpdate();
      response.sendRedirect("login.jsp?msg=valid");
      
    } catch (Exception e) {
    JOptionPane.showMessageDialog(null, e);
    System.out.println("e");
    response.sendRedirect("signup.jsp?msg=invalid");
    }
   
%>
