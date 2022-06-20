<%@page import="javax.swing.JOptionPane"%>
<%@ page import="connection.ConnectionProvider"%>
<%@page import="java.sql.*" %>

<%
    String email = session.getAttribute("email").toString();
    String mobileNumber = request.getParameter("mobileNumber");
    String password = request.getParameter("password");

    int check = 0;

    try {
        Connection con = ConnectionProvider.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from users where email='" + email + "' and password='" + password + "'");
        while (rs.next()) {
            check = 1;
            st.executeUpdate("update users set mobilenumber='" + mobileNumber + "' where email='" + email + "'");
            response.sendRedirect("changeMobileNumber.jsp?msg=done");
    }
        if (check == 0) {
            response.sendRedirect("changeMobileNumber.jsp?msg=wrong");
        }
    } catch (Exception e) {
        JOptionPane.showMessageDialog(null, e);
        response.sendRedirect("changeMobileNumber.jsp?msg=wrong");

    }
    
%>