<%@page import="javax.swing.JOptionPane"%>
<%@ page import="connection.ConnectionProvider"%>
<%@page import="java.sql.*" %>

<%
    String email = session.getAttribute("email").toString();
    String adress = request.getParameter("address");
    String city = request.getParameter("city");
    String state = request.getParameter("state");
    String country = request.getParameter("country");
    String mobileNumber = request.getParameter("mobileNumber");
    String paymentMethod = request.getParameter("paymentMethod");
    String transictionId = "";
    transictionId = request.getParameter("transictionId");
    String status = "bill";

    try {
        Connection con = ConnectionProvider.getConnection();
        PreparedStatement ps = con.prepareStatement("update users set adress=?, city=?,state=?,country=?,mobilenumber=? where email=?");
        ps.setString(1, adress);
        ps.setString(2, city);
        ps.setString(3, state);
        ps.setString(4, country);
        ps.setString(5, mobileNumber);
        ps.setString(6, email);
        ps.executeUpdate();

       PreparedStatement ps1 = con.prepareStatement("update cart set adress=?, city=?,state=?,country=?,mobilenumber=?, orderdate=now(),deliverydate=DATE_ADD(orderdate, interval 7 day), paymentmethod=?, transictionid=?,status=? where email=? and adress is null");
       ps1.setString(1, adress);
       ps1.setString(2, city);
       ps1.setString(3, state);
       ps1.setString(4, country);
       ps1.setString(5, mobileNumber);
       ps1.setString(6, paymentMethod);
       ps1.setString(7, transictionId);
       ps1.setString(8, status);
       ps1.setString(9, email);
       ps1.executeUpdate();
       response.sendRedirect("bill.jsp");
    }catch(Exception e){
    JOptionPane.showMessageDialog(null, e);
    }
%>