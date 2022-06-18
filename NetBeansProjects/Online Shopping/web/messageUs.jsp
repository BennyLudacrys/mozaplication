<%@ page import="connection.ConnectionProvider"%>
<%@page import="java.sql.*" %>

<%@include  file="header.jsp"%>
<%@include  file="footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="css/messageUs.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Envie-nos uma mensagem</title>
</head>
<body>
    
<div style="color: white; text-align: center; font-size: 30px;">Envie-nos uma mensagem <i class='fas fa-comment-alt'></i></div>
<%String msg=request.getParameter("msg");
if("valid".equals(msg)){  
%>
<h3 style="text-align:center; color:yellow;">Mensagem enviada com sucesso. Nossa equipe entrará em contato em breve!</h3>
<%}%>
<%
if("invalid".equals(msg)){  
%>
<h3 style="text-align:center; ">Alguma coisa deu errado! Tente novamente!</h3>
<%}%>
<form action="messageUsAction.jsp" method="post">
    <input class="input-style" name="subject" type="text" placeholder="subject" requires> 
    <hr> 
    <textarea class="input-style" name="body" placeholder="escreva a tua mensagem" required></textarea>
    <hr>
    <button class="button" type="submit"> Enviar<i class="far fa-arrow-alt-circle-right"></i></button>
</form>

<br><br><br>
</body>
</html>