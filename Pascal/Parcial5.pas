{
Una clínica necesita un sistema para el procesamiento de las atenciones realizadas a los pacientes durante el año 2023.

a)  Implementar un módulo que lea información de las atenciones y retorne un vector donde se almacenen las atenciones agrupadas por mes. 
    Las atenciones de cada mes deben quedar almacenadas en un árbol binario de búsqueda ordenado por DNI del paciente y sólo deben almacenarse 
    DNI del paciente y código de diagnóstico. De cada atención se lee: matrícula del médico, DNI del paciente, mes y diagnóstico (valor entre L y P).
    La lectura finaliza con matrícula 0.

b)  Implementar un módulo recursivo que reciba el vector generado en a) y retorne el mes con mayor cantidad de atenciones.

c)  Implementar un módulo que reciba el vector generado en a) y un DNI de paciente, y retorne si fue atendido o no, el paciente con el DNI ingresado.

}

program Parcial5;
type
    rango_mes = 1..12;
    rango_diagnostico = (L, M , N , O ,P);

    consulta=record
        dni:integer;
        mes:rango_mes;
        diag:rango_diagnostico;
        matricula:integer;
    end;
    arbol=^nodoarbol;
    nodoarbol=record
        dni:integer;
        cod:rango_diagnostico;
        hi:arbol;
        hd:arbol;
    end;
    vector = array [rango_mes] of arbol;
//------------------------------ Modulo ------------------------------
procedure inicializarV(var v:vector);
var 
    i:integer;
begin   
    for i:=1 to 12 do 
        v[i]:= nil;
end;

procedure Generar(var v:vector);
    procedure leerConsulta(var c:consulta);
    begin
        writeln('-------------------------');
        writeln('ingrese la matricula del medico');
        readln(c.matricula);
        if (c.matricula <> 0) then begin
            writeln('ingrese el dni del paciente');
            readln(c.dni);
            writeln('ingrese el mes de la consulta');
            readln(c.mes);
            writeln('ingrese el diagnostico de la consulta');
            readln(c.diag);
            writeln('-------------------------');
        end;
    end;

    procedure llenarV(var a:arbol; c:consulta);
    begin
        if (a =nil) then begin
            new(a); a^.dni:=c.dni; a^.cod:=c.diag; a^.hi:=nil;
            a^.hd:=nil;
        end
        else begin 
            if (c.dni < a^.dni)then
                llenarV(a^.hi,c)
            else 
                llenarV(a^.hi,c); 
        end;
    end;
var
    c:consulta;
begin
    leerConsulta(c);
    if (c.matricula <> 0 )then begin
        llenarV(v[c.mes],c);
        Generar(v);
    end;
end;

procedure incisioB(v:vector; var maxmes:integer; var max:integer; var i:integer);

    procedure recorrerArbol(a:arbol; var maxmes:integer);
    begin
        if (a<>nil) then begin 
            maxmes:=maxmes +1;
            recorrerArbol(a^.hi,maxmes);
            recorrerArbol(a^.hd,maxmes);
        end;
    end;

begin
    if (i<=12) then begin
        recorrerArbol(v[i],maxmes);
        if (maxmes > max ) then 
            max:=maxmes;
        i:=i+1;
        incisioB(v,maxmes,max,i);
    end;
end;


//------------------------------ Programa Principal ------------------------------
var
    v:vector;
    max,maxmes,i:integer;
begin
    inicializarV(v);
    Generar(v);
    max:=0;
    maxmes:=0;
    i:=1;
    writeln('-------------------------');
    incisioB(v,maxmes,max,i);
    writeln('el mes con mas atenciones es: ',max);
    writeln('-------------------------');
end.
