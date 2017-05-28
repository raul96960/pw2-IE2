package pw2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;
public class Funciones {
	
	public static void verificarSession (boolean inicioSession,HttpServletResponse resp) throws IOException, ServletException {
		if(!inicioSession){
			resp.sendRedirect("index.jsp");
		}
	}
}
