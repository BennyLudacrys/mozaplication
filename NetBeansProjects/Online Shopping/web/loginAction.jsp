<%@page import="javax.swing.JOptionPane"%>
<%@page import="com.tech.blog.helper.Hash"%>
<%@ page import="connection.ConnectionProvider"%>
<%@page import="java.sql.*" %>


<%
String email= request.getParameter("email");
String password= Hash.encrypt(request.getParameter("password"));

if("admin@gmail.com".equals(email) && "f814fa854345efd9d9f444b3aa79572609b7a383".equals(password)){
session.setAttribute("email", email);
response.sendRedirect("admin/adminHome.jsp");


    }else{
    int z=0;
    try {
         Connection con = ConnectionProvider.getConnection();
         Statement st=con.createStatement();
         ResultSet rs=st.executeQuery("Select * from users where email='"+email+"' and password='"+password+"'");
         while(rs.next()){
         z=1;
         
         session.setAttribute("email", email);
         response.sendRedirect("home.jsp");
    
    }
    if (z==0)
    response.sendRedirect("login.jsp?msg=notexist");
        } catch (Exception e) {
        JOptionPane.showMessageDialog(null, e);
        System.out.println(e);
         response.sendRedirect("login.jsp?msg=invalid");
        }
      
    }
%>