package pw2;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@SuppressWarnings("serial")
public class EditarServlet extends HttpServlet {

	public void doPost(HttpServletRequest req,HttpServletResponse resp)throws IOException ,ServletException{


		RequestDispatcher dispat=getServletContext().getRequestDispatcher("/EditarUser.jsp");
		String errorEdad;
		try{
			int edad=Integer.parseInt(req.getParameter("edad"));
			if((edad<0 || edad>100)){
				errorEdad="true";
				String errorRangoEdad="true";
				req.setAttribute("errorEdad", errorEdad);
				req.setAttribute("errorRangoEdad", errorRangoEdad);
				throw new RangoEdadException();
			}
			String id=req.getParameter("id");
			Utilidades_Metodos.editarUsuario(req.getParameter("nombre"), req.getParameter("apellidos"), edad, id);
			
			resp.sendRedirect("pageAdmin.jsp?success=exito");

		}catch (NumberFormatException e){
			errorEdad="true";
			String errorFormatoEdad="true";
			req.setAttribute("errorEdad", errorEdad);
			req.setAttribute("errorFormatoEdad",errorFormatoEdad);
			dispat.forward(req, resp);
		}catch( RangoEdadException e){
			dispat.forward(req, resp);
		}
	}
	
}