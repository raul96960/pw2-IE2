
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Contactenos</title>
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<link rel="stylesheet" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" href="css/estilos.css">
</head>
<body>

	<%--Llamamos a un fragmento html que es el navbar --%>	
		<%@ include file="navbar.jsp" %>
	<br>

	<div class="container">
		<div class="page-header">
			<h2>Contactenos</h2>
		</div>

		<form class="form-horizontal">
			<div class="form-group">
				<label class="control-label col-md-offset-2 col-md-2" >Nombre:</label>
				<div class="col-md-6"> 
					<input type="text" class="form-control" placeholder="Nombre">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-md-offset-2 col-md-2 "  >Apellidos:</label>
				<div class="col-md-6"> 
					<input type="text" class="form-control" placeholder="Apellido">
				</div>
			</div>
			<div class="form-group">
				<label  class="control-label col-md-offset-2 col-md-2 " >Email:</label>
				<div class="col-md-6"> 
					<input type="text" class="form-control" placeholder="Edad">
				</div>
			</div>
			<div class="form-group ">
				<div class="checkbox col-md-2 col-md-offset-4">
					<label >
						<input type="checkbox" name="" id="">Recuerdame
					</label>
				</div>
			</div>
			<div class="form-group  ">
				<div class="col-md-2 col-md-offset-4">
					<button class="btn btn-primary">Enviar</button>
				</div>
			</div>
		</form>	
	</div>
	<script src="Jquery/jquery-1.11.1.js"></script>
	<script src="js/bootstrap.min.js"></script>	
</body>
</html>