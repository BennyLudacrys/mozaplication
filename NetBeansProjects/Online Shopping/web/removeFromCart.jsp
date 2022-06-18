<%@page import="javax.swing.JOptionPane"%>
<%@ page import="connection.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<%
String email= session.getAttribute("email").toString();
String product_id= request.getParameter("id");

try {
         Connection con = ConnectionProvider.getConnection();
                        Statement st = con.createStatement();
                        st.executeUpdate("delete from cart where email='" + email + "' and product_id='"+product_id+"' and adress is null ");
                        response.sendRedirect("myCart.jsp?msg=removed");
    }
    catch(Exception e){
    JOptionPane.showMessageDialog(null, e);
    
    }
                       
                       
%>