/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author Yoni
 */
import PaqueteLectura.Lector;

public class Prac3EJ4 {
    public static void main(String[] args) {
        // Crear un hotel con N habitaciones
        System.out.println("ingrese la cantidad de habitaciones que desea en su hotel");
        int habitaiones = Lector.leerInt();
        Hotel hotel = new Hotel(habitaiones);

        // Crear un cliente
        System.out.println("ingrese el nombre del cliente");
        String nombre= Lector.leerString();
        System.out.println("ingrese el dni");
        int dni= Lector.leerInt();
        System.out.println("ingrese la edad");
        int edad= Lector.leerInt();
        Cliente c = new Cliente(nombre,edad,dni);
      
        // Pedir al usuario el número de la habitación
        System.out.print("Ingrese el número de la habitación que desea: ");
        int x = Lector.leerInt();
        x--; //decremento 1 lo que me da el usuario porque en java los vectores van de [0... n] y si n = x accede a una posicion invalida
            
        // Asignar el cliente a la habitación solicitada
        hotel.asignarHabitacion(x, c);
        // Pedir al usuario que me aumente el coste de las habitaciones
        System.out.println("ingrese el aumento de la habitaciones");
        double aumento=Lector.leerDouble();
        hotel.aumentarPrecioHabitaciones(aumento);
        
        
        
        // Mostrar el estado de las habitaciones
        hotel.mostrarHabitaciones();
    }
}

