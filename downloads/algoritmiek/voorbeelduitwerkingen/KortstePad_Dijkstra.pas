program KortstePadDijkstra;

const max_knoop = 1000;
      oneindig = 15000;

type graaf = record
                laatste_knoop: integer;
                verbindingen: array[1..max_knoop, 1..max_knoop] of integer;
             end;
     tabel = array[1..max_knoop] of integer;


procedure LeesNetwerk (var start, eind: integer;
                       var netwerk: graaf);
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
      end;
   readln(start);
   readln(eind);
end;


procedure BerekenAfstanden (    start, eind: integer;
                                netwerk: graaf;
                            var afstanden: tabel);

var bezocht: array[1..max_knoop] of boolean;
    i, volgende: integer;
    kortste: integer;

begin
   for i := 1 to netwerk.laatste_knoop do
      begin
         afstanden[i] := oneindig;
         bezocht[i] := false;
      end;
   afstanden[start] := 0;

   volgende := start;
   while volgende <> eind do
      begin
         for i := 1 to netwerk.laatste_knoop do
            if (netwerk.verbindingen[volgende,i]>0) and
               ( (afstanden[volgende]+netwerk.verbindingen[volgende,i]) < afstanden[i] ) then
               afstanden[i] := afstanden[volgende]+netwerk.verbindingen[volgende,i];
         bezocht[volgende] := true;

         kortste := oneindig;
         for i := 1 to netwerk.laatste_knoop do
            if (not bezocht[i]) and (afstanden[i]<kortste) then
               begin
                  kortste := afstanden[i];
                  volgende := i;
               end;
      end;
end;



procedure ToonRoute(start, eind: integer;
                    netwerk: graaf;
                    afstanden: tabel);
					
var knoop, vorige, i: integer;
    pad: array[1..max_knoop] of integer;
    aantal: integer;

begin
   knoop := eind;
   aantal := 1;
   while knoop <> start do
      begin
         pad[aantal] := knoop;
         aantal := aantal+1;
         for i := 1 to netwerk.laatste_knoop do
            if (netwerk.verbindingen[i,knoop]>0) and
               (afstanden[i]+netwerk.verbindingen[i,knoop]=afstanden[knoop]) then
               vorige := i;
         knoop := vorige;
      end;
	  
   pad[aantal] := knoop;
   while aantal > 0 do
      begin
         write(pad[aantal]);
         aantal := aantal-1;
         if aantal > 0 then
            write (' - ');
      end;
   writeln;
end;

var start, eind: integer;
    netwerk: graaf;
    afstanden: tabel;

begin
   LeesNetwerk(start, eind, netwerk);
   BerekenAfstanden(start,eind, netwerk, afstanden);
   ToonRoute(start,eind, netwerk, afstanden);
end.

(*
Testinvoer:
18
1 2 5
1 3 2
1 4 8
2 5 4
3 5 3
3 6 2
4 6 4
4 8 6
5 7 2
5 9 6
6 4 3
6 7 3
7 8 2
7 9 1
7 10 7
8 7 3
8 10 5
9 10 5
1
10
*)