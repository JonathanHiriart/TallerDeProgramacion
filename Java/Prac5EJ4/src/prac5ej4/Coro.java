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
public abstract class Coro {
    private String nombre;
    private Director director;
    private int cantCoristas;
    
//----------------Constructor----------------------------     

    public Coro(String nombre, Director director, int cantCoristas) {
        this.nombre = nombre;
        this.director = director;
        this.cantCoristas = cantCoristas;
    }

    public abstract void agregarCorista(Corista corista);
    public abstract boolean estalleno();
    public abstract boolean estaOrdenado();
    
    
    public String toString(){
        String aux = "El coro " + this.nombre +" esta conformado por \n" ; 
               aux += "Director: " + this.director.toString() + 
                     "el Grupo de coristas: \n";
        return aux;
    }
}
