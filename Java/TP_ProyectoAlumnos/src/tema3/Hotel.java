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

public class Hotel{
    private Habitacion[] habitaciones;

    public Hotel(int cantHabitacion) {
        habitaciones = new Habitacion[cantHabitacion];
        for (int i = 0; i < cantHabitacion; i++) {
            habitaciones[i] = new Habitacion();
        }
    }

    public void asignarHabitacion(int habElegida, Cliente cliente) {
        
        // pregunto si la habitacion es un posicion valida en el vector de mi hotel  y tambien pregunto si esta libre
        if (habElegida >= 0 && habElegida < habitaciones.length && habitaciones[habElegida].estaLibre() ) {
            habitaciones[habElegida].asignarCliente(cliente);
            
            //Habitacion habitacion = habitaciones[habElegida];
            //habitacion.asignarCliente(cliente);
        } else {
            System.out.println("Número de habitación inválido.");
        }
    }

    public void mostrarHabitaciones() {
        String estado;
        double precio;
        for (int i = 0; i < habitaciones.length; i++) {
            if (habitaciones[i].estaLibre()) {
                 estado = "Libre";
            } else {
                estado = "Ocupada por " + habitaciones[i].getCliente().getNombre();
            }
            precio = habitaciones[i].getCosto();
            System.out.println("Habitación " + i + ": " + estado +"/ el precio de la habitacion es: "+ precio );
        }
    }
    public void aumentarPrecioHabitaciones(double aumento){
        double loquetiene;
        int i;
        for(i=0; i < habitaciones.length; i++){
            loquetiene = habitaciones[i].getCosto();
            habitaciones[i].setCosto(loquetiene + aumento);
        }
    
    }
}
