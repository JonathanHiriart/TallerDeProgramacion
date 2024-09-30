/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author Yoni
 */
public class Circulo {
    
    
    private double radio;
    private Colores color;
    
    
    public Circulo(double radio, Colores color) {
        this.radio = radio;
        this.color = color;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public Colores getColor() {
        return color;
    }

    public void setColor(Colores color) {
        this.color = color;
    }
    
    public void calcularPerimetro(double radio){
        double perimetro = radio *2* Math.PI;
        System.out.println("el perimetro del circulo es " + perimetro);
    }
    
    public void calcularArea(double radio){
        double area= Math.pow(radio,2)*Math.PI;
        System.out.println("el area del circulo es " +area );
    }
    
    @Override
    public String toString(){
        String aux;
        aux="el radio del circulo es " + radio + " el color de relleno es " + color.getRelleno()+" y el color del borde es "+ color.getLinea();
       return ( aux);
    }
}
