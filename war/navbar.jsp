	<%@ include file="CambiarAspectosnavbar.jsp"%>
	
	<%--				/\
						 |
						 |
			<%@ page import="pw2.*,java.util.List" %>
			<%! String sessionServletURL;%>
			<%! String textoBoton; %>
			<%! boolean inicioSession; %>
			<% HttpSession my_session=request.getSession();
				Usuario usuario=(Usuario)my_session.getAttribute("user");
				Rol rolUsuario=(Rol)my_session.getAttribute("rol");
					
				if(usuario==null){
					sessionServletURL="/iniciarSession";
					textoBoton="Iniciar Session";
					inicioSession=false;
				}else{
					sessionServletURL="/cerrarSession";
					textoBoton="Cerrar Session";
					inicioSession=true;
				}
				//Falta implementar la seguridad es decir los permisos si inicio la session
			%>
				
	 --%>
			<header>
				<nav class="navbar navbar-inverse navbar-fixed-top">
					<div class="container">
						<div class="navbar-header">
									<button class="navbar-toggle collapsed" data-target="#menu-E" data-toggle="collapse">
										<span class="sr-only">Mostrar/Ocultar</span>
										<span class="icon-bar"></span>
										<span class="icon-bar"></span>
										<span class="icon-bar"></span>
									</button>
									<a href="index.html" class="navbar-brand">I.E JOSE ANTONIO ENCINAS</a>
						</div>
						<div class="collapse navbar-collapse" id="menu-E">
								
							<a href="<%=sessionServletURL%>" class="btn btn-primary navbar-btn ">
								<%=textoBoton%> <span class="glyphicon glyphicon-user"></span>
							</a>
							<% if(!inicioSession){%>
								<a href="registrarUsuario.jsp" class="btn btn-default navbar-btn ">
									Registrarse <span class="glyphicon glyphicon-list-alt"></span>
								</a>
							<%} %>
							<ul class="nav navbar-nav navbar-right">
									<li class="active"><a href="index.jsp">Inicio</a></li>

								<!-------------- Se agrego 10/07/17 10:30 pm --------------------->
								
								<%if(!inicioSession){%>
									<li><a href="#">Servicios</a></li>
								<%}else{ %>
									<li class="dropdown">
										<a href="#" class="dropdown-toogle" data-toggle="dropdown" role="button">
											Servicios <span class="caret"></span>
										</a>
										<ul class="dropdown-menu">
												<%for(int i=0;i<servicios.size();i+=2){%>
													<% if(servicios.get(i).equals("Buscar Hijo(a)")) {%>										
														<li> <a href="<%=servicios.get(i+1)%>" data-toggle="modal" ><%=servicios.get(i)%> </a></li>
													<%}else{ %>
														<li> <a href="<%=servicios.get(i+1)%>"><%=servicios.get(i)%></a></li>
													<%}%>
												<%} %>
											
										</ul>
										
									</li>
								<%}%>
								<!--------------- FIN -------------------->
									<li class="dropdown">
										<a href="#" class="dropdown-toogle" data-toggle="dropdown" role="button">
											Acerca de ... <span class="caret"></span>
										</a>
										<ul class="dropdown-menu">
													<li><a href="nosotros.jsp">Nosotros</a></li>
													<li><a href="mision_y_vision.jsp">Mision y Vision</a></li>
													<li><a href="organigrama.jsp">Organigrama</a></li>
										</ul>		
									</li>
									<li><a href="contactenos.jsp">Contactenos</a></li>
							</ul>
								</div>
					</div>
				</nav>
			</header>