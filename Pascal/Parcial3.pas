{
PlayStation Store requiere procesar las compras realizadas por sus clientes durante el año 2022

a)  Implementar un modulo que lea compras de videojuegos. De cada compra se lee codigo del vidiojuego,
    codigo de cliente, dia y mes. La lectura finaliza con el codigo de cliente 0.Se deben retornar 2 estructuras.

    I)  Una estructura eficiente para la busqueda por codigo de cliente.
    II) Otra estructura que almacena la cantidad de compras realizadas en cada mes.

b)  Implementar un modulo que reciba la estructura generada en el a)I, un codigo de cliente,retorne todas 
    las compras que realizo dicho cliente.

c)  Implementar un modulo que reciba la estructura generada en a)II. y retorne la misma estructura ordenada
    por cantidad de mayor a menor.


}

program parcial3;
type
    rango_dia=1..31;
    rango_meses=1..12;
    
    compra=record
        codigo:integer;
        dia:rango_dia;
        mes:rango_meses;
    end;

    arbol=^nodoarbol;

    nodoarbol=record
        dato:compra;
        hi:arbol;
        hd:arbol;
    end;

    mes=record
        mes:integer;
        cant:integer;
    end;

    vector = array [rango_meses] of mes;

    lista=^nodolista;

    nodolista=record
        dato:compra;
        sig:lista;
    end;

//------------------------- Modulos -------------------------

//------------------------- Generar estructuras -------------------------
procedure inicializarVector(var v:vector);
var i:integer;
begin
    for i:=1 to 12 do begin   
        v[i].cant:=0;
        v[i].mes:=0;    
    end;
end;
procedure leerCompra(var c:compra);
    begin
        writeln('--------------------------');
        writeln('ingrese el codigo');
        readln(c.codigo);
        if (c.codigo <> 0 )then begin
            writeln('ingrese el dia ');
            readln(c.dia);
            writeln('ingrese el mes');
            readln(c.mes);
            writeln('--------------------------');
        end;
    end;


procedure generarArbol_I(var a:arbol);
    procedure armarArbol(var a:arbol; c:compra);
    begin
        if (a=nil) then begin
            new(a); a^.dato:=c; a^.hi:=nil; a^.hd:=nil;
        end
        else begin
            if (c.codigo < a^.dato.codigo) then 
                armarArbol(a^.hi,c)
            else 
                armarArbol(a^.hd,c);
        end;
    end; 
var
    c:compra;
begin
    leerCompra(c);
    if (c.codigo <> 0 ) then begin
        armarArbol(a,c);
        generarArbol_I(a);
    end;
end;

procedure generarArbol_II(var v:vector);
    procedure llenarVector(var v:vector; c:compra);
    begin
        v[c.mes].mes:=c.mes;
        v[c.mes].cant:= v[c.mes].cant + 1; 
    end;
var
    c:compra;
begin
    leerCompra(c);
    if (c.codigo <> 0 )then begin
        llenarVector(v,c);
        generarArbol_II(v)
    end;
end;
//------------------------- inciso B -------------------------
procedure incisoB(a:arbol; codigoE:integer; var l:lista);

    procedure agregarAdelante(var l:lista; c:compra);
    var
        nue:lista;
    begin   
        new(nue); nue^.dato:=c; nue^.sig:=l;
        l:=nue;
    end;

begin
    if (a <> nil )then begin
        if (a^.dato.codigo = codigoE)then begin
            agregarAdelante(l,a^.dato);
            incisoB(a^.hd,codigoE,l);
        end
        else begin
            if (codigoE < a^.dato.codigo)then
                incisoB(a^.hd,codigoE,l)
            else    
                incisoB(a^.hi,codigoE,l);
        end;
    end;
end;
procedure informarTodasLasCompras(l:lista);
begin
    while (l<> nil) do begin
        writeln('-------------------');
        writeln('las compras del codigo ',l^.dato.codigo,' es : ');
        writeln(l^.dato.codigo);
        writeln(l^.dato.dia);
        writeln(l^.dato.mes);
        writeln('-------------------');
        l:=l^.sig;
    end;
end;
//------------------------- incisio C -------------------------
procedure incisioC(var v:vector);

    procedure imprimirV(v:vector);
    var
        i:integer;
    begin
        for i:=1 to 12 do begin
            writeln('--------------------------------------');
            writeln('el mes ', v[i].mes,' tuvo: ',v[i].cant);
            writeln('--------------------------------------');
        end;
    end;
var 
    i,j:integer; act:mes;
begin
    for i:=2 to 12 do begin
        act:=v[i];
        j:=i- 1;
        while (j > 0 ) and (v[j].cant > act.cant) do begin
            v[i+1].cant:=v[j].cant;
            v[i+1].mes:=v[j].mes;
            j:=j -1;
        end;
        v[j+1]:=act;
    end;
    imprimirV(v);
end;

//------------------------- Programa Principal -------------------------
var
    a:arbol;
    v:vector;
    l:lista;
    codigoE:integer;
begin
    a:=nil;
    l:=nil;
    inicializarVector(v);
    generarArbol_I(a);
    generarArbol_II(v);
    writeln('-------------------------');
    writeln('ingrese el codigo de cliente que quiere saber sus compras');
    readln(codigoE);
    writeln('-------------------------');
    incisoB(a,codigoE,l);
    informarTodasLasCompras(l);
    incisioC(v);

end.
