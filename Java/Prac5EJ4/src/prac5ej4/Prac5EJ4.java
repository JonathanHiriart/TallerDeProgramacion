/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prac5ej4;
import PaqueteLectura.Lector;
/**
 *
 * @author Yoni
 */
public class Prac5EJ4 {
    public static void main(String[] args) {
        Director dire = new Director(25,"negro",44489,30);
        CoroPorHileras coro1 =new CoroPorHileras(2,"Labanda de los trolos", dire);
        Corista p1= new Corista(5, "kavo",2, 21);
        Corista p2= new Corista(5, "fermin",1, 22);
        Corista p3= new Corista(3, "juan",3, 23);
        Corista p4= new Corista(3, "yoni",4, 19);
        
        
        Corista p5= new Corista(0, "yoni",4, 19);
        coro1.agregarCorista(p1);
        coro1.agregarCorista(p2);
        coro1.agregarCorista(p3);
        coro1.agregarCorista(p4);
        coro1.agregarCorista(p5);
        
        
        if (coro1.estaOrdenado()){
            System.out.println("si esta ordenado ");
            
        }else {
            System.out.println("no esta ordenado");
        }
        System.out.println(coro1.toString());
    }
    
}
