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
    private int filas;
    private Corista[][] coristas;
    private int max,totalAñadidos;
    private Director dire;

//----------------Constructor----------------------------       

    public CoroPorHileras(int filas, String nombre, Director director) {
        super(nombre, director, filas*filas);
        this.filas = filas;
        this.coristas = new Corista[filas][filas];
        this.max= 0;
        this.max = filas*filas;
        this.totalAñadidos = 0;
        this.dire= director;
    }
    
//----------------Metodos----------------------------   
    
    
    public void agregarCorista(Corista persona){
        boolean agrego=false;
        int i=0;
        int j=0;
        if (!estalleno()){
            while(agrego == false && i < this.filas){
                while (agrego == false && j < this.filas){
                    if (this.coristas[i][j]== null){
                        this.coristas[i][j]= persona;
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
        }else{
            System.out.println("lo siento el grupo ya esta lleno");
        }
    }

    public boolean estalleno(){// true si no hay lugar | false si hay lugar
        boolean lleno=true;
        if(totalAñadidos < max ){
            lleno=false;
        }
        return lleno;
    }
    
    
    public boolean estaOrdenado() {
        boolean estaOrdenado = true;
        int i = 0, j = 0;
        while (estaOrdenado && i < this.filas) {
            int actual = this.coristas[i][0].getTonoFundamental(); 
            j = 1; 
            while (estaOrdenado && j < this.filas) {
                if (this.coristas[i][j].getTonoFundamental() != actual) {
                    estaOrdenado = false;
                }
                j++;
            }
            i++;
        }

        // Verificar que las columnas vayan de mayor a menor 
        i = 1;
        while (estaOrdenado && i < this.filas) {
            // itero las filas me quedo en la columna 0 
            if (this.coristas[i - 1][0].getTonoFundamental() < this.coristas[i][0].getTonoFundamental()) {
                estaOrdenado = false;
            }
            i++;
        }

        return estaOrdenado;
    }
    
    
    public String toString(){
        String aux = "El grupo esta compuesta por: \n";
        aux +=this.dire.toString()+"\n";
        aux += "El grupo de coristas son : \n";
        int i,j;
        for(i=0;i < this.filas;i++){
            for(j=0; j < this.filas; j++){
                aux+=this.coristas[i][j].toString()+ "\n";
            }
        }
        return aux;
    }
}
