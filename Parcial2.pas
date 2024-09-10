{	
* una casa de comidas para llevar necesita el procesamiento de los pedidos de combos realizados por los clientes 
* durante el agosto 2024.De cada pedido se conoce el numero de cliente , dia , cantidad de combos y monto pagado.
* 
* a.	implementar un modulo que lea pedidos, genere y retorne una estructura adecuada para la busqueda por numero de cliente
* 	donde para cada numero de cliente se almacene junto a todos sus pedidos (dia, canditadad de combos y monto ) que realizo.
* 	La lectura finaliza con el cliente 0.
* 
* b.	implementar un modulo que reciba la estructura generada en a) y un numero de cliente y retorne todos sus pedidos que realizo dicho cliente.
* 
* c.	realice un modulo recursivo que reciba la informacion retornada en el inciso b) y retorne el monto total abonado por el cliente.
* 
* }
program parcial2;
TYPE 
//------------------ type ------------------	
	pedido=record
		cod:integer;
		dia:integer;
		cantCombos:integer;
		monto:real;
	end;
	
	lista=^nodolista;

	nodolista=record
		dato:pedido;
		sig:lista;
	end;
	
	arbol=^nodoarbol;
	
	nodoarbol=record
		codigo:integer;
		dato:lista;
		hi:arbol;
		hd:arbol;
	end;
//------------------ modulos ------------------	
//------------------ Generar Arbol ------------------	
	procedure generarArbol (var a:arbol);

		procedure leerPedido(var p:pedido);
		begin
			writeln('ingrese el su numero de cliente');
			readln(p.cod);
				if (p.cod <> 0) then begin
					writeln('ingrese el dia del pedido');
					readln(p.dia);
					writeln('ingrese la cantidad de combos que ordeno ');
					readln(p.cantCombos);
					writeln('ingrese el monto de su pedido');
					readln(p.monto);
				end;
		end;
		
		procedure agregarAdelante(var l:lista; p:pedido);
		var 
			nue:lista;
		begin
			new(nue);
			nue^.dato:=p;
			nue^.sig:=nil;
			l:=nue;
		end;
		
		procedure armarArbol(var a:arbol; p:pedido);
		begin
			if (a=nil) then begin
				new(a); a^.dato:=nil; a^.codigo:=p.cod; a^.hi:=nil; a^.hd:=nil;
				agregarAdelante(a^.dato,p);
			end;
			if (p.cod=a^.codigo)then 
				agregarAdelante(a^.dato,p);
			if (p.cod > a^.codigo) then 
				armarArbol(a^.hd,p)
			else
				armarArbol(a^.hi,p);
		end;
	var
		p:pedido;
	begin
		leerPedido(p);
			if (p.cod<>0 )then begin
				armarArbol(a,p);
				generarArbol(a);
			end;
	end;
//------------------ inciso B ------------------------------------	
	procedure incisoB (a:arbol; codigoE:integer; var cant:integer);

		procedure recorrelista(l:lista; var cant:integer);
		begin
			while l<> nil do begin
				cant:=cant +1;
				l:=l^.sig;
			end;
		end;
	begin
		if (a <> nil) then begin
			if (codigoE = a^.codigo)then
				recorrelista(a^.dato,cant)
			else begin
				if (codigoE < a^.codigo) then 
					incisoB(a^.hd,codigoE,cant)
				else
					incisoB(a^.hi,codigoE,cant);
			end;
		end;
	end;
//------------------ inciso C ------------------------------------	
	procedure incisoC(a:arbol; codigoE:integer; var monto:real);

		procedure montoTotal(l:lista; var monto:real);
		begin
			if (l<>nil) then begin
				monto:=monto + l^.dato.monto;
				montoTotal(l^.sig, monto);
			end;
		end;
	begin
		if (a <> nil) then begin
			if (codigoE = a^.codigo)then begin
				montoTotal(a^.dato,monto);
			end
			else begin
				if (codigoE < a^.codigo) then 
					incisoC(a^.hd,codigoE,monto)
				else
					incisoC(a^.hi,codigoE,monto);
		end;
	end;		
end;
//------------------ programa principal ------------------------------------	
var
	numeroCliente:integer;
	cant:integer;
	monto:real;
	a:arbol;
begin
	cant:=0;
	generarArbol(a);
	writeln('ingrese el numero de cliente que desea buscar sus pedidos ');
	readln(numeroCliente);
	incisoB(a,numeroCliente,cant);
	writeln('la cantidad de pedidos que tiene ese numero de cliente es: ',cant);
	cant:=0;
	incisoC(a,numeroCliente,monto);
	writeln('el monto total para ese cliente es de : ',monto);
end.
