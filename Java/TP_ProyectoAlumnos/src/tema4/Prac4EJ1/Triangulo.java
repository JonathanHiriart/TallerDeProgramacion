/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4.Prac4EJ1;

import tema4.Prac4EJ1.Figura;

/**
 *
 * @author Yoni
 */
public class Triangulo extends Figura {
    private double lado1,lado2,lado3;
    
    // constructor
    public Triangulo(double lado1,double lado2, double lado3,String colorRelleno, String colorLinea ){
        super(colorRelleno, colorLinea);
        setLado1(lado1);
        setLado2(lado2);
        setLado3(lado3);
    }
    
    // metodos
    
    public double calcularPerimetro(){
        return lado1 + lado2 + lado3;
 
    }
    
    
    public double calcularArea(){
       double altura = Math.cbrt(this.calcularPerimetro());
       return (lado1* altura)/ 2;
    }
    
    
    
    // geters and seters 

    public double getLado1() {
        return lado1;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }
    
    public String toString(){
        String aux =super.toString()+" |" 
                    + " lado 1 : " + this.getLado1()+" |" 
                    + " lado 2 : " + this.getLado2()+ " |" 
                    + " lado 3 : " + this.getLado3()+ " |" ;
        return aux;
    }
   

}
