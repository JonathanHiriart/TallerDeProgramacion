/*
3- Escriba un programa que defina una matriz de enteros de tamaño 5x5. Inicialice
la matriz con números aleatorios entre 0 y 30.
Luego realice las siguientes operaciones:
- Mostrar el contenido de la matriz en consola.
- Calcular e informar la suma de los elementos de la fila 1
- Generar un vector de 5 posiciones donde cada posición j contiene la suma
de los elementos de la columna j de la matriz. Luego, imprima el vector.
- Leer un valor entero e indicar si se encuentra o no en la matriz. En caso de
encontrarse indique su ubicación (fila y columna) en caso contrario
imprima “No se encontró el elemento”.

 */
package tema1;

import  PaqueteLectura.Lector;

import PaqueteLectura.GeneradorAleatorio;
//Paso 1. importar la funcionalidad para generar datos aleatorios 
public class Ej03Matrices {

    public static void main(String[] args) {
        int [][] matriz =  new int[5][5] ;
        int i, j;
        int sumatotal;
        sumatotal=0;
        int [] vector = new int[5];
	//Paso 2. iniciar el generador aleatorio     
        GeneradorAleatorio.iniciar();
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        for (i=0;i<5;i++){
            for (j=0; j<5; j++){
                matriz[i][j]= GeneradorAleatorio.generarInt(10);
            }
        }
        //Paso 4. mostrar el contenido de la matriz en consola
        System.out.println("la matriz generada es; ");
        for (i = 0; i < 5; i++) {
          for (j = 0; j < 5; j++) {
            System.out.print(matriz[i][j] + " ");
          }
          System.out.println();
        }
        System.out.println("------------------------------------------------------------");
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        for(i=0; i <1; i++){
            for (j=0; j<5 ;j++){
                sumatotal=sumatotal + matriz[i][j];
            }
            System.out.println("la fila "+ i + " tiene la suma de " + sumatotal);
            sumatotal=0;
        }
        
        System.out.println("------------------------------------------------------------");
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        for (j=0;j<5;j++){
            for(i=0; i < 5; i++){
                sumatotal= sumatotal +matriz[i][j];
            }
            vector[j]=sumatotal;
        }
        for(j=0; j<5; j++){
            System.out.println("la columna "+ j +" tiene la suma de " + vector[j]);
        }
        
        for(j=0; j<5; j++){
            vector[j]=0;
        
        }
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        System.out.println("------------------------------------------------------------");
        System.out.println("ingrese el numero entero que desea buscar");
        System.out.println("------------------------------------------------------------");
        int x = Lector.leerInt();
        boolean encontre = false;
        int posx=0;
        int posy=0;
        for (i=0;i<5;i++){
            for (j=0;j<5;j++){
                if (matriz[i][j]== x){
                    encontre=true;
                     posx=i;
                     posy=j;
                }
            
            }
        
        }
        System.out.println("------------------------------------------------------------");
        if (encontre == false){
            System.out.println("el numero no se encontro");
        }
        else{
            System.out.println("el numero se encontro y esta en la posicion"+ posx +" "+ posy );
            
        }
        System.out.println("------------------------------------------------------------");
    }
}
