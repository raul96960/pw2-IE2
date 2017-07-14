package pw2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Redirigir_a_Editar_JSP extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String id=req.getParameter("user");	
		Usuario usuario=Utilidades_Metodos.getUser(id);
		
		RequestDispatcher disp=getServletContext().getRequestDispatcher("/EditarUser.jsp");
		req.setAttribute("user", usuario);
		disp.forward(req, resp);
	}
	

}
		