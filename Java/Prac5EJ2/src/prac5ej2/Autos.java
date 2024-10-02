/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prac5ej2;

/**
 *
 * @author Yoni
 */
public class Autos  {
    private String dueño;
    private String patente;
    
// constructor

    public Autos(String dueño, String patente) {
        setDueño(dueño);
        setPatente(patente);
    }

// geters and seters 
    public String getDueño() {
        return dueño;
    }

    public void setDueño(String dueño) {
        this.dueño = dueño;
    }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }

    @Override
    public String toString() {
        return "Nombre del dueño: " + dueño + ", patente:  " + patente ;
    }
    
    
}
