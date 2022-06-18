<%@page import="javax.swing.JOptionPane"%>
<%@ page import="connection.ConnectionProvider"%>
<%@page import="java.sql.*" %>

<%
    String email = session.getAttribute("email").toString();
    String oldPassword = request.getParameter("oldPassword");
    String newPassword = request.getParameter("newPassword");
    String ConfirmPassword = request.getParameter("confirmPassword");

    if (!ConfirmPassword.equals(newPassword)) {
        response.sendRedirect("changePassword.jsp?msg=notMatch");
    } else {
        int check = 0;
        try {
            Connection con = ConnectionProvider.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from users where email='" + email + "' and password= '" + oldPassword + "'");
            while (rs.next()) {
                check = 1;
                st.executeUpdate("update users set password ='" + newPassword + "' where email='" + email + "'");
                response.sendRedirect("changePassword.jsp?msg=done");
            }
            if (check == 0) {
                response.sendRedirect("changePassword.jsp?msg=wrong");
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
    }


%>