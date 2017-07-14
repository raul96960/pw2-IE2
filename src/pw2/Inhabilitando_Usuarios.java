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

		if(req.getParameter("tipo")!=null){
			Utilidades_Metodos.inhabilitarUsuariosAll(Integer.parseInt(req.getParameter("tipo")));
		}else{

			String[] inhabilitados=req.getParameterValues("idEmailInha");
			String[] borrados=req.getParameterValues("idEmailDelete");

			if(borrados==null && inhabilitados==null)
				resp.sendRedirect("pageAdmin.jsp");
			else if(borrados!=null && inhabilitados==null) 
				Utilidades_Metodos.borrarSeleccionados(borrados);
			else if(inhabilitados!=null && borrados==null)
				Utilidades_Metodos.inhabilitarUsuarios(inhabilitados);
			else if( borrados!=null && inhabilitados!=null){

				inhabilitados=filtrarLlaves(borrados, inhabilitados);
				if(inhabilitados==null){
					Utilidades_Metodos.borrarSeleccionados(borrados);
				}else{
					Utilidades_Metodos.borrarSeleccionados(borrados);
					Utilidades_Metodos.inhabilitarUsuarios(inhabilitados);
				}
			}
		}
		resp.sendRedirect("pageAdmin.jsp");
	}

	public void doPost(HttpServletRequest req,HttpServletResponse resp)throws IOException,ServletException  {
		doGet(req,resp);
	}
	public static String[] filtrarLlaves(String []a,String[] b){

		int longitud=b.length;	

		for(int i=0;i<a.length;i++){
			for(int j=0;j<b.length;j++){
				if(a[i].equalsIgnoreCase(b[j])){
					b[j]=null;
					longitud--;
					break;
				}
			}
		}
		String []nuevo=null;
		if(longitud!=0){
			nuevo=new String[longitud];
			int z=0;
			for(int k=0;k<b.length;k++){
				if(b[k]!=null){
					nuevo[z]=b[k];
					z++;
				}
			}
		}
		return nuevo;
	}
}
