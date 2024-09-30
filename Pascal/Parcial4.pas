{
Una clinica necesita un sistema para el procesamiento de las atenciones realizadas a los pacientes.

    a)  Implementar un modulo que lea informacion de las atenciones.De cada atencion se lee:Dni del pacientes
        ,numero de mes, y codigo de diagnostico(1..15) . La lectura finaliza con el mes 0.
        el modulo debe retornar dos estructuras de datos:

    i)  Una estructura de datos eficiente para la busqueda por dni del paciente. Para cada DNI debe almacenar
        la cantidad total de atenciones recibidas.

    ii) otra estructura de datos con la cantidad de atenciones realizdas para cada diagnostico.


    b)  Implementar un modulo que reciba la estructura generada a)i. , dos numeros de dni y un valor entero x
        este modulo debe retornar la cantidad de pacientes con mas de x atenciones cuyos dni esten entre los 2 
        numeros del dni recibido

    c)  implemntar un modulo recursivo que reciba la estructura generada en a) ii. y retorne la cantidad de 
        diagnostico para los cuales la cantidad de atenciones fue cero.

}
program parcil4;
type 
    rango_meses=0..12;
    rango_diag=1..15;
    atencion=record
        dni:integer;
        mes:rango_meses;
        diag:rango_diag;
    end;

    arbol=^nodoarbol;

    nodoarbol=record
        dni:integer;
        cant:integer;
        hi:arbol;
        hd:arbol;
    end;

    vector=array [rango_diag] of integer;

//----------------------------- modulos -----------------------------
procedure inicializarVector(var v:vector);
var
    i:integer;
begin
    for i:=1 to 12 do 
        v[i]:=0;
end;
procedure generarArboles(var a:arbol; var v:vector);

    procedure leer(var ate:atencion);
    begin
        writeln('-------------------------');
        ate.dni:=random (10);
        writeln('el dni es: ',ate.dni);
        ate.mes:= random(12-1);
        ate.diag:= random (15- 1 + 1 ) + 1; 
        writeln('-------------------------');
    end;
    
    procedure agregarArbol(var a:arbol; ate:atencion);
    begin
        if (a = nil) then begin
            new(a); a^.cant:=1; a^.dni:=ate.dni; a^.hd:=nil;
            a^.hi:=nil;
        end
        else begin
            if (a^.dni = ate.dni) then 
                a^.cant:=a^.cant + 1
            else
                if (a^.dni > ate.dni) then 
                    agregarArbol(a^.hi,ate)
                else 
                    agregarArbol(a^.hd,ate);
        end;    
    end;
    procedure agregarVector(var v:vector; ate:atencion);
    begin
        v[ate.diag]:=v[ate.diag] + 1; 
    end;
var
    ate:atencion;
begin
    leer(ate);
    if (ate.mes <> 0) then begin
        agregarArbol(a,ate);
        agregarVector(v,ate);
        generarArboles(a,v);
    end;
end;
//----------------------------- inciso B -----------------------------
procedure inicisob(a:arbol; dni1,dni2,x:integer; var cant:integer);
begin
    if (a<>nil) then begin
        if (a^.dni > dni1) then 
            if (a^.dni < dni2) then begin
                if (a^.cant > x) then 
                    cant:=cant + 1;
                inicisob(a^.hi,dni1,dni2,x,cant);
                inicisob(a^.hd,dni1,dni2,x,cant);
            end
            else
                inicisob(a^.hi,dni1,dni2,x,cant)
        else 
            inicisob(a^.hd,dni1,dni2,x,cant); 
    end;     

end;
//----------------------------- inciso C -----------------------------
procedure inicisoC(v:vector; var cant:integer; var i:integer);
begin
    if (i <= 15) then begin
        if v[i] = 0 then 
            cant:=cant + 1;
        i:=i+1;
        inicisoC(v,cant,i);
    end;
end;

//----------------------------- programa principal -----------------------------
var
    a:arbol;
    v:vector;
    dni1,i,dni2,x,cant:integer;
begin
    randomize;
    a:=nil;
    inicializarVector(v);
    generarArboles(a,v);
    writeln('-------------------------');
    writeln('ingrese el dni 1');
    readln(dni1);
    writeln('-------------------------');
    writeln('ingrse el dni 2');
    readln(dni2);
    writeln('-------------------------');
    writeln('ingrese la cantidad de consultas');
    readln(x);
    writeln('-------------------------');
    inicisob(a,dni1,dni2,x,cant);
    writeln('la cantidad de personas con mas consultas entre ese rango es de: ',cant);
    writeln('-------------------------');
    cant:=0;
    i:=1;
    inicisoC(v,cant,i);
    writeln('-------------------------');
    writeln('la cantidad de diagnosticos fue de: ',cant);
    writeln('-------------------------');
end.