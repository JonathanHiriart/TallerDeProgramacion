/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;

    /**4- Sobre un nuevo programa, modifique el ejercicio anterior para considerar que:
    a) Durante el proceso de inscripción se pida a cada persona sus datos (nombre, DNI, edad)
    y el día en que se quiere presentar al casting. La persona debe ser inscripta en ese día, en el
    siguiente turno disponible. En caso de no existir un turno en ese día, informe la situación.
    La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 40 cupos de
    casting.
    Una vez finalizada la inscripción:
    b) Informar para cada día: la cantidad de inscriptos al casting ese día y el nombre de la
    persona a entrevistar en cada turno asignado.

 *
 * @author Yoni
 */
public class Prac2EJ4 {
    public static void main(String[] args) {
        int dmf=5;
        int turno=8;
        int turnoDisponible=0;
        Persona [][] matriz=new Persona[dmf][turno];
        int i;
        int [] vc=  new int [5];
        for (i=0;i<5;i++){
            vc[i]=0;
        }
        //cargo las personas para el casting
        int edad=GeneradorAleatorio.generarInt(10);
        String nombre=GeneradorAleatorio.generarString(3);
        int dni=GeneradorAleatorio.generarInt(10);
        int dia=GeneradorAleatorio.generarInt(5);// 0...4
        
        while (!(nombre.equals("zzz") && (turnoDisponible != 40))){
            if (vc[dia]< 7){
                vc[dia]++;
                Persona p = new Persona(nombre,dni,edad);
                matriz[dia][vc[dia]]= p;

                turnoDisponible++;
            }
            else{
                System.out.println("lo siento ese dia esta lleno ");
            }
            edad=GeneradorAleatorio.generarInt(10);
            nombre=GeneradorAleatorio.generarString(3);
            dni=GeneradorAleatorio.generarInt(10);
            dia=GeneradorAleatorio.generarInt(5);
                    
        }
    
    
    }
        
        
}
