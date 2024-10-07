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
public class Parcial2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        ComprasMayoritas cm= new ComprasMayoritas(20112202, 10, 3);
        
        cm.agregarProducto(new Productos(10,1,"arroz"));
        cm.agregarProducto(new Productos(10,1,"maizena"));
        cm.agregarProducto(new Productos(10,1,"fideos"));
        cm.agregarProducto(new Productos(10,100,"arroz"));
                
        System.out.println(cm.toString());
        
        ComprasMinoristas cmin= new ComprasMinoristas("si", 213, 3);
        cmin.agregarProducto(new Productos(10,110,"pollo"));
        cmin.agregarProducto(new Productos(10,1,"huevos"));
        cmin.agregarProducto(new Productos(10,1,"arroz"));
        
        System.out.println(cmin.toString());
        
    }
    
}
