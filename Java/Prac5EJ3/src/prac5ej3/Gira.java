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
public class Gira extends Recital{
    private String nombreGira;
    private Fechas[]cronograma;
// constructor
 
    
// geters and seters
    public String getNombreGira() {
        return nombreGira;
    }

    public void setNombreGira(String nombreGira) {
        this.nombreGira = nombreGira;
    }

    public Fechas[] getCronograma() {
        return cronograma;
    }

    public void setCronograma(Fechas[] cronograma) {
        this.cronograma = cronograma;
    }
}
