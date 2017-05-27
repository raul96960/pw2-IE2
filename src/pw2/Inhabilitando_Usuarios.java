package pw2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Inhabilitando_Usuarios extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest req,HttpServletResponse resp)throws IOException,ServletException {
			String[] llaves=req.getParameterValues("idEmail");
			if(llaves==null){
				resp.sendRedirect("ListUsuarios.jsp");
			}else{				
				Utilidades_Metodos.inhabilitarUsuarios(llaves);
				resp.sendRedirect("ListUsuarios.jsp");
			}
	}
	public void doPost(HttpServletRequest req,HttpServletResponse resp)throws IOException,ServletException  {
		doGet(req,resp);
	}
	//public class ProbarAspectosdeRegistrarUsuariodelProyectoServlet extends HttpServlet {
		//public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
}
