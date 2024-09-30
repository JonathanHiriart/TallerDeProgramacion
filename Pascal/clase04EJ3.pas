{3.Implementar un programa modularizado para una librería. Implementar módulos para:

a. Almacenar los productos vendidos en una estructura eficiente para la búsqueda por
código de producto. De cada producto deben quedar almacenados su código, la
cantidad total de unidades vendidas y el monto total. De cada venta se lee código de
venta, código del producto vendido, cantidad de unidades vendidas y precio unitario. El
ingreso de las ventas finaliza cuando se lee el código de venta -1.

b. Imprimir el contenido del árbol ordenado por código de producto.

c. Retornar el código de producto con mayor cantidad de unidades vendidas.

d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor
que se recibe como parámetro.

e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos
valores recibidos (sin incluir) como parámetros.}

program clase04EJ4;
type
producto=record
    codigo:integer;
    ventasTotal:integer;
    montoTotal:real;
end;
venta=record
    codigo:integer;
    cantVenta:integer;
    precio:real;
end;

arbol=^nodoarbol;
nodoarbol=record
    dato:producto;
    hi:arbol;
    hd:arbol;
end;


//modulos
procedure generarArbol(var a:arbol);
    procedure cargarVenta(var v:venta);
    begin
        writeln('-----------------------------------');
        writeln('ingrese el codigo del producto');
        readln(v.codigo);
        if v.codigo <> -1 then begin
            writeln('ingrese la cantidad del producto que se vendio');
            readln(v.cantVenta);
            writeln('ingrese el precio unitario del producto');
            readln(v.precio);
            writeln('-----------------------------------');
        end;
    end;
    procedure armarArbol(var a:arbol; v:venta);
    begin
        //si esta vacio 
        if (a= nil) then begin 
            new(a); a^.dato.codigo:=v.codigo; a^.dato.ventasTotal:=v.cantVenta; a^.dato.montoTotal:= (v.cantVenta * v.precio);
            a^.hi:=nil; a^.hd:=nil;
        end
        else begin 
            if (v.codigo = a^.dato.codigo)then begin
                a^.dato.ventasTotal:=a^.dato.ventasTotal + v.cantVenta;
                a^.dato.montoTotal:=a^.dato.montoTotal + (v.precio * v.cantVenta);
            end
            else if (v.codigo < a^.dato.codigo) then //busca la posicion del dato en el arbol 
                armarArbol(a^.hi,v) // si es menor busca en la parte izquierda 
                else 
                    armarArbol(a^.hd,v); // si es mayor busca en la parte derecha 
        end;
    end;

var
    v:venta;
begin
    cargarVenta(v);
    if (v.codigo <> -1) then begin
        armarArbol(a,v);
        generarArbol(a);
    end;
end;

procedure imprimirArbol(a:arbol);
begin
    if (a <> nil) then begin
        writeln('-----------------------------------');
        writeln('el codigo es: ',a^.dato.codigo);
        writeln('las ventas totales es: ',a^.dato.ventasTotal);
        writeln('el monto total es: ',(a^.dato.montoTotal));
        writeln('-----------------------------------');
        imprimirArbol(a^.hi); 
        imprimirArbol(a^.hd);
    end;
end;

procedure encontrarMayor(a:arbol; var max:integer; var code:integer);
    procedure mayor(p:producto; var max:integer);
    begin
        if (p.ventasTotal > max) then begin
            max:=p.ventasTotal;
            code:=p.codigo;
        end;
    end;
begin
    if (a <>nil) then begin
        mayor(a^.dato,max);
        encontrarMayor(a^.hi, max,code);
        encontrarMayor(a^.hd, max,code);
    end;
end;

procedure buscarCantInf(a:arbol; num:integer; var cant:integer);
begin
    if (a <>nil )then begin
        if (a^.dato.codigo < num)then begin
            cant:=cant+1;
            buscarCantInf(a^.hi,num,cant);
            buscarCantInf(a^.hd,num,cant);
        end
        else buscarCantInf(a^.hi,num,cant);
    end;
end;


procedure encontrarElMontoTotalEntre2nums(a:arbol; inf:integer; sup:integer; var monto:real);
begin
    if (a <> nil) then begin 
        if (a^.dato.codigo > inf ) then 
            if (a^.dato.codigo < sup ) then begin
                monto:=monto + a^.dato.montoTotal;
                encontrarElMontoTotalEntre2nums(a^.hi,inf,sup,monto);
                encontrarElMontoTotalEntre2nums(a^.hd,inf,sup,monto);    
            end
            else encontrarElMontoTotalEntre2nums(a^.hi,inf,sup,monto);
        else encontrarElMontoTotalEntre2nums(a^.hd,inf,sup,monto);  
    end;
end;


//programa principal 

var
    a:arbol;
    max,code,cant,num,inf,sup:integer;
    monto:real;
begin
    monto:=0;
    max:=0;
    code:=0;
    cant:=0;
    generarArbol(a);
    encontrarMayor(a,max,code);
    imprimirArbol(a);
    writeln('-----------------------------------');
    writeln('El codigo con mayor cantidad de ventas es: ',code,' y es de: ',max);
    writeln('-----------------------------------');
    
    writeln('-----------------------------------');
    writeln('ingrese el codigo que desea buscar');
    writeln('-----------------------------------');
    
    readln(num);
    buscarCantInf(a,num,cant);
    
    writeln('-----------------------------------');
    writeln('la cantidad de codigos menor a ',num, ' es de: ',cant);
    writeln('-----------------------------------');

    writeln('-----------------------------------');
    writeln('ingresar 2 codigos que desea buscar el monto');
    writeln('ingrese el numero inferior ');
    readln(inf);
    writeln ('ingrese el numero superior');
    readln(sup);
    writeln('-----------------------------------');

    writeln('-----------------------------------');
    encontrarElMontoTotalEntre2nums(a,inf,sup,monto);
    writeln('el monto es: ',monto:2:2);
    writeln('-----------------------------------');
end.