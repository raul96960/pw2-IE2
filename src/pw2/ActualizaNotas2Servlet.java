package pw2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ActualizaNotas2Servlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		ServletContext contexto=getServletContext();
		RequestDispatcher dispat=contexto.getRequestDispatcher("/EditarNotas.jsp");
		String errorNota;

		try{
			int nota1=Integer.parseInt(req.getParameter("nota1"));
			int nota2=Integer.parseInt(req.getParameter("nota2"));
			int nota3=Integer.parseInt(req.getParameter("nota3"));

			if((nota1<0 || nota1>20) || (nota2<0 || nota2>20) || (nota3<0 || nota3>20)){
				errorNota="true";
				String errorRangoNota="true";
				req.setAttribute("errorNota", errorNota);
				req.setAttribute("errorRangoNota", errorRangoNota);
				throw new RangoEdadException();
			}else{
				String idEmail=req.getParameter("id");
				Utilidades_Metodos.EditarNotasAlumno(idEmail, nota1, nota2, nota3);
				resp.sendRedirect("alumnos.jsp?success=exito");
			}
		}catch (NumberFormatException e){
			errorNota="true";
			String errorFormatoNota="true";
			req.setAttribute("errorNota", errorNota);
			req.setAttribute("errorFormatoNota",errorFormatoNota);
			
			dispat.forward(req, resp);
		}catch( RangoEdadException e){
			dispat.forward(req, resp);
		}
	}
}