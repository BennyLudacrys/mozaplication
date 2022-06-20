<%@page import="javax.swing.JOptionPane"%>
<%@ page import="connection.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp" %>


<html>
    <head>
        <link rel="stylesheet" href="../css/addNewProduct-style.css">
        <title>Adicione Novo Produto</title>
    </head>
    <body>

        <%
            String msg = request.getParameter("msg");
            if ("done".equals(msg)) {
        %>

        <h3 class="alert">Produto adicionado com sucesso!</h3>
        <%}%>

        <%if ("wrong".equals(msg)) {%>
        <h3 class="alert">Algo de mal aconteceu! Tente novamente!</h3>
        <%}%>

        <%
            int id = 1;
            try {
                Connection con = ConnectionProvider.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select max(id) from product");
                while (rs.next()) {
                    id = rs.getInt(1);
                    id = id + 1;
                }
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, e);
            }


    
        %>
        <form action="addNewProductAction.jsp" method="post">


            <h3 style="color: yellow;">ID Produto:<%out.println(id);%> </h3>
            <input type="hidden" name="id" value="<%out.println(id);%>">


            <div class="left-div">
                <h3>Introduza o nome</h3>
                <input class="input-style" type="text" name="name" placeholder="escreva o nome"  required>

                <hr>
            </div>

            <div class="right-div">
                <h3>Introduza a Categoria</h3>
                <input class="input-style" type="text" name="category" placeholder="escreva a categoria"  required>

                <hr>
            </div>

            <div class="left-div">
                <h3>Introduza Preco</h3>
                <input class="input-style" type="number" name="price" placeholder="escreva o preco"  required>

                <hr>
            </div>



            <div class="right-div">
                <h3>Esta dispoivel?</h3>
                <select class="input-style" name="active">
                    <option value="yes">Sim</option>
                    <option value="no">Nao</option>

                </select>

                <hr>
            </div>

            <div class="left-div">
                <h3>Insira a foto do produto</h3>
                <input class="input-style" type="file" name="pic">

                <hr>
            </div>
            <button class="button">Publicar <i class='far fa-arrow-alt-circle-right'></i></button>
        </form>
   <%@include file="../footer.jsp" %>
    <br><br><br>
</body>
</html>