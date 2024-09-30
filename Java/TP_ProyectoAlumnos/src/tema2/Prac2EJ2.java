/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
/**
 * 
 * 2- Utilizando la clase Persona. Realice un programa que almacene en un vector a lo sumo
    15 personas. La información (nombre, DNI, edad) se debe generar aleatoriamente hasta
    obtener edad 0. Luego de almacenar la información:
-   Informe la cantidad de personas mayores de 65 años.
-   Muestre la representación de la persona con menor DNI.
 *
 * @author Yoni
 */
public class Prac2EJ2 {
        public static void main(String[] args) {
           int dml,i,dmf,edad,dni;
           String nombre;
           dmf=15;
           dml=0;
           Persona []vector= new Persona[dmf];
           
           
           // cargo la persona hasta que la edad sea 
        
           edad=GeneradorAleatorio.generarInt(10);
           while ((edad != 0)&&(dml < dmf)){
                nombre=GeneradorAleatorio.generarString(10);
                dni=GeneradorAleatorio.generarInt(10);
                vector[dml]=new Persona(nombre,dni,edad);
                dml++;
                edad=GeneradorAleatorio.generarInt(10);
            }
           // buscar la persona con menos de 65 años 
           int min=0;
           int pos=0;
           int cantMayores = 0;
           for (i=0;i<dml;i++){
               if (min > vector[i].getDNI()){
                   min=vector[i].getDNI();
                   pos=i;
               }
               if ( 65 <vector[i].getEdad()){
                   cantMayores++;
               
               }
           }
            System.out.println("la cantidad de personas mayores a 65 es de: " + cantMayores);
            System.out.println("la persona con el dni menor es : " );
            System.out.println(vector[pos].toString());
    }
}
