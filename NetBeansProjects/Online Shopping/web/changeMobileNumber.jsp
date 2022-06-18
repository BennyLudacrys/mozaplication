
<html>
    <head>
        <link rel="stylesheet" href="css/changeDetails.css">
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
        <title>Altere o numero do telefone</title>
    </head>


    <body>
        <style>
            body{
                background: black;
            }
        </style>
        <%String msg = request.getParameter("msg");
            if ("done".equals(msg)) {

        %>
        <h3 class="alert">Numero de telefone actualizado com sucesso!</h3>
        <%}%>
        <%if ("done".equals(msg)) {
        %>
        <h3 class="alert">Palavra  passe errada!</h3>
        <%}%>
        <form method="post" action="changeMobileNumberAction.jsp">
            <h3>Introduza o teu novo numero</h3>
            <input class="input-style" type="number" name="mobileNumber" paceholder="Introduza o teu novo numero"required>
            <hr>
            <h3>Introduza a palavra passe</h3>
            <input class="input-style" type="password" name="password" paceholder="Introduza a palavra passe"required>

            <hr>
            <button class="button" type="submit"> Guardar alteracoes<i class='far fa-arrow-alt-circle-right'></i></button>
        </form>
    </body>
    <br><br><br>
</html>