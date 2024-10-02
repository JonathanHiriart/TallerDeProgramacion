/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4.Prac4EJ4;

/**
 *
 * @author Yoni
 */
public class Estacion {
    private String nombre;
    private double latitud, longitud;
// constructor

    public Estacion(String nombre, double latitud, double longitud) {
        setLatitud(latitud);
        setLongitud(longitud);
        setNombre(nombre);
    }
    
// geters and seters
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getLatitud() {
        return latitud;
    }

    public void setLatitud(double latitud) {
        this.latitud = latitud;
    }

    public double getLongitud() {
        return longitud;
    }

    public void setLongitud(double longitud) {
        this.longitud = longitud;
    }
    
}
