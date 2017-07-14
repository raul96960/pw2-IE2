
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
		<% if(request.getParameter("success")!=null){ %>
				<script> alert("Se Actualizo los datos de forma exitosa");</script>
		<%}%>
		
		<%---------------   TABLA DE ADMINISTRADORES ------------------------%>
		<% List<Rol> roles1=Utilidades_Metodos.getListaRol(1); %>
		<% if(roles1.isEmpty()){ %>
		<br>
		<div class="container">
				<p> No existen Usuarios, para crear un usuario <a href="registrarUsuario.jsp" class="btn btn-primary">Ir Agregar Usuario</a></p>
		</div>
		<%}else{ %>
		<div class="container">
			<div class="page-header"><h2>Lista de Administradores</h2></div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-2 col-md-offset-9">
					<a href="registrarUsuario.jsp" class="btn btn-primary">Registrar un Usuario</a>
				</div>			
			</div>
	 		<div class="row">
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
	 						
	 						
	 					</tr>
	 						<% for(Rol r:roles1){
	 							Usuario u=Utilidades_Metodos.getUser(r.getIdEmail());
	 						%>
	 					<tr>
	 						<td><%=u.getNombre()%></td>
	 						<td><%=u.getApellidos()%> </td>
	 						<td><%=u.getEdad() %> </td>
	 						<td><%=u.getIdEmail() %></td>
	 						<td><%=r.getNombre()%></td>
	 						
	 						<% String estadoRol=Utilidades_Metodos.getEstadoRolorUser(r.getEstado());%>
	 						<td><%=estadoRol %></td>		
	 							 
	 						<% String estadoUser=Utilidades_Metodos.getEstadoRolorUser(u.getEstado());%>
	 						<td><%=estadoUser%></td>
	 					</tr>	
	 					<%} %>
	 				</table>
	 				
	 			</form>
	 		</div>
		</div>
	  	<%} %>
	  	
	  	<%--   ---------------FIN---------------------- --%>
	  	
	  	<%------------------TABLA DE DIRECTORES ----------------------%>
	  	<% List<Rol> roles2=Utilidades_Metodos.getListaRol(2); %>
		<% if(roles2.isEmpty() ){ %>
			<br>
			<div class="container">
				<p> No existen Usuarios, para crear un usuario <a href="registrarUsuario.jsp" class="btn btn-primary">Ir Agregar Usuario</a></p>
			</div>
		<%}else{ %>
		<div class="container">
			<div class="page-header"><h2>Lista de Directores</h2></div>
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
	 					<th>Borrar Elementos</th>
	 					<th>Editar</th>
	 					
	 				</tr>
	 					<% for(Rol r: roles2 ){
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
					 					<td><%=r.getNombre()%></td>
					 					
					 					<% String estadoRol=Utilidades_Metodos.getEstadoRolorUser(r.getEstado());%>
					 					<td><%=estadoRol %></td>		
					 						 
					 					<% String estadoUser=Utilidades_Metodos.getEstadoRolorUser(u2.getEstado());%>
					 					<td><%=estadoUser%></td>
					 					
					 					
					 					
					 					 <% String textOperacion=Utilidades_Metodos.getEstadoRolorUser(!u2.getEstado());%>
					 					
					 					<td>
						 					<div class="checkbox">
											  <label>
						 						<input type="checkbox" name="idEmailInha" value="<%=u2.getIdEmail()%>"> Cambiar a:  <b><%=textOperacion%></b>
											  </label>
											</div> 
						 				</td>
						 				<td>
						 					<div class="checkbox">
											  <label>
						 						<input type="checkbox" name="idEmailDelete" value="<%=u2.getIdEmail()%>">Seleccionar 
											  </label>
											</div> 
						 				</td>
						 				<td> <a href="RedirigirServlet?user=<%=u2.getIdEmail()%>">Editar</a></td>
					 				
					 				</tr>
					 						<%} %>
	 					 <%}%>
	 					 
	 			</table>
	 			
	 			<div class="row">
	 				<div class="col-md-4 col-offset-md-4">
	 					<input type="submit" class="btn btn-success" value="Guardar Cambios">
	 				</div>
	 				<!--Dos botnes de Inhabilitar y Borrar lista  -->
	 				<!-- 
	 				<div class="col-md-4">
					<a href="borrarLista?tipo=2" class="btn btn-success" value="Borrar Lista">Borrar Lista de Directores </a>
					</div>
					<div class="col-md-4 ">
					<a href="inhabilitarUsuarios?tipo=2" class="btn btn-success" value="Borrar Lista">Inhabilitar Lista de Directores </a>
					</div>
					 -->
	 			</div>
	 		</form>
		</div>
	  	<%} %>
	  	<%-----------------FIN-------------------------%>
	  	
	  	<%------------------TABLA DE PROFESORES ----------------------%>
	  	<% List<Rol> roles3=Utilidades_Metodos.getListaRol(3); %>
		<% if(roles3.isEmpty() ){ %>
			<br>
			<div class="container">
				<p> No existen Usuarios, para crear un usuario <a href="registrarUsuario.jsp" class="btn btn-primary">Ir Agregar Usuario</a></p>
			</div>
		<%}else{ %>
		<div class="container">
			<div class="page-header"><h2>Lista de Profesores</h2></div>
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
	 					<th>Borrar Elementos</th>
	 					<th>Editar</th>
	 					
	 				</tr>
	 					<% for(Rol r: roles3 ){
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
					 					<td><%=r.getNombre()%></td>
					 					
					 					<% String estadoRol=Utilidades_Metodos.getEstadoRolorUser(r.getEstado());%>
					 					<td><%=estadoRol %></td>		
					 						 
					 					<% String estadoUser=Utilidades_Metodos.getEstadoRolorUser(u2.getEstado());%>
					 					<td><%=estadoUser%></td>
					 					
					 					
					 					
					 					 <% String textOperacion=Utilidades_Metodos.getEstadoRolorUser(!u2.getEstado());%>
					 					
					 					<td>
						 					<div class="checkbox">
											  <label>
						 						<input type="checkbox" name="idEmailInha" value="<%=u2.getIdEmail()%>"> Cambiar a:  <b><%=textOperacion%></b>
											  </label>
											</div> 
						 				</td>
						 				<td>
						 					<div class="checkbox">
											  <label>
						 						<input type="checkbox" name="idEmailDelete" value="<%=u2.getIdEmail()%>">Seleccionar 
											  </label>
											</div> 
						 				</td>
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

	  	<%------------------TABLA DE AUXILIARES ----------------------%>
	  	<% List<Rol> roles4=Utilidades_Metodos.getListaRol(4); %>
		<% if(roles4.isEmpty() ){ %>
			<br>
			<div class="container">
				<p> No existen Usuarios, para crear un usuario <a href="registrarUsuario.jsp" class="btn btn-primary">Ir Agregar Usuario</a></p>
			</div>
		<%}else{ %>
		<div class="container">
			<div class="page-header"><h2>Lista de Auxiliares</h2></div>
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
	 					<th>Borrar Elementos</th>
	 					<th>Editar</th>
	 					
	 				</tr>
	 					<% for(Rol r: roles4 ){
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
					 					<td><%=r.getNombre()%></td>
					 					
					 					<% String estadoRol=Utilidades_Metodos.getEstadoRolorUser(r.getEstado());%>
					 					<td><%=estadoRol %></td>		
					 						 
					 					<% String estadoUser=Utilidades_Metodos.getEstadoRolorUser(u2.getEstado());%>
					 					<td><%=estadoUser%></td>
					 					
					 					
					 					
					 					 <% String textOperacion=Utilidades_Metodos.getEstadoRolorUser(!u2.getEstado());%>
					 					
					 					<td>
						 					<div class="checkbox">
											  <label>
						 						<input type="checkbox" name="idEmailInha" value="<%=u2.getIdEmail()%>"> Cambiar a:  <b><%=textOperacion%></b>
											  </label>
											</div> 
						 				</td>
						 				<td>
						 					<div class="checkbox">
											  <label>
						 						<input type="checkbox" name="idEmailDelete" value="<%=u2.getIdEmail()%>">Seleccionar 
											  </label>
											</div> 
						 				</td>
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


		<%------------------TABLA DE APODERADOS ----------------------%>
	  	<% List<Rol> roles5=Utilidades_Metodos.getListaRol(5); %>
		<% if(roles5.isEmpty() ){ %>
			<br>
			<div class="container">
				<p> No existen Usuarios, para crear un usuario <a href="registrarUsuario.jsp" class="btn btn-primary">Ir Agregar Usuario</a></p>
			</div>
		<%}else{ %>
		<div class="container">
			<div class="page-header"><h2>Lista de Apoderados</h2></div>
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
	 					<th>Borrar Elementos</th>
	 					<th>Editar</th>
	 					
	 				</tr>
	 					<% for(Rol r: roles5 ){
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
					 					<td><%=r.getNombre()%></td>
					 					
					 					<% String estadoRol=Utilidades_Metodos.getEstadoRolorUser(r.getEstado());%>
					 					<td><%=estadoRol %></td>		
					 						 
					 					<% String estadoUser=Utilidades_Metodos.getEstadoRolorUser(u2.getEstado());%>
					 					<td><%=estadoUser%></td>
					 					
					 					
					 					
					 					 <% String textOperacion=Utilidades_Metodos.getEstadoRolorUser(!u2.getEstado());%>
					 					
					 					<td>
						 					<div class="checkbox">
											  <label>
						 						<input type="checkbox" name="idEmailInha" value="<%=u2.getIdEmail()%>"> Cambiar a:  <b><%=textOperacion%></b>
											  </label>
											</div> 
						 				</td>
						 				<td>
						 					<div class="checkbox">
											  <label>
						 						<input type="checkbox" name="idEmailDelete" value="<%=u2.getIdEmail()%>">Seleccionar 
											  </label>
											</div> 
						 				</td>
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

	  	<%------------------TABLA DE ALUMNOS ----------------------%>
	  	<% List<Rol> roles6=Utilidades_Metodos.getListaRol(6); %>
		<% if(roles6.isEmpty() ){ %>
			<br>
			<div class="container">
				<p> No existen Usuarios, para crear un usuario <a href="registrarUsuario.jsp" class="btn btn-primary">Ir Agregar Usuario</a></p>
			</div>
		<%}else{ %>
		<div class="container">
			<div class="page-header"><h2>Lista de Alumnos</h2></div>
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
	 					<th>Borrar Elementos</th>
	 					<th>Editar</th>
	 					
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
					 					<td><%=r.getNombre()%></td>
					 					
					 					<% String estadoRol=Utilidades_Metodos.getEstadoRolorUser(r.getEstado());%>
					 					<td><%=estadoRol %></td>		
					 						 
					 					<% String estadoUser=Utilidades_Metodos.getEstadoRolorUser(u2.getEstado());%>
					 					<td><%=estadoUser%></td>
					 					
					 					
					 					
					 					 <% String textOperacion=Utilidades_Metodos.getEstadoRolorUser(!u2.getEstado());%>
					 					
					 					<td>
						 					<div class="checkbox">
											  <label>
						 						<input type="checkbox" name="idEmailInha" value="<%=u2.getIdEmail()%>"> Cambiar a:  <b><%=textOperacion%></b>
											  </label>
											</div> 
						 				</td>
						 				<td>
						 					<div class="checkbox">
											  <label>
						 						<input type="checkbox" name="idEmailDelete" value="<%=u2.getIdEmail()%>">Seleccionar 
											  </label>
											</div> 
						 				</td>
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