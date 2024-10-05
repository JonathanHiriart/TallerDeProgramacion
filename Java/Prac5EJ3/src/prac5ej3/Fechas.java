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
public class Fechas {
    private String ciudad;
    private int dia;
// constructor
    public Fechas(String ciudad, int dia) {
        setCiudad(ciudad);
        setDia(dia);
    }
// geters and seters 
    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }
}
