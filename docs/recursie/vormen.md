# :green_book: Vormen

Er zijn verschillende manieren waarop recursie kan worden toegepast. De vorm waarmee het basisidee van recursie werd beschreven bestond uit het kleiner maken van een probleem door het uitvoeren van eenvoudige handelingen en daarna vervolgens de rest van het probleem oplossen (op exact dezelfde manier).

``` {1,7}
**Los op (probleem)**:

Als het probleem in één keer kan worden opgelost
    Los het probleem in één keer op
Anders
    Verklein het probleem met eenvoudige handelingen
    **Los op (rest van het probleem)**
```

Om de recursie te benadrukken zijn zowel de naam van de subroutine als de recursieve aanroep binnen de subroutine gemarkeerd met sterretjes.

Een voorbeeld hiervan is het sorteren van een rij getallen. Bij deze oplossing bestaat het sorteren uit de kleinste van de rij vooraan zetten en dan de rest van de rij verder sorteren (op precies dezelfde manier).

``` {1,9}
**Sorteer (getallen, vooraan, achteraan)**:

Als vooraan<achteraan dan
    i := vooraan+1
    Zolang i <= achteraan
        Als getallen[vooraan]>getallen[i]
            Wissel (getallen[vooraan], getallen[i])
        i := i+1
    **Sorteer (getallen, vooraan+1, achteraan)**  
```

De vorm van recursie wordt *staartrecursie* genoemd; de recursieve aanroep is de laatste opdracht in de subroutine.


Een andere vorm van recursie bestaat uit eerst een deel van het probleem op te lossen en daarna met behulp van dit deel van de oplossing de totale oplossing van het probleem maken door het uitvoeren van eenvoudige handelingen:

``` {1,6}
**Los op (probleem)**:

Als het probleem in één keer kan worden opgelost
    Los het probleem in één keer op
Anders
    **Los op (een deel van het probleem)**
    Gebruik de oplossing van het deelprobleem voor het oplossen van het totale probleem	
```
 
Deze vorm van recursie kan ook worden gebruikt voor het sorteren van een rij getallen. Het is bijvoorbeeld mogelijk om een rij getallen te sorteren door het getal dat vooraan in de rij staat op de juiste plek te zetten, nadat je de rest van de rij eerst hebt gesorteerd.

``` {1,4}
**Sorteer (getallen, vooraan, achteraan)**:

Als vooraan < achteraan
    **Sorteer (getallen, vooraan+1, achteraan)**
    i := vooraan
    Zolang (i < achteraan) en (getallen[i]>getallen[i+1])
        Wissel (getallen[i], getallen[i+1])
        i := i+1
```


Een derde vorm van recursie is een vorm waarin het probleem wordt opgeknipt in kleinere deelproblemen. Het oplossen van de deelproblemen gebeurt dan weer op exact dezelfde manier:

``` {1,6,7}
**Los op (probleem)**:

Als het probleem in één keer kan worden opgelost
    Los het probleem in één keer op
Anders
    **Los op (een deel van het probleem)**
    **Los op (de rest van het probleem)**
    Gebruik de oplossingen van de deelproblemen voor het oplossen van het totale probleem
```
 
Deze vorm van recursie is een veel gebruikte techniek om getallen te sorteren. Een voorbeeld hiervan is MergeSort. Bij deze sorteermethode wordt eerst het linkerdeel van een rij getallen gesorteerd en het rechter deel van de rij. Om de totale rij gesorteerd te krijgen hoeven de getallen in het linkerdeel en het rechterdeel alleen nog maar te worden samengevoegd.

``` {1,5,6}
**Sorteer (getallen, vooraan, achteraan)**:

Als vooraan < aantal
    midden := (vooraan+achteraan)/ 2    # naar beneden afgerond
    **Sorteer (getallen, vooraan, midden)**
    **Sorteer (getallen, midden+1, achteraan)**
    VoegSamen (getallen, vooraan, achteraan);
```

Het samenvoegen van het gesorteerde linkerdeel met het gesorteerde rechterdeel tot één gesorteerde lijst is nog wel een lastig karweitje. Dit wordt doorgaans gedaan met behulp van een hulprijtje:

```
VoegSamen (getallen, vooraan, achteraan):

midden := (vooraan+achteraan)/ 2    # naar beneden afgerond
i := vooraan
j := midden+1
plek := vooraan

Zolang (i<=midden) en (j<= achteraan)
    Als getallen[i] < getallen[j]
        hulprij[plek] := getallen[i]
        i := i+1
    Anders
        hulprij[plek] := getallen[j]
        j := j+1
    plek := plek+1

Zolang (i <= midden)
    hulprij[plek] := getallen[i]
    i := i+1
    plek := plek+1
Zolang (j <= achteraan)
    hulprij[plek] := getallen[j]
    j := j+1
    plek := plek+1

plek := vooraan
Zolang plek <= achteraan
    getallen[plek] := hulprij[plek]
    plek := plek+1
```


Alle genoemde voorbeelden tot dusver zijn voorbeelden waarin een subroutine zichzelf aanroept. Deze vorm van recursie wordt directe recursie genoemd. Recursie kan ook op een indirecte manier plaatsvinden. Deze vorm ontstaat wanneer een subroutine (A) niet zichzelf aanroept, maar een andere subroutine (B) van waaruit subroutine (A) weer wordt aangeroepen. Deze indirecte vorm van recursie wordt 'wederzijdse recursie' genoemd.