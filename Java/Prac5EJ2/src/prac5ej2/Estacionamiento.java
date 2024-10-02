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
public class Estacionamiento {
    private String nombre,direccion;
    private int horaCiere,horaApertura;
    private int pisos,plazas;
    private Autos[][] matriz;
    // constructor

    public Estacionamiento(String nombre, String direccion) {
        setDireccion(direccion);
        setNombre(nombre);
        setHoraApertura(8);
        setHoraCiere(21);
        setPlazas(10);
        setPisos(5);
        setMatriz(new Autos[5-1][10-1]);
    }
    public Estacionamiento(String nombre, String direccion,int horaApertura,int horaCierre,int pisos,int plazas){
        setNombre(nombre);
        setDireccion(direccion);
        setHoraApertura(horaApertura);
        setHoraCiere(horaCiere);
        setPisos(pisos);
        setPlazas(plazas);
        setMatriz(new Autos[pisos][plazas]);
    }
    
  
    // geters and seters
    public Autos[][] getMatriz() {
        return matriz;
    }

    public void setMatriz(Autos[][] matriz) {    
        this.matriz = matriz;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getHoraCiere() {
        return horaCiere;
    }

    public void setHoraCiere(int horaCiere) {
        this.horaCiere = horaCiere;
    }

    public int getHoraApertura() {
        return horaApertura;
    }

    public void setHoraApertura(int horaApertura) {
        this.horaApertura = horaApertura;
    }

    public int getPisos() {
        return pisos;
    }

    public void setPisos(int pisos) {
        this.pisos = pisos;
    }

    public int getPlazas() {
        return plazas;
    }

    public void setPlazas(int plazas) {
        this.plazas = plazas;
    }
    
    public void ingresarAutoenpiso_x_y(Autos a,int pisoIngresado,int plazaIngresada){
        this.matriz[pisoIngresado-1][plazaIngresada-1]=a;
    }
    
    public String buscarAuto(String patenteIngresada) {
        int i = 0;
        int j = 0;
        boolean encontrado = false;

        while (i < pisos && !encontrado) {
            while (j < plazas && !encontrado) {
                if (matriz[i][j] != null && matriz[i][j].getPatente().equals(patenteIngresada)) {
                    encontrado = true;
                } else {
                    j++;
                }
            }
            if (!encontrado) {
                j = 0; // Reiniciar j para la siguiente fila
                i++;
            }
        }
        if (encontrado) {
            return "Auto encontrado en Piso: " + (i + 1) + ", Plaza: " + (j + 1);
        } else {
            return "Auto Inexistente";
        }

    }
    public void imprimirEstado(){
        int pisos = getPisos();
        int plazas = getPlazas();

        for (int i = 0; i < pisos; i++) {
            for (int j = 0; j < plazas; j++) {
                System.out.print("Piso " + (i+1) + " Plaza " + (j+1)+ ": ");
                if (this.matriz[i][j] == null) {
                    System.out.println("libre");
                } else {
                    System.out.println("el auto que ocupa es: "+ this.matriz[i][j].toString());
                }
            }
        }
    }
    
    public String imprimirTodoslasPlazas(int plazasingresada){
        int pisos=getPisos();
        int plazas=getPlazas();
        int cant=0;
        for(int i=0 ; i < pisos; i++){
            if(this.matriz[i][plazasingresada-1]!=null){
                cant++;
            }
        }
        String aux= "la cantidad de autos de todo el estacionamiento en esa plaza es" + cant;
        return aux;
    }

}
