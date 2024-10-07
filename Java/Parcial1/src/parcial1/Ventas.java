/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial1;

/**
 *
 * @author Yoni
 */
public class Ventas {
    private int dni;
    private double litroCargados;
    private double monto;
    private String metodoDePago; // debito, credito o efectivo

    //-----------------------------Constructor-----------------------------

    public Ventas(int dni, double precioDeLaEstacion, double litroCargados, String metodoDePago) {
        this.dni = dni;
        this.litroCargados = litroCargados;
        this.metodoDePago = metodoDePago;
        this.monto = precioDeLaEstacion  * litroCargados;
    }

    public double getMonto() {
        return monto;
    }

    public String getMetodoDePago() {
        return metodoDePago;
    }
    

    public String toString(){
        String aux= "DNI :" + this.dni + 
                    " Cantidad de litros cargados: " + this.litroCargados +
                    " Monto abonado: " + this.monto + 
                    " Metodo de pago: " +this.metodoDePago;
        return aux;
    }
}

