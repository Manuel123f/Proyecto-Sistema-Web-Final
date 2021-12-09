package Beans;

public class UsuarioBeans {
    private String idU;
    private String tiU;
    private String nom;
    private String tel;
    private String DNI;
    private String dir;
    private String pas;

    public UsuarioBeans(String idU, String tiU, String nom, String tel, String DNI, String dir, String pas) {
        this.idU = idU;
        this.tiU = tiU;
        this.nom = nom;
        this.tel = tel;
        this.DNI = DNI;
        this.dir = dir;
        this.pas = pas;
    }

    public String getIdU() {
        return idU;
    }

    public void setIdU(String idU) {
        this.idU = idU;
    }

    public String getTiU() {
        return tiU;
    }

    public void setTiU(String tiU) {
        this.tiU = tiU;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getDNI() {
        return DNI;
    }

    public void setDNI(String DNI) {
        this.DNI = DNI;
    }

    public String getDir() {
        return dir;
    }

    public void setDir(String dir) {
        this.dir = dir;
    }

    public String getPas() {
        return pas;
    }

    public void setPas(String pas) {
        this.pas = pas;
    }
    
    
}