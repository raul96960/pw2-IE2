
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">	
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/estilos.css">
<title>Lista</title>
</head>
<body>
		<%--Llamamos a un fragmento html que es el navbar --%>	
		<%@ include file="navbar.jsp" %>
		<br>
		
		<% List<Usuario> lista=(List<Usuario>)my_session.getAttribute("Lista");%>
		<% if(lista==null){ %>
			<br>
			<div class="container">
				<div class="alert alert-danger">
					<h1>Error Al Obtener la Lista</h1>
				</div>
			</div>	
				
		<%}else if(lista.isEmpty()){ %>
			<br>
			<div class="container">
				<p> No existen Alumnos con estas descripciones <a href="index.jsp" class="btn btn-primary">Regresar</a></p>
			</div>
			
		<%}else{ %>
		<div class="container">
			<div class="page-header"><h2>LISTA DE RESULTADOS</h2></div>
		</div>
		<div class="container">
	 			<table class="table table-bordered table-hover table-condensed">
	 			 	<tr class="info">
	 					<th>Nombre</th>
	 					<th>Apellidos</th>
	 					<th>Edad</th>
	 					<th>Email</th>
	 					
	 					<th>Ver Información</th>
	 					
	 				</tr>
	 					<% for(Usuario u2: lista ){%>
	 						
	 						<% Rol rol=Utilidades_Metodos.getRol(u2.getIdEmail());
	 							if(rol.getTipo()==6){%>
					 			<tr>
					 				<td><%=u2.getNombre()%></td>
					 				<td><%=u2.getApellidos()%> </td>
					 				<td><%=u2.getEdad() %> </td>
					 				<td><%=u2.getIdEmail() %></td>
						 			<td> <a href="GetHijo?user=<%=u2.getIdEmail()%>">Ir a Ver</a></td>
					 			</tr>
					 			<%} %>
	 					 <%} %>
	 					 
	 			</table>
		</div>
	  	<%} %>
	  	<%-----------------FIN-------------------------%>
	  	<script src="Jquery/jquery-1.11.1.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>