package pw2;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class GetListaServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		List<Usuario> list=Utilidades_Metodos.getListaUsuarios(req.getParameter("nombre"),req.getParameter("apellido"));
		HttpSession my_session=req.getSession();
		my_session.setAttribute("Lista", list);
		resp.sendRedirect("ListaHijos.jsp");
	}
}