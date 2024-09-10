{ Escribir un programa que:
a. Implemente un módulo que genere aleatoriamente información de ventas de un comercio.
Para cada venta generar código de producto, fecha y cantidad de unidades vendidas. Finalizar
con el código de producto 0. Un producto puede estar en más de una venta. Se pide:

i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto. Los códigos repetidos van a la derecha.

ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendidas.

iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la lista de
las ventas realizadas del producto.
Nota: El módulo debe retornar TRES árboles.

b. Implemente un módulo que reciba el árbol generado en i. y una fecha y retorne la cantidad
total de productos vendidos en la fecha recibida.

c. Implemente un módulo que reciba el árbol generado en ii. y retorne el código de producto
con mayor cantidad total de unidades vendidas.

d. Implemente un módulo que reciba el árbol generado en iii. y retorne el código de producto
con mayor cantidad de ventas.}



program clase03EJ2;
type
//arbol 1
    venta=record
        codigo:integer;
        fecha:integer;
        cant:integer;
    end;

    arbol1=^nodo1;

    nodo1=record
        dato:venta;
        hi:arbol1;
        hd:arbol1;
    end;
// arbol 2

    venta2=record
        codigo:integer;
        cant:integer;
    end;

    arbol2=^nodo2;

    nodo2=record
        dato:venta2;
        hi:arbol2;
        hd:arbol2;
    end;

// arbol3

    venta3=record
        fecha:integer;
        cant:integer;
    end;

    lista=^nodolista;

    nodolista=record
        dato:venta3;
        sig:lista;
    end;
    arbol3=^nodo3; 

    nodo3=record
        dato:integer;
        listas:lista;
        hi:arbol3;
        hd:arbol3;
    end;

//----------------modulos--------------------






procedure generarArboles(var a1:arbol1; var a2:arbol2; var a3:arbol3);

    //---generar ventas----------
    function numeroentre(max,min:integer):integer;
    begin
        numeroentre:=random (max - min + 1) + min;
    end;

    procedure cargarVenta(var v:venta);
    begin
        v.codigo:= numeroentre(10,0);
        v.fecha:=numeroentre(10,0);
        v.cant:= numeroentre(100,0);
    end;
    
    procedure agregarAdelante(var l:lista; v:venta);
    var 
        nue:lista;
    begin
        new(nue);
        nue^.dato.fecha:=v.fecha;
        nue^.dato.cant:=v.cant;
        nue^.sig:=nil;
        l:=nue;
    end;

    //---------armar las hojas del arbol------------------

    procedure agregarA1(var a1:arbol1; v:venta);
    begin
     // si el arbol esta vacio 
        if (a1 = nil) then begin 
            new(a1); a1^.dato:=v; a1^.hi:=nil; a1^.hd:=nil;//crea el nodo y asigna los datos  
        end
        else begin 
            if (v.codigo < a1^.dato.codigo) then //busca la posicion del dato en el arbol 
                agregarA1(a1^.hi,v) // si es menor busca en la parte izquierda 
            else 
                agregarA1(a1^.hd,v); // si es mayor busca en la parte derecha 
        end;// esto se ejecuta hasta encontrar el lugar al dato y encontrar el lado correcto 
    end;


    procedure agregarA2(var a2:arbol2; v:venta);
    begin
    // si el arbol esta vacio 
        if (a2 = nil) then begin 
            //crea el nodo y asigna los datos
            new(a2); 
            a2^.dato.codigo:=v.codigo; 
            a2^.dato.cant:=v.cant;
            a2^.hi:=nil;
            a2^.hd:=nil; 
        end
        else begin
            if (v.codigo < a2^.dato.codigo) then //busca la posicion del dato en el arbol 
                agregarA2(a2^.hi,v) // si es menor busca en la parte izquierda 
            else 
                if (v.codigo = a2^.dato.codigo)then 
                    a2^.dato.cant:=a2^.dato.cant + v.cant
            else
                agregarA2(a2^.hd,v); // si es mayor busca en la parte derecha 
        end;// esto se ejecuta hasta encontrar el lugar al dato y encontrar el lado correcto 
    end;


    procedure agregarA3(var a3:arbol3; v:venta);
    begin
    // si el arbol esta vacio 
        if (a3 = nil) then begin 
            //crea el nodo y asigna los datos 
            new(a3);
            a3^.dato:=v.codigo;
            a3^.listas:=nil;
            a3^.hi:=nil;
            a3^.hd:=nil;
            agregarAdelante(a3^.listas,v);
        end
        else begin 
            if (v.codigo < a3^.dato) then //busca la posicion del dato en el arbol 
                agregarA3(a3^.hi,v)// si es menor busca en la parte izquierda 
            else 
                if (v.codigo = a3^.dato) then 
                    agregarAdelante(a3^.listas,v)
            else
                agregarA3(a3^.hd,v); // si es mayor busca en la parte derecha 
        end;// esto se ejecuta hasta encontrar el lugar al dato y encontrar el lado correcto 
    end;

    


var
    v:venta;
begin

    cargarVenta(v);
    if (v.codigo <> 0 ) then begin
        agregarA1(a1,v);
        agregarA2(a2,v);
        agregarA3(a3,v);
        generarArboles(a1,a2,a3);
    end;
    writeln('------------------------------');
    writeln('Codigo: ',v.codigo);
    writeln('Fecha: ',v.fecha);
    writeln('Cantidad: ', v.cant);
    writeln('------------------------------');
end;


//. Implemente un módulo que reciba el árbol generado en i. y una fecha y retorne la cantidad
// total de productos vendidos en la fecha recibida.
procedure productosVendidos(a1:arbol1; fecha:integer; var total:integer);
begin
    if (a1 <>nil) then  begin
        if (fecha = a1^.dato.fecha)then 
            total:=total + a1^.dato.cant;
        productosVendidos(a1^.hi,fecha,total);
        productosVendidos(a1^.hd,fecha,total);
    end;
end;

{c. Implemente un módulo que reciba el árbol generado en ii. y retorne el código de producto
con mayor cantidad total de unidades vendidas.}


procedure mayorCantidad(a2:arbol2; var max:integer; var codigo:integer);
begin
    if (a2 <>nil) then  begin
        if (max < a2^.dato.cant)then begin
            max:=a2^.dato.cant;
            codigo:=a2^.dato.codigo;
        end;
        mayorCantidad(a2^.hi,max,codigo);
        mayorCantidad(a2^.hd,max,codigo);
    end;
end;


{d. Implemente un módulo que reciba el árbol generado en iii. y retorne el código de producto
con mayor cantidad de ventas.}

procedure calcularMax(l: lista; var total: integer);
begin
    total := 0;
    while l <> nil do
    begin
        total := total + l^.dato.cant;
        l := l^.sig;
    end;
end;

procedure productoConMayorVentas(a3: arbol3; var max: integer; var code: integer);
var
    totalVentas: integer;
begin
    if a3 <> nil then
    begin
        calcularMax(a3^.listas, totalVentas);
        if totalVentas > max then
        begin
            max := totalVentas;
            code := a3^.dato;
        end;
        productoConMayorVentas(a3^.hi, max, code);
        productoConMayorVentas(a3^.hd, max, code);
    end;
end;



//------------Programa Principal------------------


var
    a1:arbol1;
    a2:arbol2;
    a3:arbol3;
    fecha:integer;
    total:integer;
    max:integer;
    codigo:integer;

begin
    randomize;
    max:=0;
    codigo:=0;
    total:=0;
    generarArboles(a1,a2,a3);
    writeln('------------------------------');
    writeln('ingrese una fecha'); readln(fecha);
    writeln('------------------------------');
    productosVendidos(a1,fecha,total);
    writeln('------------------------------');
    writeln('los productos vendidos totales es: ',total);
    writeln('------------------------------');
    mayorCantidad(a2,max,codigo);
    writeln('el codigo del producto con mayores ventas es: ',codigo);
end.