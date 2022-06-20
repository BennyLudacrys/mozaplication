<%@page import="javax.swing.JOptionPane"%>
<%@ page import="connection.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Mudar a pergunta de seguranca</title>
</head>
<body>

 <%String msg=request.getParameter("msg");
if("done".equals(msg)){  

%>
<h3 class="alert">A questao de seguranca foi alterada com sucesso !</h3>
<%}%>
<%if("wrong".equals(msg)){ %>
<h3 class="alert">Palavra passe errada!</h3>
<%}%>
<form action="changeSecurityQuestionAction.jsp" method="POST">
<h3>Selecione a questao de seguranca</h3>
<select class="input-style" name="securityQuestion">
    <option value="Qual foi o teu primeiro Carro?">Qual foi o teu primeiro Carro?</option>
    <option value="Qual é o nome do seu primeiro animal de estimação?">Qual é o nome do seu primeiro animal de estimação?</option>
    <option value="Em que escola primária você estudou?">Em que escola primária você estudou?</option>
    <option value="Qual é o nome da cidade onde você nasceu?">Qual é o nome da cidade onde você nasceu?</option>
</select>
 <hr>
 <h3>Digite sua nova resposta</h3>
 <input class="input-style" type="text" name="newAnswer" placeholder="Digite sua nova resposta" required>
<hr>
<h3>Digite a senha (por segurança)</h3>
<input class="input-style" type="password" name="password" placeholder="Digite a senha " required>

<hr>
<button class="button" type="submit"> Guardar alteracoes<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>