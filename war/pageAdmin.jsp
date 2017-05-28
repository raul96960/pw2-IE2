
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">	
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/estilos.css">
<title>Pagina del Administrador</title>
</head>
<body>
		<!-- Barra de Navegacion -->
			<%@ include file="navbar.jsp" %>
		<!-- Fin de la Barra de navegacion -->
		<%	// se Verifica si no es Administrador
			if(rolUsuario.getTipo()!=1)
			  response.sendRedirect("index.jsp");
		%>
		<% List<Usuario> usuarios=Utilidades_Metodos.getListaUsuarios(); %>
		<% if(usuarios.isEmpty()){ %>
			<br>
			<p> No existen Usuarios, para crear un usuario <a href="registrarUsuario.jsp">Ir Agregar Usuario</a></p>
		<%}else{ %>
		<div class="container">
			<div class="page-header"><h2>Lista de Usuarios</h2></div>
		</div>
		<div class="container">
	 		<form action="/inhabilitarUsuarios" method="POST">
	 			<table class="table table-bordered table-hover table-condensed">
	 			 	<tr class="info">
	 					<th>Nombre</th>
	 					<th>Apellidos</th>
	 					<th>Edad</th>
	 					<th>Email</th>
	 					<th>Rol</th>
	 					
	 					<th>Estado de Rol</th>
	 					<th>Estado de Usuario </th>
	 					<th>Habilitar o Inhabilitar Usuario</th>
	 				</tr>
	 					<% for(Usuario u:usuarios){
	 						String estadoRow=(u.getEstado()?"":"danger");
	 						Rol rolUser=Utilidades_Metodos.getRol(u.getIdEmail());
	 						// Condicion para que solo muestre a usarios que no sean de tipo Administrador 	
	 						if(rolUser.getTipo()==1) 
	 								continue;
	 					%>
	 				<tr class="<%=estadoRow%>">
	 					<td><%=u.getNombre()%></td>
	 					<td><%=u.getApellidos()%> </td>
	 					<td><%=u.getEdad() %> </td>
	 					<td><%=u.getIdEmail() %></td>
	 					<td><%=rolUser.getNombre()%></td>
	 					
	 					<% String estadoRol=Utilidades_Metodos.getEstadoRolorUser(rolUser.getEstado());%>
	 					<td><%=estadoRol %></td>		
	 						 
	 					<% String estadoUser=Utilidades_Metodos.getEstadoRolorUser(u.getEstado());%>
	 					<td><%=estadoUser%></td>
	 						
	 					 <% String textOperacion=Utilidades_Metodos.getEstadoRolorUser(!u.getEstado());%>
	 					<td>
		 					<div class="checkbox">
							  <label>
		 						<input type="checkbox" name="idEmail" value="<%=u.getIdEmail()%>"> Cambiar a:  <b><%=textOperacion%></b>
							  </label>
							</div> 
		 				</td>
	 				</tr>	
	 					 <%} %>
	 			</table>
	 			<div class="row">
	 				<div class="col-md-4 col-md-offset-4">
	 					<input type="submit" class="btn btn-success" value="Guardar Cambios">
	 				</div>
	 			</div>
	 		</form>
		</div>
	  	<%} %>
</body>
</html>