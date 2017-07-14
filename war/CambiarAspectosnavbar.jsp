<%@ page import="pw2.*,java.util.List,java.util.ArrayList" %>
<%! String sessionServletURL;%>
<%! String textoBoton; %>
<%! boolean inicioSession; %>
<% HttpSession my_session=request.getSession();
	Usuario usuario=(Usuario)my_session.getAttribute("user");
	Rol rolUsuario=(Rol)my_session.getAttribute("rol");
	//Se agrego 10/07/17 10:50pm
	ArrayList<String> servicios=(ArrayList<String>)my_session.getAttribute("servicios");
		
	if(usuario==null){
		sessionServletURL="/iniciarSession";
		textoBoton="Iniciar Session";
		inicioSession=false;
	}else{
		sessionServletURL="/cerrarSession";
		textoBoton="Cerrar Session";
		inicioSession=true;
	}
%>