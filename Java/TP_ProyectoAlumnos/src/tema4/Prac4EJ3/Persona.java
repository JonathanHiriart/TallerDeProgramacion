/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4.Prac4EJ3;

/**
 *
 * @author Yoni
 */
public class Persona {
    private  String nombre;
    private int edad,dni;

    public String getNombre() {
        return nombre;
    }

    public Persona(String nombre, int edad, int dni) {
        setDni(dni);
        setEdad(edad);
        setNombre(nombre);
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }
    
    
    public String toString(){
        String aux; 
        aux = "Mi nombre es " + nombre + ", mi DNI es " + dni + " y tengo " + edad + " años.";
        return aux;
    }
}
