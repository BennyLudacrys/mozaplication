

<%@page import="com.tech.blog.helper.Hash"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina Login</title>
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="icon" href="img/const.png">
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

        <!--navbar-->
        <%@include  file="normal_navbar.jsp" %>


        <%
            String msg = request.getParameter("msg");
            if ("valid".equals(msg)) {%>
        <p>registado com sucesso</p>
        <%}%>

        <%if ("invalid".equals(msg)) {%>
        <p>falha sucesso</p>
        <%}%>


        <section>
            <div class="container">
                <div class="user signinBx">
                    <div class="imgBx"><img src="img/lock.jpg"></div>
                    <div class="formBx">

                        <form action="loginAction.jsp" id="register-form" method="POST">

                            <h2>Inicio da sessao</h2>
                            <input autocomplete="off" name="email" id="email" type="email" placeholder="Insira o E-mail" required data-min-length="3" data-required data-email-validate>
                            <input autocomplete="off" type="password" name="password" id="password" placeholder="Palavra-passe" >
                            <div>              <%

                                if ("notexist".equals(msg)) {

                                %>
                                <small>Email ou senha incorretos</small>
                                <%        }
                                %>

                                <%
                                    if ("invalid".equals(msg)) {
                                %>
                                <small>Alguma coisa deu errado! Tente novamente!</small>
                                <%}%>
                            </div> 
                            <input type ="submit"  value="Entrar" onclick="">

                            <div> <small><a href="forgotPassword.jsp">Esqueceu a palavra passe?</a></small></div>
                            <p class="signup">Nao tens uma conta? Resgista-se <a href="#" onclick="toggleForm();">aqui.</a></p>
                        </form>
                        <p class="error-validation template"></p>
                    </div>
                </div>




                <div class="user signupBx">

                    <div class="formBx">

                        <form id="register-form"  action="signupAction.jsp" method="post">
                            <h2>Criar uma conta </h2>
                            <input type="text" name="name" id="name" placeholder="Introduza o nome" required data-min-length="3" data-required data-email-validate>
                            <input type="email" name="email" id="email" placeholder="Introduza o email" data-min-length="3" data-required data-email-validate required>
                            <input type="number" name="mobilenumber" placeholder="Introduza o numero" required>
                            <select name="securityQuestion" required>
                                <option value="what was your first car?">Qual foi o teu primeiro Carro?</option>
                                <option value="what is the name of your first pet?">Qual é o nome do seu animal de estimação?</option>
                                <option value="what the elementary school did you attended?">Em que escola primária você estudou?</option>
                                <option value="what is the name of the town that where you were born">Qual é o nome da cidade onde você nasceu?</option>
                            </select>
                            <input type="text" name="answer" placeholder="Introduzaa tua resposta" >
                            <input type="password" name="password" id="password" placeholder="Introduza a palavra passe" data-required data-password-validate required>
                           
                            <div class="container text-center" id="loader" style="display: none;">
                                <span class="fa fa-refresh fa-spin fa-4x"></span>
                                <h4>Porfavor aguarde...</h4>
                            </div>

                                 <p class="error-validation template"></p>
                            <input type ="submit"  value="Cadastrar"> 
                            <p class="signup">ja tens uma conta faca o <a href="#" onclick="toggleForm();">login.</a></p>
                        </form>
                       
                    </div> 

                    <div class="imgBx"><img src="img/register.jpg"></div>
                </div>
            </div> 
        </section>

   <%@include file="footer.jsp" %>
                            
 <!--javascripts-->

        <script>
            function toggleForm() {
                section = document.querySelector('section');
                container = document.querySelector('.container');
                container.classList.toggle('active');
                section.classList.toggle('active');
            }
        </script> 

        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            class Validator {
                constructor() {
                    this.Validations = [
                        "data-required",
                        "data-min-length",
                        "data-max-length",
                        "data-email-validate",
                        "data-only-letters",
                        "data-equal",
                        "data-password-validate",
                    ]
                }
                //iniciara a validacao de todos os campos
                validate(form) {

                    //resgata todas as validacoes
                    let currentValidations = document.querySelectorAll('form .error-validation');
                    if (currentValidations.length > 0) {
                        this.cleanValidations(currentValidations);
                    }

                    //pegar os inputs
                    let inputs = form.getElementsByTagName('input');

                    //transformando o HTMLCollection para array
                    let inputArray = [...inputs];

                    //loop nos inpts e validacoes mediante o que foi encontrado
                    inputArray.forEach(function (input) {
                        for (let i = 0; this.Validations.length > i; i++) {
                            //verifica se avalidacao actual existe no input
                            if (input.getAttribute(this.Validations[i]) != null) {

                                //transformar o data-min-length em minlength
                                //limpando a string paara virar um metodo
                                let method = this.Validations[i].replace('data-', '').replace('-', '');
                                //valor do input
                                let value = input.getAttribute(this.Validations[i]);

                                //invocar o metodo
                                this[method](input, value);
                            }
                        }

                    }, this);
                }
                //verifica se um input tem um numero minimo de caracteres
                minlength(input, minvalue) {
                    let inputlength = input.value.length;

                    let errorMessage = 'O campo precisa ter pelo menos ' + minvalue + 'caracteres';
                    if (inputlength < minvalue) {
                        this.printMessage(input, errorMessage);




                    }

                }
                //verifica se o input passou do limite te caracters
                maxlength(input, maxValue) {
                    let inputlength = input.value.length;
                    let errorMessage = 'o campo precisa ter menos que ${maxValue} caracters';

                    if (inputlength > maxValue) {
                        this.printMessage(input, errorMessage);
                    }

                }

                //validacao de email
                emailvalidate(input) {

                    let re = /\S+@\S+\.\S+/;
                    let email = input.value;
                    let errorMessage = 'insira um email no padrao example@gmail.com';
                    if (!re.test(email)) {
                        this.printMessage(input, errorMessage);
                    }

                }

                onlyletters(input) {
                    let re = /^[A-Za-z]+$/;
                    let inputvalue = input.value;
                    let errorMessage = 'Este campo nao aceita numeros e nem caracteres especiais';
                    if (!re.test(inputvalue)) {
                        this.printMessage(input, errorMessage);
                    }
                }

                //imprimindo a mensagem de erro na tela
                printMessage(input, msg) {
                    //quantidade de erros
                    let errorsQty = input.parentNode.querySelector('.error-validation');
                    if (errorsQty === null) {

                        let template = document.querySelector('.error-validation').cloneNode(true);

                        template.textContent = msg;
                        let inputparent = input.parentNode;

                        template.classList.remove('template')

                        inputparent.appendChild(template);
                    }
                }

                //verifica se o input e requerido
                required(input) {
                    let inputValue = input.value;
                    if (inputValue === '') {
                        //  backticks meaning
                        let errorMessage = 'Este campo e obrigatorio';
                        this.printMessage(input, errorMessage);
                    }
                }

                equal(input, inputName) {
                    let inputToCompare = document.getElementsByName(inputName)[0];
                    let errorMessage = 'Palavras passe nao compativeis ${inputName}';
                    if (input.value != inputToCompare.value) {
                        this.printMessage(input, errorMessage);
                    }
                }

                //validacaom da palavra passe
                passwordvalidate(input) {
                    //explodir string em um array
                    let charArr = input.value.split("");
                    let uppercases = 0;
                    let numbers = 0;

                    for (let i = 0; charArr.length > i; i++) {
                        if (charArr[i] === charArr[i].toUpperCase() && isNaN(parseInt(charArr[i]))) {
                            uppercases++;
                        } else if (!isNaN(parseInt(charArr[i]))) {
                            numbers++;
                        }
                    }
                    if (uppercases === 0 || numbers === 0) {
                        let errorMessage = 'A senha precisa de um carater maiusculo e um mumero';
                        this.printMessage(input, errorMessage);
                    }

                }
                //limpa as validacoes da tela
                cleanValidations(validations) {
                    validations.forEach(el => el.remove());
                }
            }



//referenciar o formulario e o evento do botao;
            let form = document.getElementById("register-form");
            let submit = document.getElementById("btn-submit");
            let validator = new Validator();

//evento que dispara as validacoes
            submit.addEventListener('click', function (e) {
                e.preventDefault();
                validator.validate(form);
            });






        </script>

        <!--        <script>
                    $(document).ready(function () {
                        console.log("Carregado...")
        
                        $('#reg-form').on('submit', function (event) {
                            event.preventDefault();
        
        
        
                            let form = new FormData(this);
        
                            $("#sumbimt-btn").hide();
                            $("#loader").show();
                            //enviando o registo para a servlet:
                            $.ajax({
                                url: "signupAction.jsp",
                                type: 'POST',
                                data: form,
                                success: function (data, textStatus, jqXHR) {
                                    console.log(data)
        
                                    $("#sumbimt-btn").show();
                                    $("#loader").hide();
        
                                    if (data.trim() === 'valid')
                                    {
        
                                        swal("Registado com sucesso... vamos te redicionar para o login")
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
                                    swal("Algo correu mal... tente novamente");
        
                                },
                                processData: false,
                                contentType: false
        
                            });
        
        
        
                        });
        
        
                    });
        
        
        
                </script>-->
    </body>
</html>

