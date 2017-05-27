<%@ page import="pw2.*,java.util.List,
				javax.servlet.http.HttpSession" %>
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