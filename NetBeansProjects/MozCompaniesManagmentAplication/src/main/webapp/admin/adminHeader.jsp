<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="../css/home-style.css">
        <link rel="icon" href="img/const.png">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>

    <!--css-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" href="css/homepage.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .banner-background{
            clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
        }

        body{
            background:url(../img/bg.jpeg);
            background-size: cover;
            background-attachment: fixed;
        }


    </style>
</head>
<body>
    <!--navbar--> 

    <nav class="navbar navbar-expand-lg navbar-dark primary-background" style="background:  #3D5AFE";>
        <%String email = session.getAttribute("email").toString();%>
        <a class="navbar-brand" href=""> <span class="fa fa-asterisk"></span>   MMSystem</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="addNewProduct.jsp"> <span class="	fa fa-bell-o"></span> Adiciona um produto<span class="sr-only">(current)</span></a>
                </li>



                <li class="nav-item">
                    <a class="nav-link" href="allProductEditProduct.jsp"> <span class="	fa fa-address-card-o"></span> Ver & alterar produtos </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="messagesReceived.jsp" data-toggle="modal" data-target="#add-post-modal" > <span class="fa fa-asterisk"></span> Mensages Recebidas</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="ordersReceived.jsp"> <span class="	fa fa-address-card-o"></span> Pedidos Recebidos </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="cancelOrders.jsp"> <span class="	fa fa-address-card-o"></span> Pedidos cancelados</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="deliveredOrders.jsp"> <span class="	fa fa-address-card-o"></span> Pedidos entregues </a>
               

            </ul>

            <ul class="navbar-nav mr-right">
                <li class="nav-item">
                    <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"> <span class="fa fa-user-circle "></span> <%out.print(email);%> </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="../logout.jsp"> <span class="fa fa-user-plus "></span> Sair</a>
                </li>
            </ul>
        </div>
    </nav>