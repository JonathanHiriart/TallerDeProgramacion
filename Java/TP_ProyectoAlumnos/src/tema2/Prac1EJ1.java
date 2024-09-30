/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
/**
 *
 * @author Yoni
 */
public class Prac1EJ1 {
        public static void main(String[] args) {
            GeneradorAleatorio.iniciar();
            System.out.println("ingrese el nombre de la persona");
            String nombre = Lector.leerString();
            System.out.println("ingrese el dni");
            int dni = Lector.leerInt();
            System.out.println("ingrese la edad");
            int edad = Lector.leerInt();
            Persona nuevaPersona= new Persona(nombre,dni,edad);
            
            //nombre sin modificar
            System.out.println("------------------------------------------------------------");
            System.out.println(nuevaPersona.toString());
            System.out.println("------------------------------------------------------------");
            
            //modificar obejto con aleatorios
            nombre=GeneradorAleatorio.generarString(5);
            nuevaPersona.setNombre(nombre);
            
            dni=GeneradorAleatorio.generarInt(10);
            nuevaPersona.setDNI(dni);
            edad=GeneradorAleatorio.generarInt(10);
            nuevaPersona.setEdad(edad);
            
            
            System.out.println("------------------------------------------------------------");
            System.out.println(nuevaPersona.toString());
            System.out.println("------------------------------------------------------------");
    }
    
}
