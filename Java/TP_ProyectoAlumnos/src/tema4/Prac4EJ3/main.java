/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4.Prac4EJ3;
import PaqueteLectura.Lector;
/**
 *
 * @author Yoni
 */
public class main {
    public static void main(String[] args) {
        String nombre,leer;
        int dni,edad;
        
        System.out.println("ingrese si o no si es un trabajador");
        leer = Lector.leerString();
        System.out.println("ingrese el nombre");
        nombre= Lector.leerString();
        System.out.println("ingrese la edad");
        edad = Lector.leerInt();
        System.out.println("ingrese el dni");
        dni= Lector.leerInt();
        
        
        
        
    }
}
