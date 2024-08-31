// 2.- Escribir un programa que:
// a. Implemente un módulo recursivo que genere y retorne una lista de números enteros
// “random” en el rango 100-200. Finalizar con el número 100.
// b. Un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en el
// mismo orden que están almacenados.
// c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los valores de
// la lista en orden inverso al que están almacenados.
// d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el mínimo
// valor de la lista.
// e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y devuelva
// verdadero si dicho valor se encuentra en la lista o falso en caso contrario.

program clase02EJ2;
type 

lista=^nodo
    dato:integer;
    sig:lista;
end;

function numeroentre(max,min:integer):integer;
begin
    numeroentre:=random (max - min + 1) + min;
end;

procedure agregarnodo(var l:lista; num:integer);
var
    n:lista;
begin
    new(n);
    n^.dato:=num;
    n^.sig:=l;
    l:=n;
end;
// a. Implemente un módulo recursivo que genere y retorne una lista de números enteros
// “random” en el rango 100-200. Finalizar con el número 100.
procedure llenarlista(var l:lista);
var
    num:integer;
begin
    num:= numeroentre(200,100);
    agregarnodo(l,num);
    if (num <> 100) then
        llenarlista(l);
end;
// b. Un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en el
// mismo orden que están almacenados.
procedure imprimirEnMismoOrden(l:lista);
begin
    if ( l <> nil) then begin
        writeln(l^.dato);
        imprimirEnMismoOrden(l^.sig);
    end;
end;

// c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los valores de
// la lista en orden inverso al que están almacenados.
procedure imprimirInverso(l:lista);
begin
    if ( l <> nil) then begin
        imprimirInverso(l^.sig);
        writeln(l^.dato);
    end;
end;
// d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el mínimo
// valor de la lista.
procedure minimo(l:lista; var min:integer);
begin
    if (l^.dato <  min) then 
        min:=l^.dato;
end;

procedure listaminimo(l:lista var min>integ);
var
    min:integer
begin
    if (l <>nil) then begin
        minimo(l,min);
        listaminimo(l^.sig);
    end;
end;
// e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y devuelva
// verdadero si dicho valor se encuentra en la lista o falso en caso contrario.
function buscar(l:lista; num:integer):boolean;
begin
    if (l <> nil) then begin
        if (l^.dato = num) then
            buscar:=true
        else
            buscar:=buscar(l^.sig,num);
    end
    else
        buscar:=false;
end;
// Programa Principal

var
    l: lista;
    num: integer;
begin
    l := nil;
    
    // a. Generar y retornar una lista de números enteros "random" en el rango 100-200
    llenarlista(l);
    
    // b. Imprimir los valores de la lista en el mismo orden que están almacenados
    writeln('Valores en el mismo orden:');
    imprimirEnMismoOrden(l);
    
    // c. Imprimir los valores de la lista en orden inverso al que están almacenados
    writeln('Valores en orden inverso:');
    imprimirInverso(l);
    
    // d. Devolver el mínimo valor de la lista
    min := 200; // Inicializar el mínimo con un valor alto
    listaminimo(l, min);
    writeln('El mínimo valor de la lista es: ', min);
    
    // e. Buscar un valor en la lista
    write('Ingrese un valor a buscar: ');
    readln(num);
    if buscar(l, num) then
        writeln('El valor ', num, ' se encuentra en la lista.')
    else
        writeln('El valor ', num, ' no se encuentra en la lista.');
end.
