/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prac5ej4;

/**
 *
 * @author Yoni
 */
public class CoroSemiCircular extends Coro{
    private Corista[] coristas;
    private int cantCoristas,max;
    
//----------------Constructor----------------------------    

    public CoroSemiCircular(int max, String nombre, Director director, int cantCoristas) {
        super(nombre, director, cantCoristas);
        this.cantCoristas = 0;
        this.max = max;
        this.coristas = new Corista[max];
    }
    
//----------------Metodos----------------------------     
    public void agregarCorista(Corista persona){
        if(this.cantCoristas<this.max){
            this.coristas[cantCoristas]=persona;
            cantCoristas++;
        }
        else {
            System.out.println("no se puede añadir ya esta lleno el grupo");
        }
    }
    public boolean estalleno(){// true si no hay lugar | false si hay lugar
        boolean lleno=false;
        if (cantCoristas<max){
            lleno=true;
        }
        return lleno;
    }
    
    
    public boolean estaOrdenado(){
        boolean estaOrdenado = true;
        int i=0,mayor=999999999;
        while(estaOrdenado ==true && i<this.max ){
            if (mayor > this.coristas[i].getTonoFundamental()){
                mayor= this.coristas[i].getTonoFundamental();// acutalizo el max
                estaOrdenado=true;
                i++;
            } else 
            {estaOrdenado=false;}
        }
        return estaOrdenado;
    }
    
    public String toString(){
        String aux = "El grupo de coristas son : \n";
        int i;
        for(i=0;i< this.max;i++){
              aux +=this.coristas[i].toString()+ "\n";
        }
        return aux;
    }
}
