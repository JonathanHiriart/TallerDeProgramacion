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
public class CoroPorHileras extends Coro{
    private int filas,cantCoristasPorFila;
    private Corista[][] coristas;
    private int max,totalAñadidos;

//----------------Constructor----------------------------       

    public CoroPorHileras(int filas, int cantCoristasPorFila, String nombre, Director director, int cantCoristas) {
        super(nombre, director, cantCoristas);
        this.filas = filas;
        this.cantCoristasPorFila = cantCoristasPorFila;
        this.coristas = new Corista[filas][cantCoristasPorFila];
        this.max = cantCoristas;
        this.totalAñadidos = 0;
    }    
    
//----------------Get and set----------------------------   
    public int getFilas() {
        return filas;
    }

    public void setFilas(int filas) {
        this.filas = filas;
    }

    public int getCantCoristasPorFila() {
        return cantCoristasPorFila;
    }

    public void setCantCoristasPorFila(int cantCoristasPorFila) {
        this.cantCoristasPorFila = cantCoristasPorFila;
    }

    public Corista[][] getCoristas() {
        return coristas;
    }

    public void setCoristas(Corista[][] coristas) {
        this.coristas = coristas;
    }

    public int getMax() {
        return max;
    }

    public void setMax(int max) {
        this.max = max;
    }

    public int getTotalAñadidos() {
        return totalAñadidos;
    }

    public void setTotalAñadidos(int totalAñadidos) {
        this.totalAñadidos = totalAñadidos;
    }
    
    
    
    
    
    
//----------------Metodos----------------------------   
    
    
    public void agregarCorista(Corista persona){
        boolean agrego=false;
        int i=0;
        int j=0;
        if (!estalleno()){
            while(agrego!= false && i < getFilas()){
                while (agrego!= false && j < getCantCoristasPorFila()){
                    if (getCoristas()[i][j]==null){
                        getCoristas()[i][j]=persona;
                        agrego=true;
                        totalAñadidos++;
                    }else{
                        j++;
                    }
                }
                j=0;
                i++;
            }
        }
        if (agrego==true){
            System.out.println("el corista se agrego correctamente");
        }else {
            System.out.println("lo siento el grupo ya esta lleno");
        }
    }

    public boolean estalleno(){// true si no hay lugar | false si hay lugar
        boolean lleno=true;
        if(totalAñadidos<max){
            lleno=false;
        }
        return lleno;
    }
    
    
    public boolean estaOrdenado(){
        boolean estaOrdenado = true;
        int i=0,j=0,actual=getCoristas()[i][0].getTonoFundamental();
        while(estaOrdenado ==true && i< (getFilas()-1)){
            while (estaOrdenado== true && j<getCantCoristasPorFila()- 1){
                if (actual != (getCoristas()[i][0].getTonoFundamental())){
                    estaOrdenado=true;
                } else 
                    {estaOrdenado=false;}  
            }
            j=0;
            i++;
            actual=getCoristas()[i][0].getTonoFundamental();
        }
        
        // reinicio y recorro laprimera columna 
        i=0;
        j=0;
        int max=getCoristas()[0][j].getTonoFundamental();
        while (estaOrdenado == true && j < (getCantCoristasPorFila()-1)){
            if (max > getCoristas()[0][j].getTonoFundamental() ){
                max = getCoristas()[0][j].getTonoFundamental();
            }
            else {
                estaOrdenado =false;
            }
            j++;
        }
        return estaOrdenado;
    }
}
