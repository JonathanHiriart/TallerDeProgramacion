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
public class Director extends Persona{
    private int antiguedad;
    
    
//----------------Constructor---------------------------- 

    public Director(int antiguedad, String nombre, int dni, int edad) {
        super(nombre, dni, edad);
        setAntiguedad(antiguedad);
    }

//----------------Get and set---------------------------- 

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    public String toString(){
        String aux = super.toString() +
                    " antiguedad: "+ this.antiguedad+ "\n";
        return aux;
    }
}
