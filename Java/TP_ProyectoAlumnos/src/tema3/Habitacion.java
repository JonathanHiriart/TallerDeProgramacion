/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author Yoni
 */
public class Habitacion {
    private Cliente cliente; 
    private double costo;
    private boolean estado; //true para que este libre, false para ocupada 

    public Habitacion() {
        this.cliente = null;
        this.estado=true;
        this.costo=GeneradorAleatorio.generarDouble(6000) +2000;
    }

    public boolean estaLibre() {
        return this.estado;
    }

    public void asignarCliente(Cliente cliente) {
        if (estaLibre()) {
            this.cliente = cliente;
            this.estado=false;// ahora se ocupa la habitacion
            System.out.println("Cliente " + cliente.getNombre() + " asignado a la habitación.");
        } else {
            System.out.println("La habitación ya está ocupada.");
        }
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public Cliente getCliente() {
        return cliente;
    }
}
