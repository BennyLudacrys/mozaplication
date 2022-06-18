<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>


        css
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
         <link rel="stylesheet" href="css/signup-style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }
        </style>
       
        </head>
        <body>
            <div id='container'>
                <div class='signup'>
-->                  
<!--<form action="signupAction.jsp" method="post">
                        <input type="text" name="name" placeholder="Introduza o nome" required>
                        <input type="email" name="email" placeholder="Introduza o email" required>
                        <input type="number" name="mobilenumber" placeholder="Introduza o numero" required>
                        <select name="securityQuestion" required>
                            <option value="what is your first car"> what is your first car</option>
                            <option value="what is the name of your first pet"> what is your first car</option>
                            <option value="what elementar school did you attend"> what is your first car</option>
                            <option value="what is the name of the town where you where born"> what is your first car</option>
                        </select>
                        <input type="text" name="answer" placeholder="Introduza o nome" required>
                        <input type="password" name="password" placeholder="Introduza a palavra passe" required>
                        <input type="submit" value="submit">"


                    </form>

                    <h2><a href="login.jsp">Login</a></h2>
                </div>
                <div class='whysign'>

<%
    String msg = request.getParameter("msg");
    if ("done".equals(msg)) {
%>
<h1>Registado com sucesso!</h1>
<%}%>
<%
    if ("invalid".equals(msg)) {
%>



<h1>Some thing Went Wrong! Try Again !</h1>
<%}%>


<h2>Online Shopping</h2>
<p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
</div>
</div>

</body>
</html>



-->


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro</title>


        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }

            .error-validation{
                color: #ff1a1a;
                position: absolute;
                /*top: 57px;*/
                font-size: .8rem;
            }
        </style>

    </head>
    <body>

        <%@include file="normal_navbar.jsp" %>

        <main class="primary-background  banner-background"  style="padding-bottom: 80px;">

            <div class="container">

                <div class="col-md-6 offset-md-3">

                    <div class="card">
                        <div class="card-header text-center primary-background text-white">
                            <span class="fa fa-3x fa-user-circle"></span>
                            <br>
                            Formulario de registo
                        </div>
                        <!--<progress class="progressbar"></progress>-->
                        <div class="card-body">
                            <form id="register-form" action="signupAction.jsp" method="POST">

                                <div class="form-group">
                                    <label for="name">Nome do usuario</label><span>*</span>
                                    <input name="name" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Introduza o nome" required>

                                </div>

                                <div class="form-group">
                                    <label for="email">E-mail</label><span>*</span>
                                    <input name="email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="introduza o email" required>

                                    <small id="emailHelp" class="form-text text-muted">Nunca compartilhe o email com ninguem.</small>
                                </div>

                                <div class="form-group">
                                    <label for="mobilenumber">Numero de Telefone</label><span>*</span>
                                    <input name="mobilenumber" type="number" class="form-control" id="mobilenumber" aria-describedby="emailHelp" placeholder="Introduza o numero de telefone">
                                </div>

                                <div class="form-group">
                                    <select name="securityQuestion" required>
                                        <option value="Qual foi o teu primeiro Carro?">Qual foi o teu primeiro Carro?</option>
                                        <option value="Qual é o nome do seu primeiro animal de estimação?">Qual é o nome do seu primeiro animal de estimação?</option>
                                        <option value="Em que escola primária você estudou?">Em que escola primária você estudou?</option>
                                        <option value="Qual é o nome da cidade onde você nasceu?">Qual é o nome da cidade onde você nasceu?</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="answer">Resposta</label><span>*</span>
                                    <input name="answer" type="text" class="form-control" id="answer" aria-describedby="emailHelp" placeholder="Escreva a tua resposta">
                                </div>

                                <div class="form-group">
                                    <label for="password">Password</label><span>*</span>
                                    <input  name="password" type="password" class="form-control" id="password" placeholder="Password" >

                                </div>
                                <div class="form-group">
                                    <label for="passconfirmation">confirme a Password</label><span>*</span>
                                    <input  name="passconfirmation" type="password" class="form-control" id="passconfirmation" placeholder="confirme a Password" data-equal="password" >
                                </div>

                                <div class="form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="agreement">
                                    <label class="form-check-label" for="exampleCheck1" >Concordar com os termos e privacidade</label>
                                </div>

                                <br>

                                <div class="container text-center" id="loader" style="display: none;">
                                    <span class="fa fa-refresh fa-spin fa-4x"></span>
                                    <h4>Porfavor aguarde...</h4>
                                </div>

                                <button type="submit" class="btn btn-primary">Submeter</button>
                            </form>
                        </div>
                        <p class="error-validation template"></p>

                    </div>
                </div>
            </div>

        </main>



        <!--javascripts-->
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <!--        <script>
                    $(document).ready(function () {
                        console.log("carregado...")
        
                        $('#reg-form').on('submit', function (event) {
                            event.preventDefault();
        
        
        
                            let form = new FormData(this);
        
                            $("#sumbimt-btn").hide();
                            $("#loader").show();
                            //enviando o registo para servlet:
                            $.ajax({
                                url: "signupAction.jsp",
                                type: 'POST',
                                data: form,
                                success: function (data, textStatus, jqXHR) {
                                    console.log(data)
        
                                    $("#sumbimt-btn").show();
                                    $("#loader").hide();
        
                                    if (data.trim() === 'done')
                                    {
        
                                        swal("Registado com sucesso... Vamos te redicionar para o login")
                                                .then((value) => {
                                                    window.location = "login.jsp"
                                                });
                                    } else
                                    {
        
                                        swal(data);
                                    }
        
                                },
                                error: function (jqXHR, textStatus, errorThrown) {
                                    $("#sumbimt-btn").show();
                                    $("#loader").hide();
                                    swal("Algo de mal aconteceu... Tente novamente");
        
                                },
                                processData: false,
                                contentType: false
        
                            });
        
        
        
                        });
        
        
                    });
        
        
        
                </script>-->






    </body>
</html>
