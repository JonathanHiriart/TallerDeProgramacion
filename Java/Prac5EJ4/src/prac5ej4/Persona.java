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
public class Persona {
    private String nombre;
    private int dni,edad;
//----------------Constructor---------------------------- 

    public Persona(String nombre, int dni, int edad) {
        setDni(dni);
        setEdad(edad);
        setNombre(nombre);
    }

//----------------Constructor---------------------------- 

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }
    public String toString(){
        String aux= " nombre: "+ this.nombre+
                    " dni: " + this.dni + 
                    " edad: "+ this.edad;
        return aux;
    }

}
