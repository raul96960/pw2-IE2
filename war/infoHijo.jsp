
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">	
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/estilos.css">
<title>Informacion</title>
</head>
<body>
		<%--Llamamos a un fragmento html que es el navbar --%>	
		<%@ include file="navbar.jsp" %>
		<br>
		<% Usuario u2=(Usuario)my_session.getAttribute("Hijo");%>
		
		<div class="container">
			<div class="page-header"><h2>INFORMACION DE ALUMNO</h2></div>
		</div>
		<div class="container">
	 			<table class="table table-bordered table-hover table-condensed">
	 			 	<tr class="info">
	 					<th>Nombre</th>
	 					<th>Apellidos</th>
	 					<th>Edad</th>
	 					<th>Email</th>
	 					<th>Nota-1</th>
	 					<th>Nota-2</th>
	 					<th>Nota-3</th>
	 				</tr>
					<tr>
						<td><%=u2.getNombre()%></td>
						<td><%=u2.getApellidos()%> </td>
						<td><%=u2.getEdad() %> </td>
						<td><%=u2.getIdEmail() %></td>
						<td><%=u2.getNota1()%></td>
						<td><%=u2.getNota2()%></td>
						<td><%=u2.getNota3()%></td>
					</tr>
	 	</table>
		</div>
	  	<%-----------------FIN-------------------------%>
	  	<script src="Jquery/jquery-1.11.1.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>