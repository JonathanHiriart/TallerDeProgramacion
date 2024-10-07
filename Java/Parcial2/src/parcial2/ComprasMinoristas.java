/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial2;

/**
 *
 * @author Yoni
 */
public class ComprasMinoristas extends Compras{
    private String jubilado;
    
    public ComprasMinoristas(String jubilado, int nro, int dmf) {
        super(nro, dmf);
        this.jubilado = jubilado;
        
    }
    @Override
    public String toString(){
        String aux= super.toString() + " Es Jubilado: " + this.jubilado + "";
        return aux;
    }
}
