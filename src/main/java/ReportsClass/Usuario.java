package ReportsClass;

public class Usuario {
    private int idUsuario;
    private int idEmpresa;
    private String nombre;
    private String apellido;
    private String email;
    private String contraseña_hash;

    public Usuario(int idUsuario, int idEmpresa, String nombre, String apellido, String email, String contraseña_hash) {
        this.idUsuario = idUsuario;
        this.idEmpresa = idEmpresa;
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.contraseña_hash = contraseña_hash;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(int idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContraseña_hash() {
        return contraseña_hash;
    }

    public void setContraseña_hash(String contraseña_hash) {
        this.contraseña_hash = contraseña_hash;
    }
    
    
}
