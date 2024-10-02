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
public class Entrenador extends Empleado{
    private int cantCampeonatos;
    
    // constructor
    
    public Entrenador(int cantCampeonatos, String nombre, double sueldo, int antigudad) {
        super(nombre, sueldo, antigudad);
        setCantCampeonatos(cantCampeonatos);
    }
    // geters and seters 
    public int getCantCampeonatos() {
        return cantCampeonatos;
    }

    public void setCantCampeonatos(int cantCampeonatos) {
        this.cantCampeonatos = cantCampeonatos;
    }
    
    
    public double calcularEfectividad(){
        return getCantCampeonatos()/ super.getAntigudad() ;
    }
    
    public double calcularSueldoACobrar(){
        double sueldoACobrar = super.calcularSueldoACobrar();
        
        if(getCantCampeonatos() >= 1 && getCantCampeonatos()<=4){
            sueldoACobrar =+ 5000;
        } else if (getCantCampeonatos()>=5 && getCantCampeonatos()<=10){
                sueldoACobrar =+ 30000;
        } else if (getCantCampeonatos()>10){
            sueldoACobrar =+ 50000;
        }
        
        
        return sueldoACobrar;
    }
    
    
    
    public String toString(){
        String aux = "" ;
    
        return aux;
    }
    
    
}
