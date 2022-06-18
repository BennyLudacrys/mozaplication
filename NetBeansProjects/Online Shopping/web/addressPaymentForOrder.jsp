<%@page import="javax.swing.JOptionPane"%>
<%@ page import="connection.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<%@include  file="footer.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
        <title>Home</title>
        <script>
            if (window.history.forward(1) !== null)
                window.history.forward(1);
        </script>
    </head>
    <body>
        <br>
        <table>
            <thead>
                <%
                    String email = session.getAttribute("email").toString();
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
                    <th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Voltar</i></a></th>
                    <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i> <%out.println(total);%></th>
                </tr>
            </thead>
            <thead>
                <tr>
                    <th scope="col">S.No</th>
                    <th scope="col">Nome do Produto</th>
                    <th scope="col">Categoria</th>
                    <th scope="col"><i class="fa fa-inr"></i> preço</th>
                    <th scope="col">Quantidade</th>
                    <th scope="col">Sub Total</th>
                </tr>
            </thead>
            <tbody>
                <%
                    ResultSet rs = st.executeQuery("select * from product inner join cart on product.id=cart.product_id and cart.email='" + email + "' and cart.adress is null");
                    while (rs.next()) {

                %>
                <tr>
                    <%sno = sno + 1;%>
                    <td><%out.println(sno);%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><i class="fa fa-inr"></i> <%=rs.getString(4)%></td>
                    <td><%=rs.getString(8)%> </td>
                    <td><i class="fa fa-inr"></i> <%=rs.getString(10)%></td>
                </tr>
                <%}
                    ResultSet rs2 = st.executeQuery("select * from users where email='" + email + "'");
                    while (rs2.next()) {
                %>


            </tbody>
        </table>

        <hr style="width: 100%">
        <form action="addressPaymentForOrderAction.jsp" method= "POST">

            <div class="left-div">
                <h3>Insira o endereço</h3>
                <input class="input-style" type="text" name="address" value="<%=rs2.getString(7)%>" placeholder="Insira o endereço">

            </div>

            <div class="right-div">
                <h3>Digite a cidade</h3>
                <input class="input-style" type="text" name="city" value="<%=rs2.getString(8)%>" placeholder="Digite a cidade">


            </div> 

            <div class="left-div">
                <h3>Digite o estado</h3>
                <input class="input-style" type="text" name="state" value="<%=rs2.getString(9)%>" placeholder="Digite o estado">

            </div>

            <div class="right-div">
                <h3>Digite o país</h3>
                <input class="input-style" type="text" name="country" value="<%=rs2.getString(10)%>" placeholder="Digite o país">

            </div>
            <h3 style="color: red">*Se não houver endereço, significa que você não definiu seu endereço!</h3>
            <h3 style="color: red">*Este endereço também será atualizado para o seu perfil</h3>
            <hr style="width: 100%">
            <div class="left-div">
                <h3>Selecione o metodo de pagamentot</h3>
                <select class="input-style" name="paymentMethod">
                    <option value="dinheiro na entrega">Pagamento na entrega</option>
                    <option value="Pagamento online">Pagamento Online</option>

                </select>

            </div>

            <div class="right-div">
                <h3>Pague por conta movel aqui</h3>
                <input class="input-style" type="text" name="transictionId" placeholder="insira o id da transição">

                <h3 style="color: red">*Se você selecionar Pagamento por conta movel, insira seu ID de transação aqui, caso contrário, deixe em branco</h3>
            </div>
            <hr style="width: 100%">

            <div class="left-div">
                <h3>Número de celular</h3>
                <input class="input-style" type="number" name="mobileNumber" value="<%=rs2.getString(3)%>" placeholder="digite o número do celular" required>


                <h3 style="color: red">*Este número de celular também será atualizado para o seu perfil</h3>
            </div>
            <div class="right-div">
                <h3 style="color: red">*Se você inserir o ID de transação errado, seu pedido será cancelado!</h3>
                <button class="button"> proceder para gerar fatura e salvar<i class='far fa-arrow-alt-circle-right'> </i></button>
                <h3 style="color: red">*Preencha o formulário corretamente</h3>
            </div>
        </form>

        <%
                }
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, e);
            }%>

        <br>
        <br>
        <br>

    </body>
</html>