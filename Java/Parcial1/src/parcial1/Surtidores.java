/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial1;

/**
 *
 * @author Yoni
 */
public class Surtidores {
    private String TipoDeCombustible;
    private double precio;
    private Ventas[] venta;
    private int cantVentasmax;
    private int dml;
    
    
    //-----------------------------Constructor-----------------------------

    public Surtidores(String TipoDeCombustible, double precio, int cantVentasmax) {
        this.TipoDeCombustible = TipoDeCombustible;
        this.precio = precio;
        this.cantVentasmax= cantVentasmax;
        this.venta = new Ventas[cantVentasmax];
        this.dml=0;
    }
    
    public void agregarVenta(int dni,double litros, String pago){
        Ventas venta1= new Ventas(dni,precio, litros, pago);
        if (dml<cantVentasmax){
            this.venta[dml]=venta1;
            dml++;
            System.out.println("la venta ha sido cargado");
        }else {
            System.out.println("los siento no se pudo cargar la venta");
        }
    }
    public double montoRecaudado(){
        int i,monto;
        monto=0;
        for(i=0;i < dml;i++){
            if (this.venta[i]!=null ){
                if (this.venta[i].getMetodoDePago().equals("efectivo")){
                    monto+= this.venta[i].getMonto();
                }
            }
        }
        return monto;
    }
    @Override
    public String toString(){
        String aux= "Combustible dispensado: " + this.TipoDeCombustible +
                    " precio por litro : "+ this.precio +
                    " ventas: ";
                    for (int i = 0 ; i< dml; i++){
                        aux += " "+ this.venta[i].toString();
                    }
        return aux;
    }
}
