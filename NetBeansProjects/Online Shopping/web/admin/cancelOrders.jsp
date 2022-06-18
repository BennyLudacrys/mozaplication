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
{ width: 25%;}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;"> Pedidos Cancelados <i class='fas fa-window-close'></i></div>




<table id="customers">
          <tr>
          <th>Numero de telefone</th>
            <th scope="col">Nome do produto</th>
            <th scope="col">Quantidade</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th>Endereco</th>
            <th>Cidade</th>
            <th>Estado</th>
            <th>Pais</th>
            <th scope="col">Date do pedido</th>
             <th scope="col">Data de entrega</th>
             <th scope="col">Tipo de Pagamento</th>
              <th scope="col">Transicao No.</th>
              <th scope="col">Estado</th>
          </tr>
        
       
        <%
        
    try {
        Connection con = ConnectionProvider.getConnection();
        Statement st = con.createStatement();
        ResultSet rs =st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.orderDate is not null and cart.status='cancelado'");
        while (rs.next()){
        
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
              </tr>
         <%
             }}
         catch(Exception e){

}%>
        </table>
      <br>
      <br>
      <br>

</body>
</html>