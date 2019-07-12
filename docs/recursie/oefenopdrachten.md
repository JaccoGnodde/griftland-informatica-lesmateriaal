# :green_book: Oefenopdrachten

Er zijn veel typische problemen waarbij het gebruik van recursie erg handig kan zijn om tot een oplossing te komen. In dit hoofdstuk worden enkele van deze voorbeelden besproken:
[[toc]]

## Vermenigvuldigen

Het vermenigvuldigen van twee gehele getallen is een rekenkundige bewerking met hetzelfde resultaat als het herhaald optellen van steeds eenzelfde getal. Op deze manier kan het product van twee getallen dus worden berekend. De pseudocode zou er als volgt uit kunnen zien:

```
Product (a, b)

resultaat := 0;
Zolang a > 0
	resultaat := resultaat + b
	a := a-1
Product := resultaat
```


Opdracht: Ontwerp een recursief algoritme waarmee het product van twee getallen wordt berekend door middel van herhaald optellen.


## Palindroom

Een palindroom (ook wel een keerwoord of een spiegelwoord genoemd) is een woord waarin de letters symmetrisch gerangschikt zijn, zodanig dat het woord van achter naar voren gelezen hetzelfde is als van voor naar achter. Een algoritme waarmee wordt bepaald of een woord een palindroom is zou er (in pseudocode) als volgt uit kunnen zien:

```
Palindroom (woord)

x := 1
y := lengte(woord)
ok := waar
Zolang (ok) en (x < y)
    Als (woord[x]<>woord[y])
        ok := niet waar
    x := x+1
    y := y-1
Palindroom := ok
```

Opdracht: Ontwerp een algoritme voor een recursieve functie waarin wordt bepaald of een woord een palindroom is.



## Van decimaal naar binair

Er zijn verschillende manieren om de binaire representatie van een decimale waarde te bepalen. Een van deze manieren is door herhaaldelijk de decimale waarde door 2 te delen en te kijken wat de restwaarde is. Deze restwaarde wordt aan de (voorkant van de ) binaire representatie toegevoegd. Dit wordt herhaald zolang de decimale waarde groter is dan 0.

Stel dat je de binaire representatie van de decimale waarde 13 wilt berekenen. Je begint met een lege binaire representatie.

* Begin
	* Waarde: 13, Binaire representatie: ''
* Stap 1:
	* Als je 13 deelt door 2 dan is de restwaarde 1. Deze 1 wordt aan de (voorkant van de) binaire representatie toegevoegd:
	* Waarde: 6, Binaire representatie: '1'
* Stap 2:
	* Als je 6 deelt door 2 dan is de restwaarde 0. Deze 0 wordt aan de (voorkant van de) binaire representatie toegevoegd:
    * Waarde: 3, Binaire representatie: '01'
* Stap 3:
    * Als je 3 deelt door 2 dan is de restwaarde 1. Deze 1 wordt aan de (voorkant van de) binaire representatie toegevoegd:
    * Waarde: 1, Binaire representatie: '101'
* Stap 4:
    * Als je 1 deelt door 2 dan is de restwaarde 1. Deze 1 wordt aan de (voorkant van de) binaire representatie toegevoegd:
    * Waarde: 0, Binaire representatie: '1101'


Een niet recursief algoritme zou er als volgt kunnen uitzien:

```
BinString (waarde)

resultaat := ''
herhaal
    helft := waarde / 2
    restwaarde := waarde – (helft * 2)
    resultaat := restwaarde + resultaat
    waarde := helft;
totdat waarde=0;
BinString := resultaat
```


* Opmerking 1:
Er wordt in dit algoritme vanuit gegaan dat bij de berekening van getal / 2 de cijfer achter de komma wegvallen: het resultaat van deze berekening is een geheel getal.

* Opmerking 2:
Met resultaat := restwaarde+resultaat wordt bedoeld dat de waarde van rest (0 of 1) aan de voorkant van resultaat wordt geplakt.

Opdracht: Ontwerp een algoritme voor een recursieve functie waarmee de binaire representatie van een decimale waarde wordt bepaald.

