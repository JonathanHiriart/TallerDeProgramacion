/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prac5ej4;

/**
 *
 * @author Yoni
 */
public class Corista extends Persona{
    private int tonoFundamental;
    
//----------------Constructor---------------------------- 

    public Corista(int tonoFundamental, String nombre, int dni, int edad) {
        super(nombre, dni, edad);
        this.tonoFundamental= tonoFundamental ;
    }

//----------------Constructor---------------------------- 

    public int getTonoFundamental() {
        return tonoFundamental;
    }

    public void setTonoFundamental(int tonoFundamental) {
        this.tonoFundamental = tonoFundamental;
    }
    public String toString(){
        String aux = super.toString()+ 
                    " Tono fundamental: " + this.tonoFundamental ;
        return aux;
    }
    
}
