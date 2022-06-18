<%@ page import="connection.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<%@include  file="header.jsp"%>
<%@include  file="footer.jsp"%>
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
        <div style="color: white; text-align: center; font-size: 30px;">Pagina inicial <i class="fa fa-institution"></i></div>
            <%String msg = request.getParameter("msg");
        if ("added".equals(msg)) {%>
        <h3 class="alert">Produto adicionado com sucesso!</h3>
        <%}%>
        <%
        if ("exist".equals(msg)) {%>
        <h3 class="alert">Produto já existe no seu carrinho! Quantidade aumentada!</h3>
        <%}%>
        <%
        if ("invalid".equals(msg)) {%>
        <h3 class="alert">algo deu errado tente novamente!</h3>
          <%}%>
        <table>
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Nome</th>
                    <th scope="col">Categoria</th>
                    <th scope="col"><i class="fa fa-inr"></i> Preço</th>
                    <th scope="col">Adicionar ao carrinho <i class='fas fa-cart-plus'></i></th>
                </tr>
            </thead>
            <tbody>
<%
try {
        Connection con = ConnectionProvider.getConnection();
        Statement st= con.createStatement();
        ResultSet rs =st.executeQuery("select * from product where active='yes'");
        while(rs.next()){
   
%>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><i class="fa fa-inr"></i> <%=rs.getString(4)%></i></td>
                    <td><a href="addToCartAction.jsp?id=<%=rs.getString(1)%>">Adicionar ao carrinho <i class='fas fa-cart-plus'></i></a></td>
                </tr>
<%
    }}
catch(Exception e){
System.out.println(e);
}%>
            </tbody>
        </table>
        <br>
        <br>
        <br>
        
        
        
        
        
        
        
        
        
        
        
                <!--fim do navbar-->


       
        <div class="alert" role="alert">
           
        </div> 




        <!--pagina principal-->

        <main>
            <div class="container">
                <div class="row mt-4">
                    <!--first col-->
                    <div class="col-md-4">
                        <!--categories-->
                        <div class="list-group">
                            <a href="#" onclick=""  class=" c-link list-group-item list-group-item-action active">
                                All Posts
                            </a>
                            <!--categorias-->

                            
                            <a href="#" onclick="" class=" c-link list-group-item list-group-item-action"></a>


                        </div>

                    </div>

                    <!--carregamento-->
                    <div class="col-md-8" >
                        <!--posts-->
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-2">Carregando...</h3>
                        </div>

                        <div class="container-fluid" id="post-container">

                        </div>
                    </div>

                </div>

            </div>

        </main>
        
        
        
        
        
        

    </body>
</html>