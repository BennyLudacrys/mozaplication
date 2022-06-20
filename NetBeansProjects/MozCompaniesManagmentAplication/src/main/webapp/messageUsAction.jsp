<%@page import="javax.swing.JOptionPane"%>
<%@ page import="connection.ConnectionProvider"%>
<%@page import="java.sql.*" %>

<%
        String email = session.getAttribute("email").toString();
        String subject = request.getParameter("subject");
        String body = request.getParameter("body");
  

        try {
            Connection con = ConnectionProvider.getConnection();
            Statement st = con.createStatement();
            PreparedStatement ps = con.prepareStatement("insert into message (email, subject, body) values(?,?,?)");
            ps.setString(1, email);
            ps.setString(2, subject);
            ps.setString(3, body);
            ps.executeUpdate();
            response.sendRedirect("messageUs.jsp?msg=valid");

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
            response.sendRedirect("messageUs.jsp?msg=invalid");
        }
    


%>