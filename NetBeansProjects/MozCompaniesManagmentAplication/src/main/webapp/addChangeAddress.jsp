<%@page import="javax.swing.JOptionPane"%>
<%@ page import="connection.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Adiciona ou Altere o endereco</title>
</head>
<body>
<%String msg=request.getParameter("msg");
if("valid".equals(msg)){  
%>
<h3 class="alert">Endereco actualizado com sucesso!</h3>
<%}%>
<%if("invalid".equals(msg)){  
%>
<h3 class="alert">Algo de errado aconteceu! Tente novamente!</h3>
<%}%>

<%

try {
                Connection con = ConnectionProvider.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from users where email='"+email +"'");
                while (rs.next()) {

%>
<form action="addChangeAddressAction.jsp" method="POST">
<h3>Introduza o Endereco</h3>
<input class="input-style" type="text" name="address" value="<%=rs.getString(7)%>" placeholder="Introduza o novo endereco">
 <hr>
 <h3>Introduza a cidade</h3>
 <input class="input-style" type="text" name="city" value="<%=rs.getString(8)%>" placeholder="Introduza a cidade">

<hr>
<h3>Introduza o estado</h3>
<input class="input-style" type="text" name="state" value="<%=rs.getString(9)%>" placeholder="Introduza o estado">

<hr>
<h3>Introduza o pais</h3>
<input class="input-style" type="text" name="country" value="<%=rs.getString(10)%>" placeholder="Introduza o pais">

<hr>
<button class="button" type="submit">save<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
<%
    }}
catch(Exception e){
JOptionPane.showMessageDialog(null, e);
}%>


</body>
<br><br><br>
</html>