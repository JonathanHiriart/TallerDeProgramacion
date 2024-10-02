/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prac5ej2;
import PaqueteLectura.Lector;
/**
 *
 * @author Yoni
 */
public class Prac5EJ2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Estacionamiento a= new Estacionamiento("pollos Hermanos","Av.Siempreviva",7,20,3,3);
        Autos mustang=new Autos("NEGRO","F");
        Autos ferrari=new Autos("asd","ASD");
        Autos cupe=new Autos("asdf","ASD");
        Autos fiat=new Autos("asdg","ADS");
        Autos bici=new Autos("asdh","ASD");
        Autos moto=new Autos("asdj","BCSPNE");
        a.ingresarAutoenpiso_x_y (mustang, 1, 2);
        a.ingresarAutoenpiso_x_y (ferrari, 1, 3);
        a.ingresarAutoenpiso_x_y (cupe, 2, 1);
        a.ingresarAutoenpiso_x_y (fiat, 2, 3);
        a.ingresarAutoenpiso_x_y (bici, 3, 1);
        a.ingresarAutoenpiso_x_y (moto, 3, 2);
        a.imprimirEstado();
        int plaza=1;
        a.imprimirTodoslasPlazas(plaza);
        System.out.println("ingrese una patente a buscar");
        String patente=Lector.leerString();
        System.out.println(a.buscarAuto(patente));
    }
    
}
