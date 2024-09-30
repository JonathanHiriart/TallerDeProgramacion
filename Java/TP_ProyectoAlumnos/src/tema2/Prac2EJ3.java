/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;
import PaqueteLectura.GeneradorAleatorio;
/**3- Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
cada día se entrevistarán a 8 personas en distinto turno.
a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
40 cupos de casting.
Una vez finalizada la inscripción:
b) Informar para cada día y turno asignado, el nombre de la persona a entrevistar.
NOTA: utilizar la clase Persona. Pensar en la estructura de datos a utilizar. Para comparar
Strings use el método equals.
 *
 * @author Yoni
 */
public class Prac2EJ3 {
    public static void main(String[] args) {
        int dias=5;
        int per=8;
        Persona [][]matriz=new Persona[dias][per];
        int i=0;
        int j=0;
        
        
        //cargo las personas para el casting
        int edad=GeneradorAleatorio.generarInt(10);
        String nombre=GeneradorAleatorio.generarString(3);
        int dni=GeneradorAleatorio.generarInt(10);
        while (!(nombre.equals("ZZZ"))&&( i < dias )){ //cargo hasta que llegue la persona con el nombre "ZZZ" O terminen los dias
            
            if (j < per){ // si no se llenaron las personas
               Persona p=new Persona(nombre,dni,edad);
               matriz[i][j]= p  ;// las cargo 
               j++;
            }
            else if (i + 1 <dias) {// sino paso a la siguiente persona al otro dia 
                j=0;
                i++;
                Persona p=new Persona(nombre,dni,edad);
                matriz[i][j]=p;
            }
            nombre=GeneradorAleatorio.generarString(3);
            dni=GeneradorAleatorio.generarInt(10);
            edad=GeneradorAleatorio.generarInt(10);
        }
        for (i=0;i<dias;i++){
            for(j=0;j<per;j++){
                System.out.println(matriz[i][j].toString() + " "); 
            }
        
            System.out.println();
        }
        
        
    }
}
