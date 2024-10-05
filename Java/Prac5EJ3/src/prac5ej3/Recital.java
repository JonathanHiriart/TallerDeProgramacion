/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prac5ej3;

/**
 *
 * @author Yoni
 */
public abstract class Recital {
    private String nombreBanda;
    private String[]listacanciones;
    private int cantAgregados;
//constuctor

    public Recital(String nombreBanda, int cantTemas) {
        setNombreBanda(nombreBanda);
        setCantAgregados(cantTemas);
        setListacanciones(new String[cantTemas]);
        
    }
    
    
    
    
// geters and seters 

    public String getNombreBanda() {
        return nombreBanda;
    }

    public void setNombreBanda(String nombreBanda) {
        this.nombreBanda = nombreBanda;
    }

    public String[] getListacanciones() {
        return listacanciones;
    }

    public void setListacanciones(String[] listacanciones) {
        this.listacanciones = listacanciones;
    }
    

    public int getCantAgregados() {
        return cantAgregados;
    }

    public void setCantAgregados(int cantAgregados) {
        this.cantAgregados = cantAgregados;
    }
    
    
    public abstract void agregarTema(String nombreTema);
    public abstract String actuar();
}
