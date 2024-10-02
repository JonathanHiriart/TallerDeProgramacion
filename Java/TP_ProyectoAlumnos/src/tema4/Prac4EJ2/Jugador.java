/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4.Prac4EJ2;

/**
 *
 * @author Yoni
 */
public class Jugador extends Empleado {
    private int partidos;
    private int goles;
    // constructor
    public Jugador(String nombre,double sueldo,int antigudad, int partidos, int goles){
        super(nombre,sueldo,antigudad);
        setGoles(goles);
        setPartidos(partidos);
    }
    
    // geters and seters 
    public int getPartidos() {
        return partidos;
    }

    public void setPartidos(int partidos) {
        this.partidos = partidos;
    }

    public int getGoles() {
        return goles;
    }

    public void setGoles(int goles) {
        this.goles = goles;
    }
    public double calcularEfectividad(){
        return getGoles() / getPartidos();
    }
    
    
    public double calcularSueldoACobrar(){
        double sueldoACobrar = super.calcularSueldoACobrar();
        if(this.calcularEfectividad()> 0.5){
            sueldoACobrar = super.getSueldo() + sueldoACobrar;
        }
        return sueldoACobrar;
    }
    
    
    public String toString(){
        String aux = "" ;
    
        return aux;
    }
}
