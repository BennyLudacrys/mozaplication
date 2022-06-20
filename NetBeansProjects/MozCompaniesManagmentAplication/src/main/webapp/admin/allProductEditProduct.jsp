<%@page import="javax.swing.JOptionPane"%>
<%@ page import="connection.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Home</title>
        <style>
            h3
            {
                color: yellow;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div style="color: white; text-align: center; font-size: 30px;">Ver & Alterar Produtos <i class='fab fa-elementor'></i></div>

        <%
            String msg = request.getParameter("msg");
            if ("done".equals(msg)) {
        %>
        <h3 class="alert">Produto actualizado com sucesso!</h3>
        <%}%>
        <%if ("wrong".equals(msg)) {%>
        <h3 class="alert">Algo de mal aconteceu! Tente novamente!</h3>
        <%}%>
        <table>
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Nome</th>
                    <th scope="col">Categoria</th>
                    <th scope="col"><i class="fa fa-inr"></i> Preco</th>
                    <th>Estado</th>
                    <th scope="col">Editar <i class='fas fa-pen-fancy'></i></th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Connection con = ConnectionProvider.getConnection();
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select * from product");
                        while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><i class="fa fa-inr"></i><%=rs.getString(4)%></td>
                    <td><%=rs.getString(5)%></td>
                    <td><a href="editProduct.jsp?id=<%=rs.getString(1)%>">Editar <i class='fas fa-pen-fancy'></i></a></td>
                </tr>

                <% 
                        }
                    } catch (Exception e) {
                        System.out.println(e);
                    }

                %>
            </tbody>
        </table>
        <br>
        <br>
        <br>

    </body>
</html>