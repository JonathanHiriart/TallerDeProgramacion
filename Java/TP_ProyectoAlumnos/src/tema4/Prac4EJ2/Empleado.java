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
public  abstract class Empleado {
    private String nombre;
    private double sueldo;
    private int antigudad;
    // constructor
    
    public Empleado(String nombre,double sueldo,int antigudad){
        setAntigudad(antigudad);
        setSueldo(sueldo);
        setNombre(nombre);
    }
    
    // geters and seters

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public int getAntigudad() {
        return antigudad;
    }

    public void setAntigudad(int antigudad) {
        this.antigudad = antigudad;
    }
    
    
    public abstract  double calcularEfectividad();
    
    // public abstract double calcularEfectividad();
    
    public double calcularSueldoACobrar(){
        double sueldoACobrar = this.getSueldo()+ (this.getAntigudad() * 0.1 * this.getSueldo());
        return sueldoACobrar;
    }
    
    public String toString(){
        String aux = "nombre: " +getNombre(); 
        return aux;
    }
}
