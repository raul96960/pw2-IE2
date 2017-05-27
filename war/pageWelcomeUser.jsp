

<%@ include file="CambiarAspectosnavbar.jsp" %>
<%@ include file="fragmentoparaAccederporsuRol.jsp"%>
<% 
	String imgRolURL="imagenes/img-Roles/"+Utilidades_Metodos.getImagenRol(rolUsuario.getTipo());

	String estadoUser=Utilidades_Metodos.getEstadoRolorUser(usuario.getEstado());
	String estadoRolUser=Utilidades_Metodos.getEstadoRolorUser(rolUsuario.getEstado());;
	String permiso;
	if(!rolUsuario.getEstado() || !usuario.getEstado())
		permiso="disabled";
	else
		permiso="";
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">	
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/estilos.css">
<title>Bienvenido</title>
</head>
<body>
	<!-- Barra de Navegacion -->
			<%@ include file="navbar.jsp" %>
	<!-- Fin de la Barra de navegacion -->
	<div class="container">
		<div class="page-header"><h1>Bienvenido  <b><%=rolUsuario.getNombre() %></b> </h1></div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-offset-3 col-md-6">
				<img src="<%=imgRolURL%>" alt="Imagen del Usuario deacuerdo a su Rol" class="img-responsive">
			</div>
		</div>
		<div class="row">
			<p> <b>Hola: </b> <%=usuario.getNombre() %>  </p> <br>
			<p><b>Tu Email: </b> <%=usuario.getIdEmail() %> </p> <br>
			<p><b>Tu Rol: </b> <%=rolUsuario.getNombre() %> </p> <br>
			<p><b>Tu Estado de Usuario:</b> <%=estadoUser%> </p> <br>
			<p><b>El Estado de tu Rol: </b> <%=estadoRolUser %></p> <br>
		</div>
		<div class="row">
			<div class="col-xs-12 col-md-1 col-md-offset-5">
			
				<%if(rolUsuario.getNombre().equals("Administrador")){ %>
					<a href="pageAdmin" class="btn btn-success">Ingresar</a>
				<%}else{ %>
					<a href="pageUsuarios" class="btn btn-success <%=permiso%>">Ingresar</a>
				<%}%>
			</div>
		</div>
	</div>
	<script src="Jquery/jquery-1.11.1.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>