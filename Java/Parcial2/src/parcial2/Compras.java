/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial2;

/**
 *
 * @author Yoni
 */
public abstract class Compras {
    private int nro;
    private int dmf,dml=0;
    private Productos[]productos;
    
//---------------------------Constructor---------------------------

    public Compras(int nro, int dmf) {
        this.nro = nro;
        this.dmf = dmf;
        this.productos = new Productos[dmf];
    }

    public Productos[] getProductos() {
        return productos;
    }

    public void agregarProducto(Productos x) {
        if (dml<dmf){
            this.productos[dml]=x;
            dml++;
            System.out.println("el producto ha sido cargado");
        }else {
            System.out.println("no se pudo cargar la compra");
        }
            
    }
    public double Montoapagar(){
        double precio=0;
        int i=0;
        while ( i < dml){
            precio+=this.productos[i].getPrecio();
            i++;
        }
        return precio * 1.21;
    }

    public String toString(){
        String aux= "Numero de compra " + this.nro + "\n";
        for (int i =0; i<dml; i++){
            aux += this.productos[i].toString() + "\n";       
        }
        aux+=" Precio a pagar: " + Montoapagar() + "\n";
        return aux;
    }    
}
