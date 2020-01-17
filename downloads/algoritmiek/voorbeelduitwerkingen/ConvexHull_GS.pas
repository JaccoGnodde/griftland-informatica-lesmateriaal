program ConvexHull_GS;

type coordinaat = record
                     x, y: integer;
                  end;
     lijst = array[1..1000] of coordinaat;



procedure Wissel (var c1, c2: coordinaat);

var c3: coordinaat;

begin
   c3 := c1;
   c1 := c2;
   c2 := c3;
end;



procedure BubbleSort (var gegevens: lijst;
                          max: integer);

var i, laatste: integer;
    verwisseld: boolean;
	
begin
   laatste := max;
   repeat
      i := 1;
      verwisseld := false;
      while (i < laatste) do
         begin
            if (gegevens[i].x > gegevens[i+1].x) or
               ( (gegevens[i].x = gegevens[i+1].x) and
			     (gegevens[i].y > gegevens[i+1].y) ) then
               begin
                  Wissel (gegevens[i], gegevens[i+1]);
                  verwisseld := true;
               end;
            i := i+1;
         end;
      laatste := laatste-1;
   until not verwisseld;
end;



procedure VerwijderRechtBovenElkaar(var gegevens: lijst;
                                    var max: integer);

var i, j: integer;

begin
   i := 1;
   while (i < max) do
      begin
         if gegevens[i].x = gegevens[i+1].x then
            begin
               j := i+1;
               while j < max do
                  begin
                      gegevens[j] := gegevens[j+1];
                      j := j+1;
                  end;
               max := max-1;   
            end;
         i := i+1;   
      end;
end;


procedure LeesGegevens (var gegevens: lijst;
                        var max: integer);
	
var i, aantal: integer;
	links, hoogte, rechts: integer;
	
begin
	readln (aantal);
	max := 0;
	for i := 1 to aantal do
		begin
			readln(links, hoogte, rechts);
			max := max+1;
			gegevens[max].x := links;
			gegevens[max].y := hoogte;
			max := max+1;
			gegevens[max].x := rechts;
			gegevens[max].y := hoogte;
		end;
end;



function RiCo (c1, c2: coordinaat): real;

begin
   Rico := (c2.y-c1.y) / (c2.x-c1.x);
end;



function Afstand (c1, c2: coordinaat): real;

begin
   Afstand := sqrt(sqr(c2.x-c1.x) + sqr(c2.y-c1.y));
end;



procedure GrahamsScan (gegevens: lijst;
                       max: integer);

var markering: array[1..1000] of boolean;
    hp1, hp2, hp3: integer;
    lengte: real;
   
begin
   (* Markeer Punten *)
   hp1 := 1; hp2 := 2; hp3 := 3;
   markering[hp1] := true;
   markering[hp2] := true;
   markering[hp3] := true;
   while (hp3 <= max) do
      begin
	     while (hp1 >= 1) and
               ( RiCo(gegevens[hp2],gegevens[hp3]) > RiCo(gegevens[hp1],gegevens[hp2]) ) do
            begin
               markering[hp2] := false;
               hp2 := hp1;
               repeat
                  hp1 := hp1-1;
               until markering[hp1];
            end;
         hp1 := hp2;
         hp2 := hp3;
         hp3 := hp3+1;
         markering[hp3] := true;
      end;

  
   (* Bereken Lengte *)  
   hp1 := 1;
   lengte := gegevens[hp1].y;
   hp2 := 2;
   while (hp2 < max) do
      begin
         while not markering[hp2] do
            hp2 := hp2+1;
	     lengte := lengte + Afstand (gegevens[hp1], gegevens[hp2]);
         hp1 := hp2;
         hp2 := hp2+1;
      end;
   lengte := lengte + Afstand(gegevens[hp1], gegevens[hp2]) + gegevens[hp2].y;
   writeln(lengte:0:2);
end;



var max: integer;
    gegevens: lijst;
	
begin
	LeesGegevens(gegevens, max);
	BubbleSort(gegevens, max);
    VerwijderRechtBovenElkaar(gegevens,max);
	GrahamsScan (gegevens, max);	
end.

(*
Testinvoer:
9
0 5 7
2 12 7
6 10 10
9 13 12
11 17 15
14 8 18
17 14 20
17 6 23
22 3 28
*)