program ConvexHull_JM;

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


procedure JarvisMarch (gegevens: lijst;
                       max: integer);
var lengte: real;
    i, j, volgende: integer;
	
begin
	lengte := gegevens[1].y;
	i := 1;
	while (i < max) do
		begin
			j := i+1;
			volgende := j;
			if (gegevens[i].x < gegevens[j].x) then
				begin
					j := j+1;
					while (j <= max) do
						begin
							if RiCo(gegevens[i],gegevens[j]) >
							   RiCo(gegevens[i],gegevens[volgende]) then
								volgende := j;
							j := j+1;
						end;
				end;
			lengte := lengte + Afstand(gegevens[i], gegevens[volgende]);
			i := volgende;
		end;
    lengte := lengte + gegevens[max].y;
	writeln(lengte:0:2);
end;

var max: integer;
    gegevens: lijst;
	
begin
	LeesGegevens(gegevens, max);
	BubbleSort(gegevens, max);
	JarvisMarch (gegevens, max);
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