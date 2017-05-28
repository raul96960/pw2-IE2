package pw2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class AgregarUsuario extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		ServletContext contexto=getServletContext();
		RequestDispatcher dispat=contexto.getRequestDispatcher("/registrarUsuario.jsp");
		
		String errorEdad;
		try{
			int edad=Integer.parseInt(req.getParameter("edad"));
			String idEmail=req.getParameter("email");
			if((edad<0 || edad>100)){
				errorEdad="true";
				String errorRangoEdad="true";
				req.setAttribute("errorEdad", errorEdad);
				req.setAttribute("errorRangoEdad", errorRangoEdad);
				throw new RangoEdadException();
			}
			if(Utilidades_Metodos.estaUser(idEmail)){
				String estaUsuario="true";
				req.setAttribute("estaUsuario", estaUsuario);
				throw new ExisteUsuarioException();
			}
			Utilidades_Metodos.addUser(req.getParameter("email"), req.getParameter("nombre"), 
									   req.getParameter("apellidos"), edad,req.getParameter("rol"));
			
			resp.sendRedirect("index.jsp?success=exito");
		}catch (NumberFormatException e){
			errorEdad="true";
			String errorFormatoEdad="true";
			req.setAttribute("errorEdad", errorEdad);
			req.setAttribute("errorFormatoEdad",errorFormatoEdad);
			
			dispat.forward(req, resp);
		}catch( RangoEdadException e){
			
			dispat.forward(req, resp);
		}catch(ExisteUsuarioException e){
			
			dispat.forward(req, resp);
		}
	}
	public void doPost(HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException{
		doGet(req,resp);
	}
	
	
}