/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author Yoni
 */
public class Prac3EJ5 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar(); 
        
        
        System.out.println("ingrese el radio");
        double radio = Lector.leerDouble();
        System.out.println("ingrese el color de relleno");
        String relleno= Lector.leerString();
        System.out.println("ingrese el color del borde");
        String borde = Lector.leerString();
        
        Colores color = new Colores(borde, relleno);
        Circulo c1 = new Circulo(radio,color);
        
        radio =GeneradorAleatorio.generarDouble(123);
        System.out.println(radio);
        
        borde=GeneradorAleatorio.generarString(5);
        color.setLinea(borde);
        relleno = GeneradorAleatorio.generarString(5);
        color.setRelleno(relleno);
        
        
        c1.setRadio(radio);
        c1.calcularArea(radio);
        
        c1.calcularPerimetro(radio);
        System.out.println(c1.toString());
    }
}
