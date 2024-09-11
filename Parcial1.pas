{ Una empresa de alquiler de autos desea procesar la informacion de sus alquileres.Implementar un programa que :
* 
* a.	implementar un modulo que lea informacion de los alquileres y retorne una estructura de datos eficiente
*   para la busqueda por patente.Para cada patente deben quedar almacenados juntos todos sus alquileres. De cada alquiler se lee:
* 	DNI del cliente , patente ,mes y año. La lectura finaliza con la patente 0.
* 
* B.	implementar un modulo que reciba la estructura generada en A) y un dni D.
*  	Este modulo debe retornar la cantidad de alquileres realizados por el dni D.
* 
* C.	implementar un modulo que reciba la estructura generada en A),un año x y dos patentes a y b .
* 	Este modulo debe retornar la cantidad de alquileres realizados para las patentes entre A Y B (incluidas) durante el año X.

}
program parcial1;
TYPE
    rango_meses=1..12;
    alquiler=record
        patente:integer;
        dni:integer;
        mes:rango_meses;
        anio:integer;
    end;

    lista=^nodolista;
    nodolista=record
        dato:alquiler;
        sig:lista;
    end;

    arbol=^nodoarbol;

    nodoarbol=record
        patente:integer;
        dato:lista;
        hi:arbol;
        hd:arbol;
    end;
//---------------------- Modulos --------------------------------------------
procedure generarArbol(var a:arbol);
    procedure leerAlqui(var alqui:alquiler);
    begin
        writeln('-----------------------------------');
        writeln('ingrese la pantente');
        readln(alqui.patente);
        if (alqui.patente <> 0) then begin
            writeln('-----------------------------------');
            writeln('ingrese el dni');
            readln(alqui.dni);
            writeln('-----------------------------------');
            writeln('ingrese el mes del alquiler ');
            readln(alqui.mes);
            writeln('-----------------------------------');
            writeln('ingrese el año');
            readln(alqui.anio);
            writeln('-----------------------------------');
        end;
    end;

    procedure agregarAdelante(var l:lista; x:alquiler);
    var
        nue:lista;
    begin
        new(nue);
        nue^.dato:=x;
        nue^.sig:=nil;
        l:=nue;
    end;

    procedure agregarEnElArbol(var a:arbol; alqui:alquiler);
    begin
        if (a=nil)then begin
            new(a); a^.dato:=nil; a^.hi:=nil;
            a^.hd:=nil;
            a^.patente:=alqui.patente;
            agregarAdelante(a^.dato,alqui);
        end;
        if (a^.patente = alqui.patente)then 
            agregarAdelante(a^.dato,alqui)
        else begin
            if (a^.patente > alqui.patente) then
                agregarEnElArbol(a^.hi,alqui)
            else
                agregarEnElArbol(a^.hd,alqui);
        end;
    end;

var
    alqui:alquiler;
begin
    leerAlqui(alqui);
    if (alqui.patente <> 0 ) then begin  
        agregarEnElArbol(a,alqui);
        generarArbol(a);
    end;
end;
//---------------------- incisio B --------------------------------------------
procedure incisoB (a:arbol; dni:integer; var cant:integer);
    procedure recorrelista (l:lista; var cant:integer; dni:integer);
    begin
        while (l <> nil) do begin
            if (l^.dato.dni = dni ) then 
                cant:=cant + 1;
            l:=l^.sig;
        end;
    end;
begin
    if (a <> nil) then begin
        recorrelista(a^.dato,cant,dni);
        incisoB(a^.hi,dni,cant);
        incisoB(a^.hd,dni,cant);
    end;
end;

//---------------------- incisio B --------------------------------------------
procedure incisoC( a:arbol; min,max,anio:integer; var cant:integer);

    procedure recorrelista2(l:lista; anio:integer; var cant:integer);
    begin
        while (l<>nil) do begin
            if (l^.dato.anio = anio)then 
                cant:=cant + 1;
            l:=l^.sig;
        end;
    end;
begin
    if (a<>nil) then begin
        if (a^.patente > min) then 
            if (a^.patente < max) then begin
                recorrelista2(a^.dato,anio,cant);
                incisoC(a^.hi,min,max,anio,cant);
                incisoC(a^.hd,min,max,anio,cant); 
            end
            else incisoC(a^.hi,min,max,anio,cant)
        else
            incisoC(a^.hd,min,max,anio,cant);
    end;
end;

//----------------------programa principal--------------------------------------------
var   
    a:arbol;
    dni,cant,min,max,anio:integer;

begin
    generarArbol(a);
    writeln('-----------------------------------');
    writeln('ingrese el dni que desea buscar la cantidad de alquileres que tiene ');
    readln(dni);
    incisoB(a,dni,cant);
    writeln('-----------------------------------');
    writeln('la cantidad de alquileres realizados por el ', dni,' es de: ',cant);
    cant:=0;
    writeln('-----------------------------------');
    writeln('ingrese la patente 1');
    readln(min);
    writeln('-----------------------------------');
    writeln('ingrese la patente 2');
    readln(max);
    writeln('-----------------------------------');
    writeln('ingrese el año que desea buscar');
    readln(anio);
    writeln('-----------------------------------');
    incisoC(a,min,max,anio,cant);
    writeln('la cantidad de patentes en es año es de: ',cant);
    writeln('-----------------------------------');
end.

