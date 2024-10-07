/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial2;

/**
 *
 * @author Yoni
 */
public class Productos {
    private int codigo;
    private double precio;
    private String descripcion;
    
    
//---------------------------Constructor---------------------------    

    public Productos(int codigo, double precio, String descripcion) {
        this.codigo = codigo;
        this.precio = precio;
        this.descripcion = descripcion;
    }

    public double getPrecio() {
        return precio;
    }
        
    public String toString(){
        String aux= " Codigo: "+this.codigo +
                    " Precio: " + this.precio +
                    " Descripcion: " + this.descripcion;
        return aux;
    }
}
