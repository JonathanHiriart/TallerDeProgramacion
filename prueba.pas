program parcial7;
type
	subrMes = 1..12;
	  subrDiagnostico = 'L'..'P';
	
	atencion = record
		matricula:integer;
		dni:integer;
		mes:subrMes;
		diagnostico:subrDiagnostico;
	end;
	
	arbol = ^nodo;
	
	nodo= record
		dni:integer;
		diagnostico:subrDiagnostico;
		hI:arbol;
		hD:arbol;
	end;
	
	vector = array [subrMes] of arbol;
	
	
	procedure inicializarV(var v:vector);
	var
	i:integer;
	begin
		for i:=1 to 12 do 
			v[i]:=nil;
	end;

	procedure cargarVector(var v:vector);
	
	
		procedure leerElemento(var elem:atencion);
		begin
			writeln('íngrese matricula del doc: ');
			readln(elem.matricula);
			writeln;
			writeln('matricula: ', elem.matricula);
			if(elem.matricula<>0) then begin
				writeln('íngrese dni: ');
				readln(elem.dni);
				writeln;
				writeln('dni: ', elem.dni);
				writeln;
				writeln('íngrese mes: ');
				readln(elem.mes);
				writeln;
				writeln('mes: ', elem.mes);
				writeln;
				writeln('íngrese diagnostico: ');
				readln(elem.diagnostico);
				writeln;
				writeln('diagnostico: ', elem.diagnostico);
				writeln;
			end;
		end;
		
		procedure llenarVector(var v:vector; elem:atencion);
		
			procedure llenarArbol(var a:arbol ; elem:atencion);
			begin
				if(a = nil) then begin
					new(a); a^.dni:=elem.dni; a^.diagnostico:=elem.diagnostico;
					a^.hI:=nil; a^.hD:=nil;
				end
				else if(elem.dni < a^.dni) then llenarArbol(a^.hI,elem)
				else llenarArbol(a^.hD,elem);
			end;
			
		begin
			llenarArbol(v[elem.mes], elem);
		end;
	var
	elem:atencion;
	begin
		leerElemento(elem);
		while(elem.matricula<>0) do begin
			llenarVector(v,elem);
			leerElemento(elem);
		end;
	end;
	
	procedure incisoB(v:vector);
	
		procedure recorrerArbol(a:arbol; var max:integer; var mesmax:integer; pos:integer; var cant:integer);
		begin
			if(a<>nil) then begin
				cant:=cant+1;
				recorrerArbol(a^.hI,max,mesmax,pos,cant);
				recorrerArbol(a^.hD,max,mesmax,pos,cant);
			end;
			if(cant >  max ) then begin
				max:=cant;
				mesmax:=pos;
			end;
		end;
		
	var
	max:integer;
	mesmax:integer;
	i:integer;
	cant:integer;
	begin
		cant:=0;
		max:=-99;
		mesmax:=0;
		for i:=1 to 12 do begin
			recorrerArbol(v[i],max,mesmax,i,cant);
			cant:=0;
		end;
		writeln('el mes con mayor cantidad de atencion fue :', mesmax);
		
	end;
	
	
	procedure incisoC(v:vector);
	
		procedure buscarDni(a:arbol; dni:integer; var bool:boolean);
		begin
            if a <>nil then begin
                if(dni = a^.dni) then begin
                    bool:=true;
                    buscarDni(a^.hI,dni,bool);
                    buscarDni(a^.hD,dni,bool);
                end
                else begin
                    if(dni < a^.dni) then
                        buscarDni(a^.hI,dni,bool)
                    else 
                        buscarDni(a^.hD,dni,bool);
                end;
            end;
		end;
		
	var
	dni:integer;
	i:integer;
	bool:boolean;
	begin
		bool:=false;
		writeln('ingrese dni para buscar: ');
		readln(dni);
		while(bool <> true) do begin
            writeln('estoy aca ');
			for i:=1 to 12 do begin
	    		buscarDni(v[i],dni,bool);
            end;
		end;
		if (bool)then 
			writeln('existe')
		else
			writeln('no existe')
	end;
var
v:vector;
begin
	inicializarV(v);
	cargarVector(v);
	incisoB(v);
	incisoC(v);
end.









