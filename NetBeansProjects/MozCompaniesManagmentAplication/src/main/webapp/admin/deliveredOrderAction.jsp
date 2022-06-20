<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*"%>
<%@page import="connection.ConnectionProvider"%>

<%

    String id = request.getParameter("id");
    String email = request.getParameter("email");
    String status = "Entregue";

    try {
        Connection con = ConnectionProvider.getConnection();
        Statement st = con.createStatement();
        st.executeUpdate("update cart set status = '"+status+"' where product_id='"+id+"' and email = '"+email+"' and adress is not null");
        response.sendRedirect("ordersReceived.jsp?msg=delivered");
    } catch (Exception e) {
    JOptionPane.showMessageDialog(null, e);
    response.sendRedirect("ordersReceived.jsp?msg=wrong");
    }
%>
