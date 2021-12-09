
package Beans;

public class ProductoBeans {
    private String idP;
    private String nom;
    private String tiP;
    private String pro;
    private String des;
    private String img;
    private int sto;
    private double pre;

    public ProductoBeans(String idP, String nom, String tiP, String pro, String des, String img, int sto, double pre) {
        this.idP = idP;
        this.nom = nom;
        this.tiP = tiP;
        this.pro = pro;
        this.des = des;
        this.img = img;
        this.sto = sto;
        this.pre = pre;
    }

    public String getIdP() {
        return idP;
    }

    public void setIdP(String idP) {
        this.idP = idP;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getTiP() {
        return tiP;
    }

    public void setTiP(String tiP) {
        this.tiP = tiP;
    }

    public String getPro() {
        return pro;
    }

    public void setPro(String pro) {
        this.pro = pro;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getSto() {
        return sto;
    }

    public void setSto(int sto) {
        this.sto = sto;
    }

    public double getPre() {
        return pre;
    }

    public void setPre(double pre) {
        this.pre = pre;
    }
    
    
}
