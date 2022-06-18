<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" href="css/homepage.css">
        <link rel="icon" href="img/const.png">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }

            body{
                background:url(img/bg.jpeg);
                background-size: cover;
                background-attachment: fixed;
            }


        </style>
</head>
<!--    Header
    <br>
    <div class="topnav sticky">
    <%String email= session.getAttribute("email").toString();%>
            <center><h2>Online shopping (BTech Days)</h2></center>
            <h2><a href=""><%//out.print(email);%> <i class='fas fa-user-alt'></i></a></h2>
            <a href="home.jsp">Home<i class="fa fa-institution"></i></a>
            <a href="myCart.jsp">Minha carrinha<i class='fas fa-cart-arrow-down'></i></a>
            <a href="myOrders.jsp">Meus pedidos  <i class='fab fa-elementor'></i></a>
            <a href="changeDetails.jsp">Mudar detalhes <i class="fa fa-edit"></i></a>
            <a href="messageUs.jsp">Contacte-nos <i class='fas fa-comment-alt'></i></a>
            <a href="about.jsp">acerca de nos <i class="fa fa-address-book"></i></a>
            <a href="logout.jsp">Logout <i class='fas fa-share-square'></i></a>
            <div class="search-container">
                <form action="searchHome.jsp" method="post">
                    <input type="text" placeholder="search" name="search"> 
                    <button type="submit"<i class="fa fa-search"></button>
                </form>

            </div>
          </div>
           <br>-->
           <!--table-->
           
           
                   <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="home.jsp"> <span class="fa fa-asterisk"></span>   MCM</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="home.jsp"> <span class="	fa fa-bell-o"></span> Pagina inicial<span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="myCart.jsp"> <span class="	fa fa-address-card-o"></span> Minha carrinha</a>
                    </li>
                    
                     <li class="nav-item">
                        <a class="nav-link" href="myOrders.jsp"> <span class="	fa fa-address-card-o"></span> Meus pedidos </a>
                    </li>
                  
                     <li class="nav-item">
                        <a class="nav-link" href="messageUs.jsp"> <span class="	fa fa-address-card-o"></span> fale conosco</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="about.jsp" data-toggle="modal" data-target="#add-post-modal" > <span class="	fa fa-asterisk"></span> acerca de nos</a>
                    </li>



                </ul>

                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <form action="searchHome.jsp" method="post">
                    <input type="text" placeholder="search" name="search"> 
                    <button type="submit"<i class="fa fa-search"></button>
                </form>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="changeDetails.jsp" data-toggle="modal" data-target="#profile-modal"> <span class="fa fa-user-circle "></span><%out.print(email);%>  </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="logout.jsp"> <span class="fa fa-user-plus "></span> Sair</a>
                    </li>
                </ul>
            </div>
        </nav>
