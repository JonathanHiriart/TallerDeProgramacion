/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4.Prac4EJ1;

import tema4.Prac4EJ1.Cuadrado;
import tema4.Prac4EJ1.Circulo;


public class DemoFiguras {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Cuadrado cuad = new Cuadrado(10 , "Rojo", "Negro");
        Circulo cir = new Circulo(10 , "blanco", "verde");
        Triangulo tri = new Triangulo(20, 10 , 2 , "rojo","blanco");
        System.out.println(tri.toString());
        System.out.println(cir.toString());
        System.out.println(cuad.toString());
       
    }
    
    
    
}
