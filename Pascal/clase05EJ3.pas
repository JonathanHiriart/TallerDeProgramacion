{
3.Un supermercado requiere el procesamiento de sus productos. De cada producto se
conoce código, rubro (1..10), stock y precio unitario. Se pide:

a) Generar una estructura adecuada que permita agrupar los productos por rubro. A su
vez, para cada rubro, se requiere que la búsqueda de un producto por código sea lo
más eficiente posible. El ingreso finaliza con el código de producto igual a 0.

b) Implementar un módulo que reciba la estructura generada en a), un rubro y un código
de producto y retorne si dicho código existe o no para ese rubro.

c) Implementar un módulo que reciba la estructura generada en a), y retorne, para cada
rubro, el código y stock del producto con mayor código.

d) Implementar un módulo que reciba la estructura generada en a), dos códigos y
retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores
ingresados}

program clase05EJ3;
type
rubro=1..10;
producto=record
    codigo:integer;
    rubro:rubro;
    stock:integer;
    P_unitario:real;
end;
lista= ^nodo;
nodo =record
    dato:producto;
    sig:lista;
end;

arbol=^nodoArbol;

nodoArbol=record
    rubro:rubro;
    dato:lista;
    hi:arbol;
    hd:arbol;
end;

vector=array [1..10] of integer;


//modulos 

procedure generarArbol(var a:arbol);
    procedure cargarProducto(var p:producto);
    begin
        writeln('ingrese codigo');
        readln(p.codigo);
        if (p.codigo <> 0) then begin 
            writeln('ingrese rubro (1-10)');
            readln(p.rubro);
            writeln('ingrese el stock');
            readln(p.stock);
            writeln('ingrese el precio unitario ');
            readln(p.P_unitario);
        end;
    end;
    procedure agregarAdelante(var l:lista; p:producto);
    var
        nue:lista;
    begin
        new(nue); nue^.dato:=p; nue^.sig:=nil;
        l:=nue;
    end;

    procedure armarArbol(var a:arbol; p:producto);
    begin   
        if (a = nil) then begin
            new(a); a^.rubro:=p.rubro; a^.hi:=nil; a^.hd:=nil; a^.dato:=nil;
            agregarAdelante(a^.dato,p);
        end
        else begin
            if (p.rubro = a^.rubro ) then 
                agregarAdelante(a^.dato,p) 
                else if (p.rubro < a^.rubro) then 
                    armarArbol(a^.hi,p)
            else armarArbol(a^.hd,p);
        end;
    end;
var
    p:producto;
begin
    cargarProducto(p);
    if (p.codigo <> 0) then begin 
        armarArbol(a,p);
        generarArbol(a);
    end;
    
end;

function verificar(l:lista; codigo:integer):boolean;
begin
    verificar:=false;
    while l <>nil do begin
        if (l^.dato.codigo = codigo) then 
            verificar:=true;
        l:=l^.sig;
    end;
end;

procedure verificarCodigo(a:arbol; rubro:rubro; codigo:integer);
begin
    if (a <> nil) then begin
        if (a^.rubro = rubro) then begin
            if (verificar(a^.dato, codigo))then begin
                writeln('-----------------------------------');  
                writeln('existe el codigo ', codigo);
                writeln('-----------------------------------');
            end;
        end

        else if (rubro < a^.rubro) then begin
            verificarCodigo(a^.hd,rubro,codigo);
            end
            else
                verificarCodigo(a^.hi,rubro,codigo);
    end;
end;

procedure maximoCodigoPorRubro(a:arbol; var vc:vector);
    function max(l:lista):integer;
    var
        maximo:integer;
    begin
        maximo:=-999;
        while l <> nil do begin 
            if (maximo < l^.dato.codigo) then
                maximo:= l^.dato.codigo;
            l:=l^.sig;
        end;
        max:=maximo;
    end;
begin
    if (a <> nil )then begin
        vc[a^.rubro]:=max(a^.dato);
        maximoCodigoPorRubro(a^.hi,vc);
        maximoCodigoPorRubro(a^.hd,vc);
    end;
end;
procedure vaciarvecto(var vc:vector);
var
    i:integer;
begin
    for i:=1 to 10 do 
        vc[i]:=0;
end;

procedure leervc(vc:vector);
var
    i:integer;
begin
    for i:=1 to 10 do 
        writeln('el rubro ', i ,' su maximo codigo es: ',vc[i]);
end;


procedure ejericioD(a:arbol; cod1:integer; cod2:integer; var vc:vector);

    function recorrelista (l:lista; cod1:integer; cod2:integer):integer;
    var
        cant:integer;
    begin
        cant:=0;
        while (l <> nil ) do begin
            if (cod1 < l^.dato.codigo) and ( cod2 > l^.dato.codigo) then
                cant:= cant + 1;
            l:=l^.sig;
        end; 
        recorrelista:=cant;
    end;

begin
    if (a <> nil) then begin
        vc[a^.rubro]:=vc[a^.rubro] + recorrelista(a^.dato,cod1,cod2);
        ejericioD(a^.hi,cod1,cod2,vc);
        ejericioD(a^.hd,cod1,cod2,vc);
    end;
end;
//programa principal

var
    a:arbol;
    r:rubro;
    codigo,cod1,cod2:integer;
    vc:vector;

begin
    generarArbol(a);
    writeln('-----------------------------------');    
    writeln('ingrese el tipo de rubro a verificar (1-10)');
    readln(r);
    writeln('-----------------------------------');
    writeln('ingrese el codigo a verificar');
    readln(codigo);
    writeln('-----------------------------------');
    verificarCodigo(a,r,codigo);
    vaciarvecto(vc);
    maximoCodigoPorRubro(a,vc);
    leervc(vc);
    vaciarvecto(vc);
    writeln('-----------------------------------');
    writeln('ingrese cod1');
    readln(cod1);
    writeln('-----------------------------------');
    writeln('-----------------------------------');
    writeln('ingrese cod2');
    readln(cod2);
    writeln('-----------------------------------');
    ejericioD(a,cod1,cod2,vc);
    leervc(vc);
end.

// MODIFICAR PARA QUE SEA UN VECTOR DE ARBOLES PARA QUE SEA MAS EFICIENTE


{
3.Un supermercado requiere el procesamiento de sus productos. De cada producto se
conoce código, rubro (1..10), stock y precio unitario. Se pide:

a) Generar una estructura adecuada que permita agrupar los productos por rubro. A su
vez, para cada rubro, se requiere que la búsqueda de un producto por código sea lo
más eficiente posible. El ingreso finaliza con el código de producto igual a 0.

b) Implementar un módulo que reciba la estructura generada en a), un rubro y un código
de producto y retorne si dicho código existe o no para ese rubro.

c) Implementar un módulo que reciba la estructura generada en a), y retorne, para cada
rubro, el código y stock del producto con mayor código.

d) Implementar un módulo que reciba la estructura generada en a), dos códigos y
retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores
ingresados}

program clase05EJ3;
type
rubro=1..10;
producto=record
    codigo:integer;
    rubro:rubro;
    stock:integer;
    P_unitario:real;
end;

arbol=^nodoArbol;

nodoArbol=record
    dato:producto;
    hi:arbol;
    hd:arbol;
end;

vector=array [1..10] of arbol;


//modulos 


//------------------------------- generar vector de arboles-------------------------------

procedure inciarlizar(var v:vector);
var
    i:integer;
begin
    for i:=1 to 10 do 
        v[i]:=nil;
end;

procedure generarArbol(var v:vector);
    procedure cargarProducto(var p:producto);
    begin
        writeln('ingrese codigo');
        readln(p.codigo);
        if (p.codigo <> 0) then begin 
            writeln('ingrese rubro (1-10)');
            readln(p.rubro);
            writeln('ingrese el stock');
            readln(p.stock);
            writeln('ingrese el precio unitario ');
            readln(p.P_unitario);
        end;
    end;

    procedure armarArbol(var a:arbol; p:producto);
    begin
        if (a = nil) then begin
            new(a); a^.dato:=p; a^.hi:=nil; a^.hd:=nil; 
        end
        else begin
            if (p.rubro < a^.dato.rubro) then 
                armarArbol(a^.hi,p)
            else armarArbol(a^.hd,p);
        end;
    end;
var
    p:producto;
begin
    cargarProducto(p);
    if (p.codigo <> 0) then begin
        armarArbol(v[p.rubro], p);
        generarArbol(v);
    end;
    
end;

//------------------------------- inciso b -------------------------------

procedure verificarCodigo(v:vector; rubro:rubro; codigo:integer);
    procedure verificar(a:arbol; codigo:integer; var ok:boolean);
    begin
        if a <> nil then begin
            if (codigo = a^.dato.codigo) then 
                ok:=true
            else begin
                if ( codigo > a^.dato.codigo) then 
                    verificar(a^.hi,codigo,ok)
                else
                    verificar(a^.hd,codigo,ok);
            end;
        end;
    end;
var
    ok:boolean;
begin
    ok:=false;
    verificar(v[rubro],codigo,ok);
    if (ok=true) then 
        writeln('el codigo del ',rubro,' se encontro, y es: ', codigo)
    else writeln('el codigo no se encontro');
end;

//------------------------------- inciso c -------------------------------

procedure maximoCodigoPorRubro(v:vector);

	procedure buscarMaximo(a:arbol; var max:integer);
	begin
		if (a <> nil) then begin
			if (max < a^.dato.codigo)then begin
				max:=a^.dato.codigo;
				buscarMaximo(a^.hi,max);
				buscarMaximo(a^.hd,max);
			end
			else 
				buscarMaximo(a^.hd,max);
		end;
	end;

var 
	i,max:integer;
begin
    for i :=1 to 10 do begin
        max:=0;
        buscarMaximo(v[i],max);
        writeln('-----------------------------------'); 
        writeln ('el codigo maximo del rubro',i, ' es: ',max);
        writeln('-----------------------------------'); 
    end;
end;

//------------------------------- inciso d -------------------------------
procedure ejercicioD(v:vector; cod1:integer; cod2:integer);

	procedure contarProductosEntre2numeros(a:arbol; cod1:integer; cod2:integer; var cant:integer);
	begin
		if (a<>nil) then begin
			if (cod1 < a^.dato.codigo )then
				if (cod2 > a^.dato.codigo)then begin
					cant:=cant +1;
					contarProductosEntre2numeros(a^.hi,cod1,cod2,cant);
					contarProductosEntre2numeros(a^.hd,cod1,cod2,cant);
				end
				else contarProductosEntre2numeros(a^.hi,cod1,cod2,cant)
			else contarProductosEntre2numeros(a^.hd,cod1,cod2,cant);
				
		end;
	end;
var 
	i,cant:integer;
begin
	for i:=1 to 10 do begin
		cant:=0;
		contarProductosEntre2numeros(v[i],cod1,cod2,cant);
		writeln('-----------------------------------'); 
		writeln('la cantidad del rubro ',i,' es de: ',cant);
		writeln('-----------------------------------'); 
	end;
end;

//------------------------------- programa principal -------------------------------

var
    r:rubro;
    codigo,cod1,cod2:integer;
    v:vector;

begin
    inciarlizar(v);
    generarArbol(v);
    writeln('-----------------------------------');    
    writeln('ingrese el tipo de rubro a verificar (1-10)');
    readln(r);
    writeln('-----------------------------------');
    writeln('ingrese el codigo a verificar');
    readln(codigo);
    writeln('-----------------------------------');
    verificarCodigo(v,r,codigo);
    writeln('-----------------------------------');
    maximoCodigoPorRubro(v);
    writeln('-----------------------------------'); 
    writeln('ingrese el rango (primero el mas chico)');
    readln(cod1);
    writeln('ingrese el rango (segundo el mas grande)');
    readln(cod2);
    ejercicioD(v,cod1,cod2);

end.