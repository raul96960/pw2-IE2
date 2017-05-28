

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!	String errorTextFomatoEdad="Se ingreso un formato no permitido"; 
	String errorTextRangoEdad="Se ingreso una edad no permitidad"; 
	String errorTextUsuario="Ya existe un usuario con este Gmail"; 
	String errorBootstrapEdad="";
	String errorBootstrapUser="";
   	boolean usuarioExiste;%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registro</title>
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
			<h2>Formulario de Registro</h2>
		</div>

		<form action="/addUser" class="form-horizontal" method="POST">
			<div class="form-group">
				<label class="control-label col-md-offset-2 col-md-2" >Nombre:</label>
				<div class="col-md-6"> 
				<%String nombre=(request.getParameter("nombre")==null)? "":request.getParameter("nombre"); %>
					<input type="text" class="form-control" name="nombre" required placeholder="Nombre" value="<%=nombre%>" >
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-md-offset-2 col-md-2 "  >Apellidos:</label>
				<div class="col-md-6"> 
					<%String apellidos=(request.getParameter("apellidos")==null)? "":request.getParameter("apellidos"); %>
					<input type="text" class="form-control" name="apellidos" required placeholder="Apellido" value="<%=apellidos%>">
				</div>
			</div>
			<% if(request.getAttribute("errorEdad")!=null){
				 errorBootstrapEdad="has-error"; 
			}else errorBootstrapEdad="";%>
			<div class="form-group <%=errorBootstrapEdad%>">	
				<label class="control-label col-md-offset-2 col-md-2 "  >Edad:</label>
				<div class="col-md-6"> 
					<%String edad=(request.getParameter("edad")==null)? "":request.getParameter("edad"); %> 
					<input type="text" class="form-control" name="edad" required placeholder="Edad" value="<%=edad%>">
					
					<%--Muestra un texto para informa que tipo de errorEdad es. --%>					
					<%if(request.getAttribute("errorFormatoEdad")!=null){ %>
						<p class="help-block"><%=errorTextFomatoEdad%></p>
					<%}else if(request.getAttribute("errorRangoEdad")!=null){%>
						<p class="help-block"><%=errorTextRangoEdad%></p>
					<%} %>
				</div>
			</div>
			<% if(request.getAttribute("estaUsuario")!=null){
					 errorBootstrapUser="has-error";
					 usuarioExiste=true;
			}else {
					errorBootstrapUser="";
					 usuarioExiste=false;		
			}%>
			<div class="form-group <%=errorBootstrapUser%>">
				<label  class="control-label col-md-offset-2 col-md-2 " >Email:</label>
				<div class="col-md-6"> 
					<%String email=(request.getParameter("email")==null)? "":request.getParameter("email"); %>
					<input type="text" class="form-control" name="email" required placeholder="Email" value="<%=email%>">
					
					<%--Texto que informa que ya existe un usuario con este email --%>
					<%if(usuarioExiste){ %>
						<p class="help-block"><%=errorTextUsuario%></p>
					<%}%>
					
				</div>
			</div>
			<div class="form-group">
				<label  class="control-label col-md-offset-2 col-md-2 " >Rol:</label>
				<div class="col-md-6"> 
					<select class="form-control" name="rol" >
						
						<option value="Director">Director</option>
						<option value="Profesor">Profesor</option>
						<option value="Auxiliar">Auxiliar</option>
						<option value="Apoderado">Apoderado</option>
						<option value="Alumno">Alumno</option>
					</select>
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