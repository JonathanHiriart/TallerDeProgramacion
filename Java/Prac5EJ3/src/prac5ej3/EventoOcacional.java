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
public class EventoOcacional extends Recital{
    private String motivo,nombreContratante;
    private int dia;
    private int dml;
// constructor

    public EventoOcacional(String motivo, String nombreContratante, int dia, String nombreBanda, int cantTemas) {
        super(nombreBanda, cantTemas);
        setDia(dia);
        setMotivo(motivo);
        setNombreContratante(nombreContratante);
        dml=0;
    }
    
    
    
    
    
// geters and seters 
    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getNombreContratante() {
        return nombreContratante;
    }

    public void setNombreContratante(String nombreContratante) {
        this.nombreContratante = nombreContratante;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }
    @Override
    public void agregarTema(String nombreTema){
        if (dml< super.getCantAgregados()){
            super.getListacanciones()[dml]=nombreTema;
            dml++;
        }
    }
    public String actuar(){
        String aux;
        
        return aux;
    }
}
