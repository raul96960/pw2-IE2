package pw2;

import java.io.IOException;

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
					my_session.setAttribute("user",usuarioApp);
					//Se agrego :26/05/2017 10:29
					my_session.setAttribute("rol",rolApp);
					resp.sendRedirect("pageWelcomeUser.jsp");
				}
			}
	}
}
