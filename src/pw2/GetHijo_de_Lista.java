package pw2;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class GetHijo_de_Lista extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		Usuario user=Utilidades_Metodos.getUser(req.getParameter("user"));
		HttpSession my_session=req.getSession();
		my_session.setAttribute("Hijo",user);
		resp.sendRedirect("infoHijo.jsp");
	}
}