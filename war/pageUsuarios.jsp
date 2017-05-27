
<%@ include file="CambiarAspectosnavbar.jsp" %>
<%@ include file="fragmentoparaAccederporsuRol.jsp"%>
<%	if(rolUsuario.getTipo()==1)
		response.sendRedirect("pageWelcome.jsp");
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
<title>Pagina en construccion</title>
</head>
<body>
	
	<!-- Barra de Navegacion -->
			<%@ include file="navbar.jsp" %>
	<!-- Fin de la Barra de navegacion -->
	
	<div class="container">
		<div class="row">
			<div class="page-header"><h1>Pagina en progreso</h1></div>
		</div>
		<div class="row">
			<div class="col-md-offset-3 col-md-6">
				<img src="imagenes/img-Auxiliares/pagina-en-construccion.jpg" alt="Imagen de Progreso" class="img-responsive">
			</div>
		</div>
		<div class="row">
			<div class="col-md-5 col-xs-12">
				<h3>Esta pagina se mostrar para los  usuarios con los roles:</h3>
				<ul>
					<li>Director</li>
					<li>Profesor</li>
					<li>Auxiliar</li>
					<li>Apoderado</li>
					<li>Alumno</li>
				</ul>
			</div>
		</div>
		
		
	</div>
</body>
</html>