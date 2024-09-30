
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class Ej02Jugadores {

  
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        int DF=15;
        int i;
        double sumatotal=0;
        double jugador;
        int cant=0;
        double [] vector =new double [DF];
        //Paso 3: Crear el vector para 15 double 
        for  (i=0; i < DF ; i++){
            System.out.println("ingrese la altura del jugador : "+i);
            jugador = Lector.leerDouble();
            vector[i]= jugador;
            sumatotal=sumatotal + jugador;
        }
        double promedio=sumatotal/DF;
        System.out.println("el promedio de alturas del vector es: " + promedio);
        
        for (i=0; i<DF ; i++){
            if(promedio < vector[i]){
                cant++;
            }
        }
        System.out.println("la cantidad de jugadores arriba del promedio es: "+ cant);
    }
    
}
