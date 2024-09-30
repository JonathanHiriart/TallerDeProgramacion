/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author Yoni
 */
public class Colores {
    private String linea;
    private String relleno;
    
    public Colores(String linea,String relleno){
        this.linea = linea;
        this.relleno = relleno;
   
    }

    public String getLinea() {
        return linea;
    }

    public void setLinea(String linea) {
        this.linea = linea;
    }

    public String getRelleno() {
        return relleno;
    }

    public void setRelleno(String relleno) {
        this.relleno = relleno;
    }
    
    
}
