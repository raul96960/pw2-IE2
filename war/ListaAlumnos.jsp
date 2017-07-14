
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">	
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/estilos.css">
<title>Lista de Alumnos</title>
</head>
<body>
		<%--Llamamos a un fragmento html que es el navbar --%>	
		<%@ include file="navbar.jsp" %>
		<br>
		
		<% List<Rol> roles6=Utilidades_Metodos.getListaRol(6); %>
		<% if(roles6.isEmpty() ){ %>
			<br>
			<div class="container">
				<p> No existen Alumnos, para crear un Alumno. <a href="registrarUsuario.jsp" class="btn btn-primary">Ir Agregar Usuario</a></p>
			</div>
		<%}else{ %>
		<div class="container">
			<div class="page-header"><h2>LISTA DE ALUMNOS</h2></div>
		</div>
		<div class="container">
	 		<form action="/inhabilitarUsuarios" method="POST">
	 			<table class="table table-bordered table-hover table-condensed">
	 			 	<tr class="info">
	 					<th>Nombre</th>
	 					<th>Apellidos</th>
	 					<th>Edad</th>
	 					<th>Email</th>
	 					
	 					<th>Actualizar Notas</th>
	 					
	 				</tr>
	 					<% for(Rol r: roles6 ){
	 						Usuario u2=Utilidades_Metodos.getUser(r.getIdEmail());
	 						 
	 						if(u2==null) %>
	 							<h1> No existe Usuario</h1>
	 						<%else{ 
	 								String estadoRow=(u2.getEstado()?"":"danger");
					 		%>
					 				<tr class="<%=estadoRow%>">
					 					<td><%=u2.getNombre()%></td>
					 					<td><%=u2.getApellidos()%> </td>
					 					<td><%=u2.getEdad() %> </td>
					 					<td><%=u2.getIdEmail() %></td>
						 				<td> <a href="RedirigirServlet?user=<%=u2.getIdEmail()%>">Editar</a></td>
					 				</tr>
					 						<%} %>
	 					 <%} %>
	 					 
	 			</table>
	 			
	 			<div class="row">
	 				<div class="col-md-4 col-offset-md-4">
	 					<input type="submit" class="btn btn-success" value="Guardar Cambios">
	 				</div>
	 			</div>
	 		</form>
		</div>
	  	<%} %>
	  	<%-----------------FIN-------------------------%>
	  	<script src="Jquery/jquery-1.11.1.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>