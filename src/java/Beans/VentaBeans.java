
package Beans;

public class VentaBeans {
    private String idV;
    private String idCV;
    private String noE;
    private String tiC;
    private String nuC;
    private String fecha;
    private double monto;
    private String est;

    public VentaBeans(String idV, String idCV, String noE, String tiC, String nuC, String fecha, double monto, String est) {
        this.idV = idV;
        this.idCV = idCV;
        this.noE = noE;
        this.tiC = tiC;
        this.nuC = nuC;
        this.fecha = fecha;
        this.monto = monto;
        this.est = est;
    }

    public String getIdV() {
        return idV;
    }

    public void setIdV(String idV) {
        this.idV = idV;
    }

    public String getIdCV() {
        return idCV;
    }

    public void setIdCV(String idCV) {
        this.idCV = idCV;
    }

    public String getNoE() {
        return noE;
    }

    public void setNoE(String noE) {
        this.noE = noE;
    }

    public String getTiC() {
        return tiC;
    }

    public void setTiC(String tiC) {
        this.tiC = tiC;
    }

    public String getNuC() {
        return nuC;
    }

    public void setNuC(String nuC) {
        this.nuC = nuC;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getEst() {
        return est;
    }

    public void setEst(String est) {
        this.est = est;
    }
    
}
