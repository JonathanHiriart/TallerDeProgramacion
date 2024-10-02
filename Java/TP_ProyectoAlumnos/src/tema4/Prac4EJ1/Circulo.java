/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4.Prac4EJ1;

/**
 *
 * @author Yoni
 */
public class Circulo extends Figura {
    private double radio;
    
    //constructor 
    
    public Circulo(double radio,String colorRelleno,String colorLinea){
        super(colorRelleno,colorLinea);
        setRadio(radio);
  
    }
    public double calcularPerimetro(){
        return 2*Math.PI* radio;
    }
    public double calcularArea(){
        return  Math.pow(radio,2) * Math.PI;
    }
    
    
    // geters and seters 

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
    
    
    // imprime 
    public String toString(){
        String aux = super.toString()+" |" +
                " radio: " + this.getRadio()+" |" ;
        return aux;
    }
    
}
