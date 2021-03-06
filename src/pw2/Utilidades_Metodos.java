package pw2;

import java.util.List;

import javax.jdo.JDOObjectNotFoundException;
import javax.jdo.PersistenceManager;
import javax.jdo.Query;

public class Utilidades_Metodos {

	public static void addUser(String idEmail, String nombre, String apellidos, int edad,String rol){
		PersistenceManager gestorJDO=PMF.get().getPersistenceManager();
		try{
			Usuario user=new Usuario(nombre,apellidos,edad);
			Rol rolUser;
			// Se agrego 26/05/17 10:45
			if(idEmail.equals("wolfstein2015@gmail.com") || idEmail.equals("rescobedo@episunsa.edu.pe"))
				rolUser=new Rol("Administrador",establecerTipoUser("Administrador")); 
			else
				rolUser=new Rol(rol,establecerTipoUser(rol));

			//Llaves para usuario y tambien su rol(Es el idEmail)
			String keyUser=new String(idEmail);
			String keyRol=new String(idEmail);
			//Se establece KeyUser para ambos objetos
			rolUser.setKeyIdEmail(keyRol);
			user.setIdEmail(keyUser);

			gestorJDO.makePersistent(user);
			gestorJDO.makePersistent(rolUser);
		} finally {
			gestorJDO.close();
		}
	}
	public static int establecerTipoUser(String rol){
		if(rol.equals("Administrador"))
			return 1;
		if(rol.equals("Director"))
			return 2;
		else if(rol.equals("Profesor"))
			return 3;
		else if(rol.equals("Auxiliar"))
			return 4;
		else if(rol.equals("Apoderado"))
			return 5;
		else
			return 6;
	}

	/**Metodo para obtener un usuario si existe un usuario con idEmail(Usado en el Servlet de Iniciar Session)
	 * 
	 * @param idEmail llave para obtener el objeto en el DataStore
	 * @return
	 */
	public static Usuario getUser(String idEmail){
		PersistenceManager gestorJDO = PMF.get().getPersistenceManager();
		Usuario p;
		try{
			p=(Usuario)gestorJDO.getObjectById(Usuario.class, new String(idEmail));
			return p;
		}catch(JDOObjectNotFoundException e){
			return null;
		}
		finally {
			gestorJDO.close();
		}
	}
	// Se agrego 26/5/17 08:44
	/**Metodo para Inhabilitar varios Usuarios de la table de usuarios de la page de Administrador
	 * 
	 * @param llaves arreglo de  Strings que contiene las llaves de los usuarios a Inhabilitar
	 */
	public static void inhabilitarUsuarios(String [] llaves){
		PersistenceManager gestorJDO = PMF.get().getPersistenceManager();

		try{
			for(String llave: llaves){
				Usuario	u=(Usuario)gestorJDO.getObjectById(Usuario.class, new String(llave));
				if(u.getEstado()==true)
					u.setEstado(false);
				else
					u.setEstado(true);
			}
		}finally {
			gestorJDO.close();
		}

	}
	public static void inhabilitarUsuariosAll(int tipo){

		PersistenceManager gestorJDO = PMF.get().getPersistenceManager();
		try{
			List<Usuario> list=getListaUsuarios(tipo);
			String []llaves=new String[list.size()];
			for(int i=0;i<list.size();i++)
				llaves[i]=list.get(i).getIdEmail();

			inhabilitarUsuarios(llaves);
		}catch(Exception e){
		}
		finally {
			gestorJDO.close();
		}

	}


	/**Metodo que edita los datos de un Usuario
	 * 
	 * @param nombre
	 * @param apellido
	 * @param edad
	 * @param idEmail
	 */
	public static void editarUsuario(String nombre,String apellido,int edad,String idEmail){
		PersistenceManager gestorJDO = PMF.get().getPersistenceManager();
		try {
			Usuario user=(Usuario)gestorJDO.getObjectById(Usuario.class,new String(idEmail));
			user.setApellidos(apellido);
			user.setNombre(nombre);
			user.setEdad(edad);

		} finally {
			gestorJDO.close();
		}
	}
	public static void EditarNotasAlumno(String idEmail,int nota1, int nota2,int nota3){
		PersistenceManager gestorJDO = PMF.get().getPersistenceManager();
		try {
			Usuario user=(Usuario)gestorJDO.getObjectById(Usuario.class,new String(idEmail));
			user.setNota1(nota1);
			user.setNota2(nota2);
			user.setNota3(nota3);
		} finally {
			gestorJDO.close();
		}
	}
	
	
	
	//Se agrego 26/05/2017 10:30 am
	/**Metodo para obtener un Rol de un usuario con idEmail(Usado en el Servlet de Iniciar Session)
	 * 
	 * @param idEmail llave para obtener el objeto en el DataStore el mismo que el del usuario
	 * @return
	 */
	public static Rol getRol(String idEmail){
		PersistenceManager gestorJDO = PMF.get().getPersistenceManager();
		Rol r;
		try{
			r=(Rol)gestorJDO.getObjectById(Rol.class, new String(idEmail));
			return r;
		}catch(JDOObjectNotFoundException e){
			return null;
		}
		finally {
			gestorJDO.close();
		}
	}
	/**Metodo auxiliar para verificar si existe el usuario(Usado en el form registrod de Usuario)
	 * 
	 * @param idEmail llave para verificar si existe en el usuario
	 * @return
	 */
	public static boolean estaUser(String idEmail){
		if(getUser(idEmail)==null)
			return false;
		else
			return true;
	}

	public static String getImagenRol(int tipo){
		//imgen que representa al:
		switch (tipo) {
		//Administrador
		case 1: return "Black_king.jpg"; 
		//Director
		case 2: return "Black_queen.jpg"; 
		//Profesor
		case 3: return "Black_knight.jpg";
		//Auxiliar
		case 4: return "Black_bishop.jpg";
		//Apoderado
		case 5: return "Black_rook.jpg"; 

		default: return "Black_pawn.jpg";
		}

	}
	//Se agrego 26/05/2017 10:30 am
	/**Metodo que obtiene un lista de Usuarios del DST(Usado en la pagina de Administrador)
	 * @return List
	 */
	public static List<Usuario> getListaUsuarios(int tipo){

		PersistenceManager pm=PMF.get().getPersistenceManager();
		try{
			Query q=pm.newQuery(Usuario.class);
			q.setFilter("tipo==tipoParam");
			q.declareParameters("String tipoParam");


			@SuppressWarnings("unchecked")
			List<Usuario> lista =(List<Usuario>)q.execute(tipo);
			return lista;
		}catch(Exception e){
			return null;
		}
		finally {
			pm.close();
		}
	}
	public static List<Usuario> getListaUsuarios(String nombre, String apellido) {
		PersistenceManager pm=PMF.get().getPersistenceManager();
		Query q=pm.newQuery(Usuario.class);
		try{
			
			q.setFilter("nombre==nameParam || apellidos==apellidoParam");
			q.declareParameters("String nameParam, String apellidoParam");
			@SuppressWarnings("unchecked")
			List<Usuario>lista=(List<Usuario>)q.execute(nombre, apellido);
			return lista;
		}catch(Exception e){
			return null;
		}finally {
			q.closeAll();
			pm.close();
		}
	}
	
	
	/**Metodo que obtiene un lista de Roles especificado por el parametro del DST(Usado en la pagina de Administrador)
	 * @param tipo
	 * @return Lista de un Rol en especifico
	 */
	public static List<Rol> getListaRol(int tipo){

		PersistenceManager pm=PMF.get().getPersistenceManager();
		try{
			Query q=pm.newQuery(Rol.class);
			q.setFilter("tipo==tipoParam");
			q.declareParameters("String tipoParam");

			@SuppressWarnings("unchecked")
			List<Rol> lista =(List<Rol>) q.execute(tipo);
			return lista;
		}catch(Exception e){
			return null;
		}
		finally {
			pm.close();
		}
	}
	/**Borra elementos seleccionados del DST.
	 * 
	 * @param borrados
	 */
	public static void borrarSeleccionados(String [] borrados){
		PersistenceManager gestorJDO = PMF.get().getPersistenceManager();

		try{
			for(String llave: borrados){
				Rol rol=(Rol)gestorJDO.getObjectById(Rol.class, new String(llave));
				gestorJDO.deletePersistent(rol);
				Usuario	u=(Usuario)gestorJDO.getObjectById(Usuario.class, new String(llave));
				gestorJDO.deletePersistent(u);

			}
		}finally {
			gestorJDO.close();
		}
	}

	public static void borrarAll(int tipo){
		PersistenceManager pm=PMF.get().getPersistenceManager();

		try{
			List<Usuario> list=getListaUsuarios(tipo);

			for(Usuario u: list){
				Rol rol=(Rol)pm.getObjectById(Rol.class, new String(u.getIdEmail()));
				pm.deletePersistent(rol);
				Usuario user=(Usuario)pm.getObjectById(Usuario.class,new String(u.getIdEmail()));
				pm.deletePersistent(user);
			}

		}catch (Exception e) {
		}
		finally {
			pm.close();
		}

	}	
	public static void borrarAllUser(){
		PersistenceManager pm=PMF.get().getPersistenceManager();

		try{
			Query q=pm.newQuery(Usuario.class);
			@SuppressWarnings("unchecked")
			List<Usuario> list=(List<Usuario>)q.execute();

			for(Usuario u: list){
				Usuario user=(Usuario)pm.getObjectById(Usuario.class, new String(u.getIdEmail()));
				pm.deletePersistent(user);
			}
		}finally {
			pm.close();
		}
	}
	public static String getEstadoRolorUser(boolean estadoTrue){
		if(estadoTrue)
			return "Habilitado";
		else 
			return "Inabilitado";
	}
	
}
