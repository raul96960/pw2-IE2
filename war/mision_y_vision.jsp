
<%@ include file="CambiarAspectosnavbar.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<link rel="stylesheet" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" href="css/estilos.css">
<title>Mision y Vision</title>
</head>
<body>
	<%--Llamamos a un fragmento html que es el navbar --%>	
		<%@ include file="navbar.jsp" %>

		<div class="container">
			<div class="page-header">
				<h1>Estima do Padre de familia</h1>
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<p>Nuestra I.E desea brindar una buena calidad de estudio y para lograrlo nos planteamos lo siguiente:</p>
				</div>
				<br><br><br>
				<div class="col-md-6">
					<h2 class="titular">Nuestra Mision</h2>
					<hr>
					<p>
					Educar y formar con disciplina y exigencia académica a los estudiantes para que actúen con ética y asertivamente ante los desafios del mundo actual, mediante propuestas pedagógicas innovadoras y de calidad, que permitan el desarrollo de competencias y actitudes conducentes al éxito.
					</p>
				</div>
				<div class="col-md-6">
					<h2 class="titular">Nuestra Visión</h2>
					<hr>
					<p>
						Ser una institución lider a nivel nacional, con los más exigentes estándares de calidad, innovadora, emprendedora, orientada a desarrollar la calidad educativa y la equidad, brindando a los estudiantes una educación integral con valores cristianos, vocación de servicio, que sean críticos, ecoeficientes, creativos, responsables, solidarios e impulsores del desarrollo sostenible del pais.
					</p>
				</div>
			</div>

		</div>	
		<script src="Jquery/jquery-1.11.1.js"></script>
		<script src="js/bootstrap.min.js"></script>
</body>
</html>