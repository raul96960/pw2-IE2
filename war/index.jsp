<%@ include file="CambiarAspectosnavbar.jsp" %>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">	
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/estilos.css">
	<title>Inicio</title>
</head>
<body>
		<!-- Barra de Navegacion -->
			<%@ include file="navbar.jsp" %>
		<!-- Fin de la Barra de navegacion -->

		<!-- Jumbotrom que contines el titulo -->
		
			<section class="jumbotron" style="margin-bottom: 15px;">
				<div class="container">
					<h1>I.E JOSE ANTONIO ENCINAS</h1>
				</div>
			</section>
		
		<!-- Fin del jumbotron -->
		
		<!-- Cuerpo de la pagina principal -->
		<div class="container main">
			<div class="row">

			<!-- Carousel con imagenes de la I.E JOSE ANTONIO ENCINAS -->
				<div class="col-md-8 col-xs-12">
					<div id="miSlide" class="carousel slide" data-ride="carousel">
						  			<!-- Indicators -->
						  <ol class="carousel-indicators">
						    <li data-target="#miSlide" data-slide-to="0" class="active"></li>
						    <li data-target="#miSlide" data-slide-to="1"></li>
						    <li data-target="#miSlide" data-slide-to="2"></li>
						  </ol>
					
						  <!-- Wrapper for slides -->
						  <div class="carousel-inner" role="listbox">
						    <div class="item active">
						      <img src="imagenes/entrada-de-colegio.jpg" alt="Entrada de la I.E JOSE ANTONIO ENCINAS" style=" height: 400px; width: 900px;">
							      <div class="carousel-caption">
							        <h4>Entrada de la I.E Jose Antonio Encinas</h4>
							        
							      </div>
						    </div>
						    <div class="item">
						      <img src="imagenes/img-dentro-del-colegio.jpg" alt="Interior del Colegio" style=" height: 400px; width: 900px;">
						      <div class="carousel-caption">
						        <h4>Interiores de la I.E JOSE ANTONIO ENCINAS</h4>
						      </div>
						    </div>
						    <div class="item">
						      <img src="imagenes/escudo-de-IE.jpg" alt="El escudo" style=" height: 400px; width: 900px;">
						      <div class="carousel-caption">
						        <h4>Escudo de la I.E JOSE ANTONIO ENCINAS</h4>
						      </div>
						    </div>
						  </div>
					
						  <!-- Controls -->
						  <a class="left carousel-control" href="#miSlide" role="button" data-slide="prev">
						    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						    <span class="sr-only">Previous</span>
						  </a>
						  <a class="right carousel-control" href="#miSlide" role="button" data-slide="next">
						    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						    <span class="sr-only">Next</span>
						  </a>
					</div>
				</div>
				<div class="col-md-4 col-xs-12">
					<ul class="list-group">
						<a href="#" class="list-group-item active" style="text-align: center;">Menu</a>
						<a href="#" class="list-group-item">Servicios</a>
						<a href="nosotros.jsp" class="list-group-item">Nosotros</a>
						<a href="mision_y_vision.jsp" class="list-group-item">Mision y Vision</a>
						<a href="organigrama.jsp" class="list-group-item">Organigrama</a>
						<!-- <a href="" class="list-group-item">Registrarse</a> -->
					</ul>
				</div>
			</div>

			<div class="row" style="margin-top: 30px; ">
				<div class="col-md-3 col-xs-12" style="text-align: center;">
					<a href="https://www.facebook.com/joseantonio.encinas.7543?lst=100002654682163%3A100006454090168%3A1494621311">		<img src="imagenes/F_icon.svg_-100x100.png" alt="facebook">
					</a>
					<a href="https://www.facebook.com/joseantonio.encinas.7543?lst=100002654682163%3A100006454090168%3A1494621311">		<p class="text-info">Sitio oficial en facebook</p>
					</a>
				</div>
				<div class="col-md-3 col-xs-12" style="text-align: center;">
					<img src="imagenes/T_icon.png" alt="Tuitter">
					<p class="text-info">Nuestra pagina Oficial en Twitter</p>
				</div>
				<div class="col-md-3 col-xs-12" style="text-align: center;">
					<img src="imagenes/youtube_PNG9-100x100.png" alt="youtube">
					<p class="text-info">Aqui nuestros contenido en Audio y Video.</p>
				</div>
				<div class="col-md-2 col-xs-12" style="text-align: center;">
					<img src="imagenes/oJO-OJO-100x100.jpg" alt="Studio One">
					<p class="text-info">Sitio de Studio One Aquí se emitirá los programas juveniles</p>
				</div>
			</div>
		</div>
		<!-- Fin del cuerpo principal -->
	
	<script src="Jquery/jquery-1.11.1.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>