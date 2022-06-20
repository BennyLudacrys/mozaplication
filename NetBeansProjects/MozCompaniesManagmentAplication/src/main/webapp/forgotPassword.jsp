
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/signup-style.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }
            h3{
                color: red;
                font-weight: 900;
                font-size: 2.5em;
            }

            body{
                background:url(img/bg.jpeg);
                background-size: cover;
                background-attachment: fixed;
            }


        </style>
        <title>Recuperar a palavra passe</title>
    </head>
    <body>
        <div id='container'>
            <div class='signup'>

                <form action="forgotPasswordAction.jsp" method="post">
                    <input type="email" name="email" placeholder="insira o email" required> 
                    <input type="number" name="mobilenumber" placeholder="insira o telefone" required>
                    <select name="securityQuestion" required>
                        <option value="what is your first car"> qual é o seu primeiro carro?</option>
                        <option value="what is the name of your first pet"> qual é o nome do seu primeiro animal de estimação?</option>
                        <option value="what elementar school did you attend"> wque escola primária você frequentou?</option>
                        <option value="what is the name of the town where you where born"> qual é o nome da cidade onde você nasceu?</option>
                    </select>
                    <input type="text" name="answer" placeholder="Introduza o resposta" required>
                    <input type="password" name="newpassword" placeholder="Introduza a nova palavra passe" required>
                    <input type="submit" value="salvar">

                </form>

                <h2><a href="login.jsp">Login</a></h2>
            </div>
            <div class='whyforgotPassword'>

                <%
                    String msg = request.getParameter("msg");
                    if ("done".equals(msg)) {
                %>

                <h3>Senha alterada com sucesso!</h3>
                <%}%>
                <%if ("invalid".equals(msg)) {%>
                <h3>Dados incorretos! Tente novamente!</h3>
                <%}%>
                <h2>Moz managment System</h2>
                <p>O Moz managment System é o aplicativo que permite aos usuários fazer compras online sem ir às lojas para comprá-los.</p>
            </div>
        </div>
    </body>
</html>