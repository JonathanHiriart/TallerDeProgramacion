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
public class ComprasMayoritas extends Compras{
    private int cuit;
//---------------------------Constructor---------------------------

    public ComprasMayoritas(int cuit, int nro, int dmf) {
        super(nro, dmf);
        this.cuit = cuit;
    }
    
    @Override
    public String toString(){
        String aux= super.toString() + " CUIT: " + this.cuit + "";
        return aux;
    }
    
}
