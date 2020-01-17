program MinimaalOpspannendeBoom_Kruskal;


const max_knoop = 1000;
      oneindig = 15000;

type graaf = record
                laatste_knoop: integer;
                verbindingen: array[1..max_knoop, 1..max_knoop] of integer;
             end;
     bool_tabel =  array[1..max_knoop, 1..max_knoop] of boolean;

	 
	 
procedure LeesNetwerk (var netwerk: graaf);

var van, naar: integer;
    lengte: integer;
    i, aantal_verbindingen: integer;

begin
   for van := 1 to max_knoop do
      for naar := 1 to max_knoop do
         netwerk.verbindingen[van,naar] := 0;
   netwerk.laatste_knoop := 0;

   readln(aantal_verbindingen);
   for i := 1 to aantal_verbindingen do
      begin
         readln (van, naar, lengte);
         if van > netwerk.laatste_knoop then
            netwerk.laatste_knoop := van;
         if naar > netwerk.laatste_knoop then
            netwerk.laatste_knoop := naar;
         netwerk.verbindingen[van,naar] := lengte;
         netwerk.verbindingen[naar,van] := lengte;
      end;
end;



function AllesVerbonden(verbonden: bool_tabel;
                        laatste: integer): boolean;
var i: integer;
    ok: boolean;
begin
   i := 1;
   ok := true;
   while ok and (i <= laatste) do
      begin
         ok := verbonden[1,i];
         i := i+1;
      end;
   AllesVerbonden := ok;
end;



procedure SelecteerVerbinding (    netwerk: graaf;
                                   verbonden: bool_tabel;
                               var van, naar: integer);

var v, n: integer;
    kortste: integer;

begin
   kortste := oneindig;
   for v := 1 to netwerk.laatste_knoop do
      for n := 1 to netwerk.laatste_knoop do
         if (not verbonden[v,n]) and
            (netwerk.verbindingen[v,n]>0) and
            (netwerk.verbindingen[v,n]<kortste) then
            begin
               kortste := netwerk.verbindingen[v,n];
               van := v;
               naar := n;
            end;
end;



procedure UpdateVerbonden(    van, naar: integer;
                          var verbonden: bool_tabel;
                              laatste: integer);

var i, j: integer;

begin
   for i := 1 to laatste do
      if (verbonden[van,i]) or (verbonden[naar,i]) then
         for j := 1 to laatste do
            if (verbonden[van,j]) or (verbonden[naar,j]) then
                begin
                    verbonden[i,j] := true;
                    verbonden[j,i] := true;
                end;
end;



var netwerk: graaf;
    totaal: integer;
    verbonden: bool_tabel;
    van, naar: integer;

begin
   LeesNetwerk(netwerk);
   for van := 1 to netwerk.laatste_knoop do
      for naar := 1 to netwerk.laatste_knoop do
         verbonden[van,naar] := (van=naar);
         
   totaal := 0;
   while not AllesVerbonden(verbonden,netwerk.laatste_knoop) do
      begin
         SelecteerVerbinding (netwerk, verbonden, van, naar);
         totaal := totaal + netwerk.verbindingen[van,naar];
         UpdateVerbonden(van, naar, verbonden, netwerk.laatste_knoop);
      end;
    writeln(totaal);
end.

(*
Testinvoer:
51
1 19 27
10 13 21
10 30 20
11 17 19
11 19 35
11 29 15
12 22 55
13 27 36
13 28 31
13 30 22
13 32 37
14 21 24
14 23 24
15 18 40
15 25 35
16 33 59
17 29 14
17 31 22
18 22 39
2 23 17
2 31 27
2 4 21
20 33 26
21 22 19
21 25 22
24 28 35
25 33 22
26 29 59
27 32 40
28 32 24
3 20 19
3 31 15
3 5 29
4 11 38
4 12 52
4 19 17
4 31 21
5 16 45
5 33 25
5 6 19
6 27 22
6 31 39
7 18 16
7 25 33
8 26 49
8 29 30
8 30 12
9 10 12
9 27 34
9 29 32
9 31 17
*)
