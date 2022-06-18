<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*"%>
<%@page import="connection.ConnectionProvider"%>
<%@include  file="adminHeader.jsp"%>
<%@include  file="../footer.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link rel="stylesheet" href="../css/ordersReceived-style.css">
        <title>Home</title>
        <style>
            .th-style
            {
                width: 25%;
            }
        </style>
    </head>
    <body>
        <div style="color: white; text-align: center; font-size: 30px;">Pedidos Recebidos <i class="fas fa-archive"></i></div>
            <%String msg = request.getParameter("msg");
                if ("cancel".equals(msg)) {
            %>
        <h3 class="alert">Pedido cancelado com Sucesso!</h3>
        <%}%>

        <%if ("delivered".equals(msg)) {
        %>
        <h3 class="alert">Actualizado com Sucesso!</h3>
        <%}%>
        <%if ("invalid".equals(msg)) {
        %>
        <h3 class="alert">Algo de mal aconteceu! Tente novamente!</h3>
        <%}%>

        <table id="customers">
            <tr>
                <th>Numero de Telefone</th>
                <th scope="col"> Nome do produto</th>
                <th scope="col">Quantidade</th>
                <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
                <th>Endereco</th>
                <th>Cidade</th>
                <th>Estado</th>
                <th>Pais</th>
                <th scope="col">Order Date</th>
                <th scope="col">Data De Entrega</th>
                <th scope="col">Tipo de  pagamento</th>
                <th scope="col">Transicao No.</th>
                <th scope="col">Estado</th>
                <th scope="col">cancelar pedido <i class='fas fa-window-close'></i></th>
                <th scope="col">Pedido Entrege <i class='fas fa-dolly'></i></i></th>
            </tr>

            <%

                try {
                    Connection con = ConnectionProvider.getConnection();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.orderdate is not null and cart.status='processing'");
                    while (rs.next()) {

            %>      
            <tr>
                <td><%=rs.getString(10)%></td>
                <td><%=rs.getString(17)%></td>
                <td><%=rs.getString(3)%></td>
                <td><i class="fa fa-inr"></i> <%=rs.getString(5)%> </td>
                <td><%=rs.getString(6)%></td>
                <td><%=rs.getString(7)%></td>
                <td><%=rs.getString(8)%></td>
                <td><%=rs.getString(9)%></td>
                <td><%=rs.getString(11)%></td>
                <td><%=rs.getString(12)%></td>
                <td><%=rs.getString(13)%></td>
                <td><%=rs.getString(14)%></td>
                <td><%=rs.getString(15)%></td>
                <td><a href="cancelOrdersAction.jsp?id=<%=rs.getString(2)%>&email=<%=rs.getString(1)%>">Cancelar <i class='fas fa-window-close'></i></a></td>
                <td><a href="deliveredOrderAction.jsp?id=<%=rs.getString(2)%>&email=<%=rs.getString(1)%>">Entregue <i class='fas fa-dolly'></i></i></a></td>
            </tr>
            <%}
                    } catch (Exception e) {
                        JOptionPane.showMessageDialog(null, e);
                    }
                %>
        </table>
        <br>
        <br>
        <br>

    </body>
</html>