<%@page import="javax.swing.JOptionPane"%>
<%@ page import="connection.ConnectionProvider"%>
<%@page import="java.sql.*" %>

<%
String email= request.getParameter("email");
String mobilenumber= request.getParameter("mobilenumber");
String securityQuestion= request.getParameter("securityQuestion");
String answer= request.getParameter("answer");
String newPassword= request.getParameter("newpassword");

int check=0;
try {
Connection con = ConnectionProvider.getConnection();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("Select * from users where email='"+email+"' and mobilenumber='"+mobilenumber+"' and securityquestion='"+securityQuestion+"' and answer='"+answer+"'");
       while(rs.next()){
       check=1;
       st.executeUpdate("update users set password='"+newPassword+"' where email='"+email+"'");
       response.sendRedirect("forgotPassword.jsp?msg=done");
    } 
    if(check==0){
    response.sendRedirect("forgotPassword.jsp?msg=invalid");
    }
    
    } catch (Exception e) {
    JOptionPane.showMessageDialog(null, e);
    System.out.println(e);
    }
  

%>