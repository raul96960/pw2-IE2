package pw2;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




public class DeleteAll extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		int tipo=Integer.parseInt(req.getParameter("tipo"));
		Utilidades_Metodos.borrarAll(tipo);
		resp.sendRedirect("pageAdmin.jsp");
			
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		Utilidades_Metodos.borrarAllUser();
		resp.sendRedirect("index.jsp");
	}
}
