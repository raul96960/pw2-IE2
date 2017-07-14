package pw2;

import java.io.Serializable;

import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable(identityType=IdentityType.APPLICATION)
public class Rol implements Serializable {	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@PrimaryKey
	private String idEmail;
	@Persistent
	private int tipo;
	@Persistent
	private String nombre;
	@Persistent
	private boolean estado;
	
	public Rol (){}

	public Rol(String rolNombre,int tipo) {
		this.nombre=rolNombre;
		this.tipo = tipo;
		this.estado=true;
	}

	public String getIdEmail() {
		return idEmail;
	}
	public void setKeyIdEmail(String idEmail) {
		this.idEmail = idEmail;
	}

	public int getTipo() {
		return tipo;
	}

	public void setTipo(int tipo) {
		this.tipo = tipo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public boolean getEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	/*public void establecerNombre(int tipo){
		switch (tipo) {
		case 1:setNombre("Administrador");  break;
		case 2: setNombre("Director");			break;
		case 3: setNombre("Profesor");			break;
		case 4: setNombre("Auxiliar");			break;
		case 5: setNombre("Apoderado");			break;
		default: setNombre("Alumno");			break;
		}
	}*/
	public String toString(){
		return nombre;
	}
}
