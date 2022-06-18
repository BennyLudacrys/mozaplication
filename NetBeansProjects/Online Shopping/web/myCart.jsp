<%@page import="javax.swing.JOptionPane"%>
<%@ page import="connection.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<%@include  file="header.jsp"%>
<%@include  file="footer.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>My Cart</title>
        <style>
            h3
            {
                color: yellow;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div style="color: white; text-align: center; font-size: 30px;">Meu carrinho <i class='fas fa-cart-arrow-down'></i></div>
            <%
                String msg = request.getParameter("msg");
                if ("notPossible".equals(msg)) {%>
        <h3 class="alert">Há apenas uma quantidade! Então clique em remover!</h3>
        <%}%>
        <%
    if ("inc".equals(msg)) {%>
        <h3 class="alert">Quantidade aumentada com sucesso!</h3>
        <%}%>
        <%
    if ("dec".equals(msg)) {%>
        <h3 class="alert">Quantidade reduzida com sucesso!</h3>
        <%}%>
        <%
    if ("removed".equals(msg)) {%>
        <h3 class="alert">Produto removido com sucesso!</h3>
        <%}%>
        <table>
            <thead>
                <%
                    int total = 0;
                    int sno = 0;
                    try {
                        Connection con = ConnectionProvider.getConnection();
                        Statement st = con.createStatement();
                        ResultSet rs1 = st.executeQuery("select sum(total) from cart where email='" + email + "' and adress is null ");
                        while (rs1.next()) {
                            total = rs1.getInt(1);
                        }

                %>

                <tr>
                    <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"><%out.println(total);%></i> </th>
                    <%if (total > 0) {%> <th scope="col"><a href="addressPaymentForOrder.jsp">Proceder com o pedido</a></th><%}%>
                </tr>
            </thead>
            <thead>
                <tr>
                    <th scope="col">S.No</th>
                    <th scope="col">Nome do Produto</th>
                    <th scope="col">Categoria</th>
                    <th scope="col"><i class="fa fa-inr"></i> Preço</th>
                    <th scope="col">Quantidade</th>
                    <th scope="col">Sub Total</th>
                    <th scope="col">Remover <i class='fas fa-trash-alt'></i></th>
                </tr>
            </thead>
            <tbody>
                <%
                    ResultSet rs = st.executeQuery("select * from product inner join cart on product.id=cart.product_id and cart.email='"+email+"' and cart.adress is null");
                    while (rs.next()) {

                %>
                <tr>
                    <%sno = sno + 1;%>
                    <td><%out.println(sno);%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><i class="fa fa-inr"></i> <%=rs.getString(4)%></td>
                    <td><a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=inc"><i class='fas fa-plus-circle'></i></a> <%=rs.getString(8)%> <a a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=dec"><i class='fas fa-minus-circle'></i></a></td>
                    <td><i class="fa fa-inr"></i> <%=rs.getString(10)%></td>
                    <td><a href="removeFromCart.jsp?id=<%=rs.getString(1)%>">Remover <i class='fas fa-trash-alt'></i></a></td>
                </tr>

                <%
                        }
                    } catch (Exception e) {
                        JOptionPane.showMessageDialog(null, e);
                    }
                %>

            </tbody>
        </table>
        <br>
        <br>
        <br>

    </body>
</html>