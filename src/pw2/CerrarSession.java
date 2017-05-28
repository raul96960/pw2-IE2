package pw2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class CerrarSession extends HttpServlet {

	public void doGet(HttpServletRequest req,HttpServletResponse resp)throws IOException ,ServletException{
		doProceso(req,resp);	
	}
	public void doPost(HttpServletRequest req,HttpServletResponse resp) throws IOException,ServletException{
		doProceso(req,resp);
	}
	
	public void doProceso(HttpServletRequest req, HttpServletResponse resp) throws IOException,ServletException{
		UserService us=UserServiceFactory.getUserService();
		
		if(us.isUserLoggedIn()){
			HttpSession my_session=req.getSession();
			my_session.invalidate();
			resp.sendRedirect(us.createLogoutURL(req.getRequestURI()));
		}else{
			resp.sendRedirect("index.jsp");
		}
	}
}
