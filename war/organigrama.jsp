
<%@ include file="CambiarAspectosnavbar.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Organigrama</title>
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<link rel="stylesheet" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
		<%--Llamamos a un fragmento html que es el navbar --%>	
		<%@ include file="navbar.jsp" %>

		
		<div class="container">
			<div class="page-header"><h2>Organigrama</h2></div>
			<div class="row">
				<div class="col-xs-12 col-md-10 col-md-offset-2">
					<img src="imagenes/organigrama2.jpg" class="img-responsive" alt="Organigrama de la I.E">
				</div>				
			</div>
		</div>
		<script src="Jquery/jquery-1.11.1.js"></script>
		<script src="js/bootstrap.min.js"></script>
</body>
</html>