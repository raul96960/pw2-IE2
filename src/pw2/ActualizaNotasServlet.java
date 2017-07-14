package pw2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ActualizaNotasServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String id=req.getParameter("user");	
		Usuario usuario=Utilidades_Metodos.getUser(id);
		
		RequestDispatcher disp=getServletContext().getRequestDispatcher("/EditarNotas.jsp");
		req.setAttribute("user", usuario);
		disp.forward(req, resp);
	}
}

	