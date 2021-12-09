package Beans;

public class ClienteBeans {
    private String idC;
    private String tiC;
    private String nom;
    private String tiD;
    private String doc;
    private String dir;
    private String tel;

    public ClienteBeans(String idC, String tiC, String nom, String tiD, String doc, String dir, String tel) {
        this.idC = idC;
        this.tiC = tiC;
        this.nom = nom;
        this.tiD = tiD;
        this.doc = doc;
        this.dir = dir;
        this.tel = tel;
    }

    public String getIdC() {
        return idC;
    }

    public void setIdC(String idC) {
        this.idC = idC;
    }

    public String getTiC() {
        return tiC;
    }

    public void setTiC(String tiC) {
        this.tiC = tiC;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getTiD() {
        return tiD;
    }

    public void setTiD(String tiD) {
        this.tiD = tiD;
    }

    public String getDoc() {
        return doc;
    }

    public void setDoc(String doc) {
        this.doc = doc;
    }

    public String getDir() {
        return dir;
    }

    public void setDir(String dir) {
        this.dir = dir;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }
    
    
}
