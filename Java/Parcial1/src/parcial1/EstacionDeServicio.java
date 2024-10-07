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
public class EstacionDeServicio {
    private String direcion;
    private Surtidores[]cantSurtidores;
    
    //-----------------------------Constructor-----------------------------

    public EstacionDeServicio(String direcion) {
        this.direcion = direcion;
        this.cantSurtidores = new Surtidores[6];
    }
    
    
    
    public void agregarSurtidor(Surtidores surtidorX){
        int i=0;
        boolean agrego=false;
        while (agrego==false && i<6 ){
            if (this.cantSurtidores[i] == null){ // busca espacio en la estacion
                this.cantSurtidores[i]=surtidorX;
                agrego=true;
            }
            i++;
        }
        if (agrego == true){
            System.out.println("el surtidor ha sido agregado correctamente");
        }else{
            System.out.println("lo siento no hay lugar");
        }
    }
    
    
    public void AgregarUnaVentaAunSurtidorN(int n ,int dni, double litros,String pago ){
        this.cantSurtidores[n-1].agregarVenta(dni,litros,pago);
    }
    
    public int maxMonto(){
        int i,pos=0;
        double actual=-9999999;
        for (i=0; i < 6; i++){
            if (this.cantSurtidores[i]!=null){
                if (actual < this.cantSurtidores[i].montoRecaudado()){
                    actual =this.cantSurtidores[i].montoRecaudado();           
                    pos=i;
                }
            }    
        }
        return pos + 1;
    }
    
    
    public String toString(){
        int i,pos=1;
        String aux="Estacion de servicio " + this.direcion + "\n";
            for ( i=0; i<6; i++){
                aux+= "Surtidor " + pos  +" "+ this.cantSurtidores[i].toString()+ " \n";
                pos++;
            
            } 
        return aux;
    }
}
