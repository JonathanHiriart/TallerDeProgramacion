// 2.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de
// las expensas de dichas oficinas.
// Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
// a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina
// se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura
// finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
// b. Ordene el vector, aplicando el método de inserción, por código de identificación de la
// oficina.
// c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.

program clase01;
const
    dimF = 300;
type    
    oficina = record
        codigo: integer;
        dni: integer;
        expensa: real;
    end;
    vector = array [1..dimF] of oficina;    

procedure cargarVector(var v: vector; var dimL: integer);
var
    ofi: oficina;
begin   
    dimL:= 0;
    writeln('Ingrese el codigo de la oficina');
    readln(ofi.codigo);
    while (ofi.codigo <> -1) and (dimL < dimF) do
    begin
        writeln('Ingrese el DNI del propietario');
        readln(ofi.dni);
        writeln('Ingrese el valor de la expensa');
        readln(ofi.expensa);
        dimL:= dimL + 1;
        v[dimL]:= ofi;
        writeln('Ingrese el codigo de la oficina');
        readln(ofi.codigo);
    end;
end;

procedure ordenarVectorInsercion(var v: vector; dimL: integer);
var
    i, j: integer;
    ofi: oficina;
begin
    for i:= 2 to dimL do
    begin
        ofi:= v[i];
        j:= i - 1;
        while (j > 0) and (v[j].codigo > ofi.codigo) do
        begin
            v[j + 1]:= v[j];
            j:= j - 1;
        end;
        v[j + 1]:= ofi;
    end;
end;

procedure ordenarVectorSeleccion(var v: vector; dimL: integer);
var
    i, j, posMin: integer;
    ofi: oficina;
begin
    for i:= 1 to dimL - 1 do
    begin
        posMin:= i;
        for j:= i + 1 to dimL do
        begin
            if v[j].codigo < v[posMin].codigo then
            begin
                posMin:= j;
            end;
        end;
        ofi:= v[i];
        v[i]:= v[posMin];
        v[posMin]:= ofi;
    end;
end;

procedure imprimirVector(v: vector; dimL: integer);
var
    i: integer;
begin
    for i:= 1 to dimL do
    begin
        writeln('Codigo de la oficina: ', v[i].codigo);
        writeln('DNI del propietario: ', v[i].dni);
        writeln('Valor de la expensa: ', v[i].expensa:2:2);
    end;
end;
var
    v: vector;
    dimL: integer;
begin
    cargarVector(v, dimL);
    ordenarVectorInsercion(v, dimL);
    writeln('Vector ordenado por insercion');
    imprimirVector(v, dimL);
    ordenarVectorSeleccion(v, dimL);
    writeln('Vector ordenado por seleccion');
    imprimirVector(v, dimL);
end.

