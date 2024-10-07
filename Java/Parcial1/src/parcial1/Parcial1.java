/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial1;

/**
 *
 * @author Yoni
 */
public class Parcial1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        EstacionDeServicio villa= new EstacionDeServicio("calle 60");
        Surtidores s1=new Surtidores("disel", 1, 10);
        Surtidores s2=new Surtidores("disel", 1, 2);
        Surtidores s3=new Surtidores("disel", 1, 3);
        Surtidores s4=new Surtidores("disel", 1, 11);
        Surtidores s5=new Surtidores("disel", 1, 31);
        
        Surtidores s6=new Surtidores("disel", 1233, 12);
        villa.agregarSurtidor(s1);
        villa.agregarSurtidor(s2);
        villa.agregarSurtidor(s3);
        villa.agregarSurtidor(s4);
        villa.agregarSurtidor(s5);
        villa.agregarSurtidor(s6);
        villa.AgregarUnaVentaAunSurtidorN(1,123,1, "efectivo");
        villa.AgregarUnaVentaAunSurtidorN(2,12, 1, "efectivo");
        villa.AgregarUnaVentaAunSurtidorN(3,1, 1, "efectivo");
        villa.AgregarUnaVentaAunSurtidorN(4,1, 1, "efectivo");
        villa.AgregarUnaVentaAunSurtidorN(5,1, 1, "efectivo");
        villa.AgregarUnaVentaAunSurtidorN(6,1, 1, "efectivo");
        int monto =villa.maxMonto();
        System.out.println("El Surtidor con mas monto recaudado es " + monto);
        
        System.out.println(villa.toString());
        
    }
    
}
