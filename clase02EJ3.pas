// 3.- Implementar un programa que invoque a los siguientes módulos.
// a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 300
// y menores a 1550 (incluidos ambos).

// b. Un módulo que reciba el vector generado en a) y lo retorne ordenado. (Utilizar lo realizado
// en la práctica anterior)

// c. Un módulo que realice una búsqueda dicotómica en el vector, utilizando el siguiente
// encabezado:
// Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
// Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
// en el vector.

program clase02EJ3;
const
    dmf:20;
type
    vector= array [1..dmf] of integer;


// modulos 
// a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 300
// y menores a 1550 (incluidos ambos).
function numeroentre(max,min:integer):integer;
begin
    numeroentre:=random (max - min + 1) + min;
end;

procedure llenarvector(var v:vector;var dml:integer);
var
    ale:integer;
begin
    ale:=random(numeroentre(1550,300));
    if (dml < dmf ) then begin
        v[dmil]:=ale;
        llenarvector(v,dml+1);
    end;
end;

// b. Un módulo que reciba el vector generado en a) y lo retorne ordenado. (Utilizar lo realizado
// en la práctica anterior)

procedure ordenarVectorInsercion(var v: vector; dimL: integer);
var
    i, j: integer;
    actual:integer;
begin
    for i:= 2 to dimL-1 do
    begin
        actual:= v[i];
        j:= i - 1;
        while (j > 0) and (v[j] > actual) do
        begin
            v[j + 1]:= v[j];
            j:= j - 1;
        end;
        v[j + 1]:= actual;
    end;
end;

// Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
// Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
// en el vector.

procedure busquedaDicotomica(v:vector; ini,fin :indice; dato:integer var pos:indice);
begin
    if ( ini > fin) then
        pos:=-1;
    else begin 
        medio:= (ini + fin) div 2;
        if (v[medio]> dato) then 
            busquedaDicotomica(v,ini,medio -1,dato, pos);
            else
                busquedaDicotomica(v,medio +1, fin,dato,pos);
    end;
end;

// program principal

var
    dml:integer;

begin
    randomize;
    dml:=1;
    llenarvector(v,dml);
    ordenarVectorInsercion(v,dml);
    busquedaDicotomica(v,1,dml,numeroentre(1550,300),pos);
    writeln('la posicion del numero es: ',pos);
end.