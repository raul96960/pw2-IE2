package pw2;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class IniciarSession extends HttpServlet {
	public void doGet(HttpServletRequest req,HttpServletResponse resp)throws IOException {
		doProceso(req,resp);	
	}
	public void doPost(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		doProceso(req,resp);
	}
	public void doProceso(HttpServletRequest req,HttpServletResponse resp)throws IOException {
			
		UserService us=UserServiceFactory.getUserService();
			if(!us.isUserLoggedIn()){
				resp.sendRedirect(us.createLoginURL(req.getRequestURI()));
			}else{
				User usuarioGoogle=us.getCurrentUser();
				String email=usuarioGoogle.getEmail();
				Usuario usuarioApp=Utilidades_Metodos.getUser(email);
				//Se agrego :26/05/2017 10:20
				Rol rolApp=Utilidades_Metodos.getRol(email);
				if(usuarioApp==null){
					resp.sendRedirect(us.createLogoutURL(req.getRequestURI()));
				}else{
					HttpSession my_session=req.getSession();
					//Se agrego 10/07/17 10:30pm
					ArrayList<String>servicios=new ArrayList<String>();
					getServicios(servicios, rolApp.getTipo());
					my_session.setAttribute("servicios", servicios);				
					
					
					my_session.setAttribute("user",usuarioApp);
					//Se agrego :26/05/2017 10:29
					my_session.setAttribute("rol",rolApp);
					resp.sendRedirect("pageWelcomeUser.jsp");
				
				}
			}
	}
	//Se agrego 10/07/17 10:00pm
	public void getServicios(ArrayList<String> servicios,int tipo){
		servicios.add("Estado");
		servicios.add("pageWelcomeUser.jsp");
		
		if(tipo==1){
			servicios.add("Administrar");
			servicios.add("pageAdmin.jsp");
		}else if(tipo==2){
			servicios.add("Profesores");
			servicios.add("profesores.jsp");
			servicios.add("Auxiliares");
			servicios.add("auxiliares.jsp");
			servicios.add("Alumnos");
			servicios.add("alumnos.jsp");
		}else if(tipo==3 || tipo==4){
			servicios.add("Alumnos");
			servicios.add("alumnos.jsp");
		}else if(tipo==5){
			servicios.add("Buscar Hijo(a)");
			servicios.add("#buscarHijo");//Ventana Modal
		}else{
			servicios.add("Ver Notas");
			servicios.add("notas.jsp");
		}
	}
}
