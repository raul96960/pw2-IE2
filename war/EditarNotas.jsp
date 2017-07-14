<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!	String errorTextFomatoNota="Se ingreso un formato no permitido"; 
	String errorTextRangoNota="Se ingreso una Nota no permitidad"; 
	
	String errorBootstrapNota="";
   	%>    
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
	
	<% Usuario userEdit=(Usuario)request.getAttribute("user"); %>

	<div class="container">
		<div class="page-header">
			<h2>Formulario de Actualizacion</h2>
		</div>

		<form action="/ActualizarNotas2" class="form-horizontal" method="POST">
			<!--------------------- NOTA1---------- -->
			<% if(request.getAttribute("errorNota")!=null){
				 errorBootstrapNota="has-error"; 
			}else errorBootstrapNota="";%>
			<div class="form-group <%=errorBootstrapNota%>">	
				<label class="control-label col-md-offset-2 col-md-2 "  >NOTA-3:</label>
				<div class="col-md-6"> 
					<%String nota1=(request.getParameter("nota1")==null)?""+userEdit.getNota1():request.getParameter("nota1");%>
					<input type="text" class="form-control" name="nota1" required placeholder="Nota1" value="<%=nota1%>">
					
					<%--Muestra un texto para informa que tipo de errorEdad es. --%>					
					<%if(request.getAttribute("errorFormatoNota")!=null){ %>
						<p class="help-block"><%=errorTextFomatoNota%></p>
					<%}else if(request.getAttribute("errorRangoNota")!=null){%>
						<p class="help-block"><%=errorTextRangoNota%></p>
					<%} %>
				</div>
				
			</div>


			<!--------------------- NOTA2---------- -->
			<% if(request.getAttribute("errorNota")!=null){
				 errorBootstrapNota="has-error"; 
			}else errorBootstrapNota="";%>
			<div class="form-group <%=errorBootstrapNota%>">	
				<label class="control-label col-md-offset-2 col-md-2 "  >NOTA-3:</label>
				<div class="col-md-6"> 
					<%String nota2=(request.getParameter("nota2")==null)?""+userEdit.getNota2():request.getParameter("nota2");%>
					<input type="text" class="form-control" name="nota2" required placeholder="Nota2" value="<%=nota2%>">
					
					<%--Muestra un texto para informa que tipo de errorEdad es. --%>					
					<%if(request.getAttribute("errorFormatoNota")!=null){ %>
						<p class="help-block"><%=errorTextFomatoNota%></p>
					<%}else if(request.getAttribute("errorRangoNota")!=null){%>
						<p class="help-block"><%=errorTextRangoNota%></p>
					<%} %>
				</div>
				
			</div>

			<!--------------------- NOTA3---------- -->
			<% if(request.getAttribute("errorNota")!=null){
				 errorBootstrapNota="has-error"; 
			}else errorBootstrapNota="";%>
			<div class="form-group <%=errorBootstrapNota%>">	
				<label class="control-label col-md-offset-2 col-md-2 "  >NOTA-3:</label>
				<div class="col-md-6"> 
					<%String nota3=(request.getParameter("nota3")==null)?""+userEdit.getNota3():request.getParameter("nota3");%>
					<input type="text" class="form-control" name="nota3" required placeholder="Nota3" value="<%=nota3%>">
					
					<%--Muestra un texto para informa que tipo de errorEdad es. --%>					
					<%if(request.getAttribute("errorFormatoNota")!=null){ %>
						<p class="help-block"><%=errorTextFomatoNota%></p>
					<%}else if(request.getAttribute("errorRangoNota")!=null){%>
						<p class="help-block"><%=errorTextRangoNota%></p>
					<%} %>
				</div>
			<input type="hidden" name="id" value="<%=userEdit.getIdEmail()%>">
			</div>
				
			<div class="form-group  ">
				<div class="col-md-2 col-md-offset-4">
					<button class="btn btn-primary">Actualizar</button>
				</div>
			</div>
		</form>	
	</div>
	<script src="Jquery/jquery-1.11.1.js"></script>
	<script src="js/bootstrap.min.js"></script>	
</body>
</html>