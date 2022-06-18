<%@page import="javax.swing.JOptionPane"%>
<%@ page import="connection.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>
<%String msg=request.getParameter("msg");
if("notMatch".equals(msg)){  
%>
<h3 class="alert">A nova palavra passe e a confirmacao da mesma nao combinam!</h3>
<%}%>
<%if("wrong".equals(msg)){%>
<h3 class="alert">A antiga palavra-passe esta errada!</h3>
<%}%>
<%if("done".equals(msg)){%>
<h3 class="alert">Palavra-passe alterada com sucesso!</h3>
<%}%>
<%if("invalid".equals(msg)){%>
<h3 class="alert">Algo de errado aconteceu! Tente novamente!</h3>
<%}%>

<form action="changePasswordAction.jsp" method="POST">
<h3>Introduza a senha antiga</h3>
<input type="text" name="oldPassword" class="input-style" paceholder="Introduza a senha antiga">
  <hr>
 <h3>Introduza a nova senha</h3>
 <input type="password" name="newPassword" class="input-style" paceholder="Introduza a nova senha">
 
 <hr>
<h3>Confirme a senha</h3>
<input type="password" name="confirmPassword" class="input-style" paceholder="Confirme a senha">

<hr>
<button class="button" type="submit"> Gravar alteracoes <i class='far fa-arrow-alt-circle-right'></i> </button>
</form>
</body>
<br><br><br>
</html>