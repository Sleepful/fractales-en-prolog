/*

                    |-----------|
                    |  Portada  |
                    |-----------|

          Instituto Tecnológico de Costa Rica
              Lenguajes de Programación.
                  II Semestre 2017

          Tarea Programada: Fractales en Prolog

               Jose Pablo Vargas Campos
                     2013116365

                    |-----------|
                    |  Resumen  |
                    |-----------|

    M = Monocromatica
    S = Secuencia de colores
    C = Colores aleatorios

        Para invocar los métodos hacerlo así:
        nombremetodo_letra(niveles,tamaño).
        - donde letra puede ser ‘M‘, ‘S‘, ‘C‘.
        - Recomendable: nivel menor a 5.
        - Recomendable: tamaño menor a 600.
        - Nota: Se han incluido imagenes de los
          no orginales en un folder al igual que
          imagenes de los originales.
        - Nota: Se incluye la base de los originales
          y tambien los originales para el concurso.


                          |-------------------------------|
                          | M | S | C |   nombre metodo   |
    |---------------------|---|---|---|-------------------|
    | el copo de nieve    | ✔ | ✔ | ✔ |  copodenieve      |
    | el tapete externo   | ✔ | ✔ | ✔ |  tapeteExterno    |
    | el tapete interno   | ✔ | ✔ | ✔ |  tapeteInterno    |
    | aros                | ✔ | ✔ | ✔ |  aros             |
    | corbatín            | ✔ | ✔ | ✔ |  corbatin         |
    | panal               | ✔ | ✔ | ✔ |  panal            |
    | tonel               | ✔ | ✔ | ✔ |  tonel            |
    | estrella            | ✔ | ✔ | ✔ |  estrella         |
    | original1           | ✔ | ✔ | ✔ |  original1        |
    | original2           | ✔ | ✔ | ✔ |  original2        |
    | original3           | ✔ | ✔ | ✔ |  original3        |
    |-----------------------------------------------------|


                  |---------------------|
                  |  Manual de usuario  |
                  |---------------------|

    Se ha desarrollado el código en swi-prolog para linux,
    es necesario tener instalado este programa para ejecutar
    el código.

    Ejecutar el interprete de swi-prolog desde linea de comandos
    con el comando indicado para su distribución, suele usarse
    el comando `swipl`.

      $ swipl
      Welcome to SWI-Prolog
      ?-

    Cargar el archivo fuente:

      ?- ["Fractal-Vargas-Jose.pl"].

    Es necesario tener los archivos de la libreria logo, estos
    archivos vienen incluidos en el .rar del programa.
    Desde aquí se puede invocar a cualquiera de los metodos.

      ?- copodenieve_M(4,300).
      ?- copodenieve_S(3,400).
      ?- copodenieve_C(3,500).

      ?- corbatin_S(3,350).
      ?- corbatin_S(3,350).
      ?- corbatin_C(4,250).

      ?- panal_M(4,400).
      ?- panal_S(3,400).
      ?- panal_C(4,400).

      ?- estrella_M(9,500).
      ?- estrella_S(6,500).
      ?- estrella_C(4,500).

      ?- tapeteInterno_M(5,600).
      ?- tapeteInterno_S(4,600).
      ?- tapeteInterno_C(4,600).

      ?- tapeteExterno_M(2,300).
      ?- tapeteExterno_S(4,300).
      ?- tapeteExterno_C(3,300).

      ?- tonel_M(3,300).
      ?- tonel_S(3,300).
      ?- tonel_C(4,300).

      ?- aros_M(4,100).
      ?- aros_S(5,40).
      ?- aros_C(6,40).

      ?- original1_M(4,600).
      ?- original1_S(4,600).
      ?- original1_C(4,600).

      ?- original2_M(4,40).
      ?- original2_S(4,40).
      ?- original2_C(4,40).

      ?- original6_M(6,600).
      ?- original6_S(6,600).
      ?- original6_C(6,600).
*/





/*_____________________________________________________*/

copodenieveAux(0,Tam):-
    forward(Tam).

copodenieveAux(N,Tam):-
    Lvl is N-1,
    Seg is Tam/3,
    copodenieveAux(Lvl,Seg),
    left(60),
    copodenieveAux(Lvl,Seg),
    right(120),
    copodenieveAux(Lvl,Seg),
    left(60),
    copodenieveAux(Lvl,Seg).

copodenieve_M(Lvl,Tam):-
    logo,setpencolor(white), setbgcolor(black),
    penup, sety(-Tam), pendown,
    copodenieveAux(Lvl,Tam),
    right(120),
    copodenieveAux(Lvl,Tam),
    right(120),
    copodenieveAux(Lvl,Tam),
    hideturtle().

/*.......................*/

copodenieveAux_S(0,Tam):-
    forward(Tam).

copodenieveAux_S(N,Tam):-
    Lvl is N-1,
    Seg is Tam/3,
    setpencolor(cyan),
    copodenieveAux_S(Lvl,Seg),
    left(60),
    setpencolor(green),
    copodenieveAux_S(Lvl,Seg),
    right(120),
    setpencolor(white),
    copodenieveAux_S(Lvl,Seg),
    left(60),
    copodenieveAux_S(Lvl,Seg).

copodenieve_S(Lvl,Tam):-
    logo,setpencolor(white), setbgcolor(black),
    penup, sety(-Tam), pendown,
    copodenieveAux_S(Lvl,Tam),
    right(120),
    copodenieveAux_S(Lvl,Tam),
    right(120),
    copodenieveAux_S(Lvl,Tam),
    hideturtle().


/*.......................*/

copodenieveAux_C(0,Tam):-
    forward(Tam).

copodenieveAux_C(N,Tam):-
    Lvl is N-1,
    Seg is Tam/3,
    random(1,7,Rand1),
    colore(Rand1,Nomb1),
    setpencolor(Nomb1),
    copodenieveAux_C(Lvl,Seg),
    left(60),
    random(1,7,Rand2),
    colore(Rand2,Nomb2),
    setpencolor(Nomb2),
    copodenieveAux_C(Lvl,Seg),
    right(120),
    random(1,7,Rand3),
    colore(Rand3,Nomb3),
    setpencolor(Nomb3),
    copodenieveAux_C(Lvl,Seg),
    left(60),
    copodenieveAux_C(Lvl,Seg).

copodenieve_C(Lvl,Tam):-
    logo,setpencolor(white), setbgcolor(black),
    penup, sety(-Tam), pendown,
    copodenieveAux_C(Lvl,Tam),
    right(120),
    copodenieveAux_C(Lvl,Tam),
    right(120),
    copodenieveAux_C(Lvl,Tam),
    hideturtle().

/*_____________________________________________________*/

corbatinAux(0,Tam):-
    forward(Tam).

corbatinAux(N,Tam):-
    Lvl is N-1,
    Seg is Tam/2,
    left(60),
    corbatinAux(Lvl,Seg),
    right(120),
    corbatinAux(Lvl,Seg),
    corbatinAux(Lvl,Seg),
    left(120),
    corbatinAux(Lvl,Seg),
    right(60).


corbatin_M(Lvl,Tam):-
    logo,setpencolor(white), setbgcolor(black),
    penup, sety(-(Tam+100)), pendown,
    corbatinAux(Lvl,Tam),
    right(90),
    corbatinAux(Lvl,Tam),
    right(90),
    corbatinAux(Lvl,Tam),
    right(90),
    corbatinAux(Lvl,Tam),
    right(90),
    hideturtle().

/*.......................*/
corbatinAux_S(0,Tam):-
    forward(Tam).

corbatinAux_S(N,Tam):-
    Lvl is N-1,
    Seg is Tam/2,
    left(60),
    setpencolor(yellow),
    corbatinAux_S(Lvl,Seg),
    right(120),
    corbatinAux_S(Lvl,Seg),
    setpencolor(white),
    corbatinAux_S(Lvl,Seg),
    left(120),
    setpencolor(yellow),
    corbatinAux_S(Lvl,Seg),
    right(60).


corbatin_S(Lvl,Tam):-
    logo,setpencolor(white), setbgcolor(black),
    penup, sety(-(Tam+100)), pendown,
    corbatinAux_S(Lvl,Tam),
    right(90),
    corbatinAux_S(Lvl,Tam),
    right(90),
    corbatinAux_S(Lvl,Tam),
    right(90),
    corbatinAux_S(Lvl,Tam),
    right(90),
    hideturtle().
/*.......................*/

corbatinAux_C(0,Tam):-
    forward(Tam).

corbatinAux_C(N,Tam):-
    Lvl is N-1,
    Seg is Tam/2,
    left(60),
    random(1,7,Rand1),
    colore(Rand1,Nomb1),
    setpencolor(Nomb1),
    corbatinAux_C(Lvl,Seg),
    right(120),
    random(1,7,Rand2),
    colore(Rand2,Nomb2),
    setpencolor(Nomb2),
    corbatinAux_C(Lvl,Seg),
    random(1,7,Rand3),
    colore(Rand3,Nomb3),
    setpencolor(Nomb3),
    corbatinAux_C(Lvl,Seg),
    left(120),
    random(1,7,Rand4),
    colore(Rand4,Nomb4),
    setpencolor(Nomb4),
    corbatinAux_C(Lvl,Seg),
    right(60).


corbatin_C(Lvl,Tam):-
    logo,setpencolor(white), setbgcolor(black),
    penup, sety(-(Tam+100)), pendown,
    corbatinAux_C(Lvl,Tam),
    right(90),
    corbatinAux_C(Lvl,Tam),
    right(90),
    corbatinAux_C(Lvl,Tam),
    right(90),
    corbatinAux_C(Lvl,Tam),
    right(90),
    hideturtle().
/*_____________________________________________________*/

panalAux(0,Tam):-
    pendown,
    forward(Tam),
    penup.

panalAux(N,Tam):-
    Lvl is N-1,
    Seg2 is float(Tam)/((2/sqrt(2))+1),
    Seg is float(Seg2/sqrt(2)),

    forward(Seg),

    left(135),
    forward(Seg2),
    right(180),
    panalAux(Lvl,Seg2),
    left(45),


    right(135),
    forward(Seg2),
    left(180),
    panalAux(Lvl,Seg2),
    right(45),

    panalAux(Lvl,Seg2),

    left(45),
    forward(Seg2),
    right(180),
    panalAux(Lvl,Seg2),
    left(135),

    right(45),
    forward(Seg2),
    left(180),
    panalAux(Lvl,Seg2),
    right(135),

    forward(Seg).

panal_M(Lvl,Tam):-
    logo,setpencolor(white), setbgcolor(black),
    penup, sety(-(Tam+100)),
    setpencolor(green),
    panalAux(Lvl,Tam),
    right(90),
    panalAux(Lvl,Tam),
    right(90),
    panalAux(Lvl,Tam),
    right(90),
    panalAux(Lvl,Tam),
    right(90),
    hideturtle().


/*.......................*/

panalAux_S(0,Tam):-
    pendown,
    forward(Tam),
    penup.

panalAux_S(N,Tam):-
    Lvl is N-1,
    Seg2 is float(Tam)/((2/sqrt(2))+1),
    Seg is float(Seg2/sqrt(2)),

    forward(Seg),

    left(135),
    forward(Seg2),
    right(180),
    setpencolor(green),
    panalAux_S(Lvl,Seg2),
    left(45),


    right(135),
    forward(Seg2),
    left(180),
    setpencolor(cyan),
    panalAux_S(Lvl,Seg2),
    right(45),

    setpencolor(green),
    panalAux_S(Lvl,Seg2),

    left(45),
    forward(Seg2),
    right(180),
    setpencolor(magenta),
    panalAux_S(Lvl,Seg2),
    left(135),

    right(45),
    forward(Seg2),
    left(180),
    setpencolor(cyan),
    panalAux_S(Lvl,Seg2),
    right(135),

    forward(Seg).

panal_S(Lvl,Tam):-
    logo,setpencolor(white), setbgcolor(black),
    penup, sety(-(Tam+100)),
    setpencolor(green),
    panalAux_S(Lvl,Tam),
    right(90),
    panalAux_S(Lvl,Tam),
    right(90),
    panalAux_S(Lvl,Tam),
    right(90),
    panalAux_S(Lvl,Tam),
    right(90),
    hideturtle().

/*.......................*/

panalAux_C(0,Tam):-
    pendown,
    random(1,7,Rand2),
    colore(Rand2,Nomb2),
    setpencolor(Nomb2),
    forward(Tam),
    penup.

panalAux_C(N,Tam):-
    Lvl is N-1,
    Seg2 is float(Tam)/((2/sqrt(2))+1),
    Seg is float(Seg2/sqrt(2)),

    forward(Seg),

    left(135),
    forward(Seg2),
    right(180),
    panalAux_C(Lvl,Seg2),
    left(45),


    right(135),
    forward(Seg2),
    left(180),
    panalAux_C(Lvl,Seg2),
    right(45),

    panalAux_C(Lvl,Seg2),

    left(45),
    forward(Seg2),
    right(180),
    panalAux_C(Lvl,Seg2),
    left(135),

    right(45),
    forward(Seg2),
    left(180),
    panalAux_C(Lvl,Seg2),
    right(135),

    forward(Seg).

panal_C(Lvl,Tam):-
    logo,setpencolor(white), setbgcolor(black),
    penup, sety(-(Tam+100)),
    setpencolor(green),
    panalAux_C(Lvl,Tam),
    right(90),
    panalAux_C(Lvl,Tam),
    right(90),
    panalAux_C(Lvl,Tam),
    right(90),
    panalAux_C(Lvl,Tam),
    right(90),
    hideturtle().
/*_____________________________________________________*/

estrellaAux(0,Tam):-
    forward(Tam).

estrellaAux(N,Tam):-
    Lvl is N-1,
    Seg is float(Tam)*float(0.539),
    right(22),
    estrellaAux(Lvl,Seg),
    left(44),
    estrellaAux(Lvl,Seg),
    right(22).

estrella_M(Lvl,Tam):-
    logo,setpencolor(white), setbgcolor(black),
    penup, sety(-(Tam)+100),
    pendown,
    right(45),
    estrellaAux(Lvl,Tam),
    right(90),
    estrellaAux(Lvl,Tam),
    right(90),
    estrellaAux(Lvl,Tam),
    right(90),
    estrellaAux(Lvl,Tam),
    right(90),
    hideturtle().


/*.......................*/

estrellaAux_S(0,Tam):-
    forward(Tam).

estrellaAux_S(N,Tam):-
    Lvl is N-1,
    Seg is float(Tam)*float(0.539),
    right(22),
    setpencolor(red),
    estrellaAux_S(Lvl,Seg),
    left(44),
    setpencolor(green),
    estrellaAux_S(Lvl,Seg),
    right(22).

estrella_S(Lvl,Tam):-
    logo,setpencolor(white), setbgcolor(black),
    penup, sety(-(Tam)+100),
    pendown,
    right(45),
    estrellaAux_S(Lvl,Tam),
    right(90),
    estrellaAux_S(Lvl,Tam),
    right(90),
    estrellaAux_S(Lvl,Tam),
    right(90),
    estrellaAux_S(Lvl,Tam),
    right(90),
    hideturtle().
/*.......................*/
estrellaAux_C(0,Tam):-
    random(1,7,Rand2),
    colore(Rand2,Nomb2),
    setpencolor(Nomb2),
    forward(Tam).

estrellaAux_C(N,Tam):-
    Lvl is N-1,
    Seg is float(Tam)*float(0.539),
    right(22),
    estrellaAux_C(Lvl,Seg),
    left(44),
    estrellaAux_C(Lvl,Seg),
    right(22).

estrella_C(Lvl,Tam):-
    logo,setpencolor(white), setbgcolor(black),
    penup, sety(-(Tam)+100),
    pendown,
    right(45),
    estrellaAux_C(Lvl,Tam),
    right(90),
    estrellaAux_C(Lvl,Tam),
    right(90),
    estrellaAux_C(Lvl,Tam),
    right(90),
    estrellaAux_C(Lvl,Tam),
    right(90),
    hideturtle().
/*_____________________________________________________*/

tapeteInternoAux(0,Tam):-
    forward(Tam).

tapeteInternoAux(N,Tam):-
    Lvl is N-1,
    Seg is Tam/3,
    tapeteInternoAux(Lvl,Seg),
    right(90),
    tapeteInternoAux(Lvl,Seg),
    left(90),
    tapeteInternoAux(Lvl,Seg),
    left(90),
    tapeteInternoAux(Lvl,Seg),
    right(90),
    tapeteInternoAux(Lvl,Seg).

tapeteInterno_M(Lvl,Tam):-
    logo,setpencolor(white), setbgcolor(black),
    penup, sety(-(Tam)+100),
    pendown,
    setpencolor(red),
    tapeteInternoAux(Lvl,Tam),
    right(90),
    tapeteInternoAux(Lvl,Tam),
    right(90),
    tapeteInternoAux(Lvl,Tam),
    right(90),
    tapeteInternoAux(Lvl,Tam),
    right(90),
    hideturtle().


/*.......................*/

tapeteInternoAux_S(0,Tam):-
    forward(Tam).

tapeteInternoAux_S(N,Tam):-
    Lvl is N-1,
    Seg is Tam/3,
    setpencolor(red),
    tapeteInternoAux_S(Lvl,Seg),
    right(90),
    setpencolor(red),
    tapeteInternoAux_S(Lvl,Seg),
    left(90),
    setpencolor(white),
    tapeteInternoAux_S(Lvl,Seg),
    left(90),
    setpencolor(white),
    tapeteInternoAux_S(Lvl,Seg),
    right(90),
    setpencolor(green),
    tapeteInternoAux_S(Lvl,Seg).

tapeteInterno_S(Lvl,Tam):-
    logo,setpencolor(white), setbgcolor(black),
    penup, sety(-(Tam)+100),
    pendown,
    tapeteInternoAux_S(Lvl,Tam),
    right(90),
    tapeteInternoAux_S(Lvl,Tam),
    right(90),
    tapeteInternoAux_S(Lvl,Tam),
    right(90),
    tapeteInternoAux_S(Lvl,Tam),
    right(90),
    hideturtle().
/*.......................*/
tapeteInternoAux_C(0,Tam):-
    random(1,7,Rand2),
    colore(Rand2,Nomb2),
    setpencolor(Nomb2),
    forward(Tam).

tapeteInternoAux_C(N,Tam):-
    Lvl is N-1,
    Seg is Tam/3,
    tapeteInternoAux_C(Lvl,Seg),
    right(90),
    tapeteInternoAux_C(Lvl,Seg),
    left(90),
    tapeteInternoAux_C(Lvl,Seg),
    left(90),
    tapeteInternoAux_C(Lvl,Seg),
    right(90),
    tapeteInternoAux_C(Lvl,Seg).

tapeteInterno_C(Lvl,Tam):-
    logo,setpencolor(white), setbgcolor(black),
    penup, sety(-(Tam)-100),
    pendown,
    tapeteInternoAux_C(Lvl,Tam),
    right(90),
    tapeteInternoAux_C(Lvl,Tam),
    right(90),
    tapeteInternoAux_C(Lvl,Tam),
    right(90),
    tapeteInternoAux_C(Lvl,Tam),
    right(90),
    hideturtle().
/*_____________________________________________________*/
tapeteExternoAux(0,Tam):-
    forward(Tam).

tapeteExternoAux(N,Tam):-
    Lvl is N-1,
    Seg is Tam/3,
    tapeteExternoAux(Lvl,Seg),
    left(90),
    tapeteExternoAux(Lvl,Seg),
    right(90),
    tapeteExternoAux(Lvl,Seg),
    right(90),
    tapeteExternoAux(Lvl,Seg),
    left(90),
    tapeteExternoAux(Lvl,Seg).

tapeteExterno_M(Lvl,Tam):-
    logo,setpencolor(white), setbgcolor(black),
    penup, sety(-(Tam)-100),
    pendown,
    tapeteExternoAux(Lvl,Tam),
    right(90),
    tapeteExternoAux(Lvl,Tam),
    right(90),
    tapeteExternoAux(Lvl,Tam),
    right(90),
    tapeteExternoAux(Lvl,Tam),
    right(90),
    hideturtle().


/*.......................*/
tapeteExternoAux_S(0,Tam):-
    forward(Tam).

tapeteExternoAux_S(N,Tam):-
    Lvl is N-1,
    Seg is Tam/3,
    setpencolor(yellow),
    tapeteExternoAux_S(Lvl,Seg),
    left(90),
    setpencolor(white),
    tapeteExternoAux_S(Lvl,Seg),
    right(90),
    setpencolor(red),
    tapeteExternoAux_S(Lvl,Seg),
    right(90),
    setpencolor(white),
    tapeteExternoAux_S(Lvl,Seg),
    left(90),
    setpencolor(green),
    tapeteExternoAux_S(Lvl,Seg).

tapeteExterno_S(Lvl,Tam):-
    logo,setpencolor(white), setbgcolor(black),
    penup, sety(-(Tam)-100),
    pendown,
    tapeteExternoAux_S(Lvl,Tam),
    right(90),
    tapeteExternoAux_S(Lvl,Tam),
    right(90),
    tapeteExternoAux_S(Lvl,Tam),
    right(90),
    tapeteExternoAux_S(Lvl,Tam),
    right(90),
    hideturtle().
/*.......................*/
tapeteExternoAux_C(0,Tam):-
    random(1,7,Rand2),
    colore(Rand2,Nomb2),
    setpencolor(Nomb2),
    forward(Tam).

tapeteExternoAux_C(N,Tam):-
    Lvl is N-1,
    Seg is Tam/3,
    tapeteExternoAux_C(Lvl,Seg),
    left(90),
    tapeteExternoAux_C(Lvl,Seg),
    right(90),
    tapeteExternoAux_C(Lvl,Seg),
    right(90),
    tapeteExternoAux_C(Lvl,Seg),
    left(90),
    tapeteExternoAux_C(Lvl,Seg).

tapeteExterno_C(Lvl,Tam):-
    logo,setpencolor(white), setbgcolor(black),
    penup, sety(-(Tam)-100),
    pendown,
    tapeteExternoAux_C(Lvl,Tam),
    right(90),
    tapeteExternoAux_C(Lvl,Tam),
    right(90),
    tapeteExternoAux_C(Lvl,Tam),
    right(90),
    tapeteExternoAux_C(Lvl,Tam),
    right(90),
    hideturtle().
/*_____________________________________________________*/

tonelAux(0,Tam,_,_):-
    pendown,
    circle(Tam),
    penup.


tonelAux(N,Tam,X,Y):-
    tonelAux(0,Tam,_,_),
    Radian is 2.0944,
    Lvl    is N-1,
    Rad    is (-3+(2*sqrt(3)))*Tam,
    Move   is Tam-Rad,
    X1     is X+Move,
    Y1     is Y,
    X2     is X+(Move)*cos(Radian),
    Y2     is Y+(Move)*sin(Radian),
    X3     is X+(Move)*cos(Radian*2),
    Y3     is Y+(Move)*sin(Radian*2),
    setxy(X1,Y1),
    tonelAux(0,Rad,_,_),
    tonelAux(Lvl,Rad,X1,Y1),
    setxy(X2,Y2),
    tonelAux(0,Rad,_,_),
    tonelAux(Lvl,Rad,X2,Y2),
    setxy(X3,Y3),
    tonelAux(0,Rad,_,_),
    tonelAux(Lvl,Rad,X3,Y3).


tonel_M(Lvl,Tam):-
    Y is (-(Tam)),
    X is (Tam),
    logo,setpencolor(white), setbgcolor(black),
    penup, setxy(X,Y),
    tonelAux(Lvl,Tam,X,Y),
    hideturtle().



/*.......................*/

tonelAux_S(0,Tam,_,_):-
    pendown,
    circle(Tam),
    penup.


tonelAux_S(N,Tam,X,Y):-
    tonelAux_S(0,Tam,_,_),
    Radian is 2.0944,
    Lvl    is N-1,
    Rad    is (-3+(2*sqrt(3)))*Tam,
    Move   is Tam-Rad,
    X1     is X+Move,
    Y1     is Y,
    X2     is X+(Move)*cos(Radian),
    Y2     is Y+(Move)*sin(Radian),
    X3     is X+(Move)*cos(Radian*2),
    Y3     is Y+(Move)*sin(Radian*2),
    setxy(X1,Y1),
    setpencolor(cyan),
    tonelAux_S(0,Rad,_,_),
    tonelAux_S(Lvl,Rad,X1,Y1),
    setxy(X2,Y2),
    setpencolor(white),
    tonelAux_S(0,Rad,_,_),
    tonelAux_S(Lvl,Rad,X2,Y2),
    setxy(X3,Y3),
    setpencolor(green),
    tonelAux_S(0,Rad,_,_),
    tonelAux_S(Lvl,Rad,X3,Y3).


tonel_S(Lvl,Tam):-
    Y is (-(Tam)),
    X is (Tam),
    logo,setpencolor(white), setbgcolor(black),
    penup, setxy(X,Y),
    tonelAux_S(Lvl,Tam,X,Y),
    hideturtle().
/*.......................*/
tonelAux_C(0,Tam,_,_):-
    pendown,
    random(1,7,Rand2),
    colore(Rand2,Nomb2),
    setpencolor(Nomb2),
    circle(Tam),
    penup.


tonelAux_C(N,Tam,X,Y):-
    tonelAux_C(0,Tam,_,_),
    Radian is 2.0944,
    Lvl    is N-1,
    Rad    is (-3+(2*sqrt(3)))*Tam,
    Move   is Tam-Rad,
    X1     is X+Move,
    Y1     is Y,
    X2     is X+(Move)*cos(Radian),
    Y2     is Y+(Move)*sin(Radian),
    X3     is X+(Move)*cos(Radian*2),
    Y3     is Y+(Move)*sin(Radian*2),
    setxy(X1,Y1),
    tonelAux_C(0,Rad,_,_),
    tonelAux_C(Lvl,Rad,X1,Y1),
    setxy(X2,Y2),
    tonelAux_C(0,Rad,_,_),
    tonelAux_C(Lvl,Rad,X2,Y2),
    setxy(X3,Y3),
    tonelAux_C(0,Rad,_,_),
    tonelAux_C(Lvl,Rad,X3,Y3).


tonel_C(Lvl,Tam):-
    Y is (-(Tam)),
    X is (Tam),
    logo,setpencolor(white), setbgcolor(black),
    penup, setxy(X,Y),
    tonelAux_C(Lvl,Tam,X,Y),
    hideturtle().

/*_____________________________________________________*/
arosAux_M(0,Tam,_,_):-
    pendown,
    circle(Tam),
    penup.


arosAux_M(N,Tam,X,Y):-
    Radian is 2.0944,
    Lvl    is N-1,
    Rad    is Tam,
    Move   is Rad-(Rad/5),
    X1     is X+Move,
    Y1     is Y,
    X2     is X+(Move)*cos(Radian),
    Y2     is Y+(Move)*sin(Radian),
    X3     is X+(Move)*cos(Radian*2),
    Y3     is Y+(Move)*sin(Radian*2),
    setxy(X1,Y1),
    arosAux_M(Lvl,Rad,X1,Y1),
    setxy(X2,Y2),
    arosAux_M(Lvl,Rad,X2,Y2),
    setxy(X3,Y3),
    arosAux_M(Lvl,Rad,X3,Y3).

aros_M(Lvl,Tam):-
    Y is (-(Tam*Lvl)),
    X is (Tam),
    logo,setpencolor(white), setbgcolor(black),
    penup, setxy(X,Y),
    arosAux_M(Lvl,Tam,X,Y),
    hideturtle().
/*.......................*/
arosAux_S(0,Tam,_,_):-
    pendown,
    circle(Tam),
    penup.


arosAux_S(N,Tam,X,Y):-
    Radian is 2.0944,
    Lvl    is N-1,
    Rad    is Tam,
    Move   is Rad-(Rad/5),
    X1     is X+Move,
    Y1     is Y,
    X2     is X+(Move)*cos(Radian),
    Y2     is Y+(Move)*sin(Radian),
    X3     is X+(Move)*cos(Radian*2),
    Y3     is Y+(Move)*sin(Radian*2),
    setpencolor(blue),
    setxy(X1,Y1),
    arosAux_S(Lvl,Rad,X1,Y1),
    setpencolor(white),
    setxy(X2,Y2),
    arosAux_S(Lvl,Rad,X2,Y2),
    setpencolor(green),
    setxy(X3,Y3),
    arosAux_S(Lvl,Rad,X3,Y3).

aros_S(Lvl,Tam):-
    Y is (-(Tam*Lvl)),
    X is (Tam),
    logo,setpencolor(white), setbgcolor(black),
    penup, setxy(X,Y),
    arosAux_S(Lvl,Tam,X,Y),
    hideturtle().
/*.......................*/
arosAux_C(0,Tam,_,_):-
    pendown,
    random(1,7,Rand2),
    colore(Rand2,Nomb2),
    setpencolor(Nomb2),
    circle(Tam),
    penup.


arosAux_C(N,Tam,X,Y):-
    Radian is 2.0944,
    Lvl    is N-1,
    Rad    is Tam,
    Move   is Rad-(Rad/5),
    X1     is X+Move,
    Y1     is Y,
    X2     is X+(Move)*cos(Radian),
    Y2     is Y+(Move)*sin(Radian),
    X3     is X+(Move)*cos(Radian*2),
    Y3     is Y+(Move)*sin(Radian*2),
    setxy(X1,Y1),
    arosAux_C(Lvl,Rad,X1,Y1),
    setxy(X2,Y2),
    arosAux_C(Lvl,Rad,X2,Y2),
    setxy(X3,Y3),
    arosAux_C(Lvl,Rad,X3,Y3).

aros_C(Lvl,Tam):-
    Y is (-(Tam*Lvl)),
    X is (Tam),
    logo,setpencolor(white), setbgcolor(black),
    penup, setxy(X,Y),
    arosAux_C(Lvl,Tam,X,Y),
    hideturtle().
/*_____________________________________________________*/

circle(R):-
    get(@myturtle_class,x,X),
    get(@myturtle_class,y,Y),
    circle(_,_,R,X,Y,0,2*pi/60),
    penup,
    setxy(X,Y),
    pendown.
circle(_,_,_,_,_,X,_):-
    Lim is 2*pi,
    X>Lim,!.
circle(X,Y,R,H,K,0,Step):-
    X is H + R * cos(0),
    Y is K+R*sin(0),
    penup,
    setxy(X,Y),
    pendown,
    AlphaAux is Step,
    circle(_,_,R,H,K,AlphaAux,Step).
circle(X,Y,R,H,K,Alpha,Step):-
    X is H + R * cos(Alpha),
    Y is K+R*sin(Alpha),
    setxy(X,Y),
    AlphaAux is Alpha+Step,
    circle(_,_,R,H,K,AlphaAux,Step).


/*_____________________________________________________*/

original1Aux_M(0,Tam):-
    pendown,
    forward(Tam),
    penup.

original1Aux_M(N,Tam):-
    Lvl is N-1,
    Seg is Tam/2,
    get(@myturtle_class,x,X),
    get(@myturtle_class,y,Y),
    original1Aux_M(0,Seg),
    left(30),
    original1Aux_M(Lvl,Seg),
    setxy(X,Y),
    left(30),
    original1Aux_M(Lvl,Seg),
    setxy(X,Y),
    right(90),
    right(30),
    original1Aux_M(Lvl,Seg),
    setxy(X,Y),
    right(30),
    original1Aux_M(Lvl,Seg),
    setxy(X,Y),
    left(90).

original1_M(Lvl,Tam):-
    Ys is (-(Tam)/3),
    Xs is (Tam),
    logo,setpencolor(white), setbgcolor(black),
    penup, setxy(Xs,Ys),
    get(@myturtle_class,x,X),
    get(@myturtle_class,y,Y),
    left(90),
    original1Aux_M(Lvl,Tam),
    left(180),
    setxy(X,Y),
    original1Aux_M(Lvl,Tam),
    hideturtle().

/*.......................*/

original1Aux_S(0,Tam):-
    pendown,
    forward(Tam),
    penup.

original1Aux_S(N,Tam):-
    Lvl is N-1,
    Seg is Tam/2,
    get(@myturtle_class,x,X),
    get(@myturtle_class,y,Y),
    setpencolor(green),
    original1Aux_S(0,Seg),
    left(30),
    setpencolor(cyan),
    original1Aux_S(Lvl,Seg),
    setxy(X,Y),
    left(30),
    setpencolor(green),
    original1Aux_S(Lvl,Seg),
    setxy(X,Y),
    right(90),
    right(30),
    setpencolor(cyan),
    original1Aux_S(Lvl,Seg),
    setxy(X,Y),
    right(30),
    setpencolor(green),
    original1Aux_S(Lvl,Seg),
    setxy(X,Y),
    left(90).

original1_S(Lvl,Tam):-
    Ys is (-(Tam)/3),
    Xs is (Tam),
    logo,setpencolor(white), setbgcolor(black),
    penup, setxy(Xs,Ys),
    get(@myturtle_class,x,X),
    get(@myturtle_class,y,Y),
    left(90),
    original1Aux_S(Lvl,Tam),
    left(180),
    setxy(X,Y),
    original1Aux_S(Lvl,Tam),
    hideturtle().


/*.......................*/


original1Aux_C(0,Tam):-
    pendown,
    random(1,7,Rand2),
    colore(Rand2,Nomb2),
    setpencolor(Nomb2),
    forward(Tam),
    penup.

original1Aux_C(N,Tam):-
    Lvl is N-1,
    Seg is Tam/2,
    get(@myturtle_class,x,X),
    get(@myturtle_class,y,Y),
    setpencolor(green),
    original1Aux_C(0,Seg),
    left(30),
    setpencolor(cyan),
    original1Aux_C(Lvl,Seg),
    setxy(X,Y),
    left(30),
    setpencolor(green),
    original1Aux_C(Lvl,Seg),
    setxy(X,Y),
    right(90),
    right(30),
    setpencolor(cyan),
    original1Aux_C(Lvl,Seg),
    setxy(X,Y),
    right(30),
    setpencolor(green),
    original1Aux_C(Lvl,Seg),
    setxy(X,Y),
    left(90).

original1_C(Lvl,Tam):-
    Ys is (-(Tam)/3),
    Xs is (Tam),
    logo,setpencolor(white), setbgcolor(black),
    penup, setxy(Xs,Ys),
    get(@myturtle_class,x,X),
    get(@myturtle_class,y,Y),
    left(90),
    original1Aux_C(Lvl,Tam),
    left(180),
    setxy(X,Y),
    original1Aux_C(Lvl,Tam),
    hideturtle().

/*_____________________________________________________*/


original2Aux_M(0,Tam):-
    pendown,
    forward(Tam),
    penup.

original2Aux_M(0,_,_,_).

original2Aux_M(N,Tam,X,Y):-
    Seg1     is Tam,
    Seg2    is Tam/2,
    Rad120  is 2.0944,
    Rad90   is 1.5708,
    X1      is X+(Seg2+Seg1)*cos(Rad90),
    Y1      is Y+(Seg2+Seg1)*sin(Rad90),
    X2      is X+(Seg2+Seg1)*cos(Rad90+Rad120),
    Y2      is Y+(Seg2+Seg1)*sin(Rad90+Rad120),
    X3      is X+(Seg2+Seg1)*cos(Rad90+Rad120*2),
    Y3      is Y+(Seg2+Seg1)*sin(Rad90+Rad120*2),


    setxy(X1,Y1),
    original2Aux_M(N,Tam),

    setxy(X2,Y2),
    original2Aux_M(N,Tam),

    setxy(X3,Y3),
    original2Aux_M(N,Tam)
    .


original2Aux_M(N,Tam):-
    Lvl    is N-1,
    Seg    is Tam,
    Seg2   is Tam/2,

    get(@myturtle_class,x,X),
    get(@myturtle_class,y,Y),


    original2Aux_M(0,Seg),
    get(@myturtle_class,x,X_1),
    get(@myturtle_class,y,Y_1),
    left(120),
    original2Aux_M(0,Seg2),
    setxy(X_1,Y_1),
    left(120),
    original2Aux_M(0,Seg2),

    setxy(X,Y),

    original2Aux_M(0,Seg),
    get(@myturtle_class,x,X_2),
    get(@myturtle_class,y,Y_2),
    left(120),
    original2Aux_M(0,Seg2),
    setxy(X_2,Y_2),
    left(120),
    original2Aux_M(0,Seg2),

    setxy(X,Y),

    original2Aux_M(0,Seg),
    get(@myturtle_class,x,X_3),
    get(@myturtle_class,y,Y_3),
    left(120),
    original2Aux_M(0,Seg2),
    setxy(X_3,Y_3),
    left(120),
    original2Aux_M(0,Seg2),

    original2Aux_M(Lvl,Seg,X,Y)
    .

original2_M(Lvl,Tam):-
    Ys is (-(Tam*(Lvl+1))),
    Xs is (Tam),
    logo,setpencolor(white), setbgcolor(black),
    penup, setxy(Xs,Ys),
    original2Aux_M(Lvl,Tam),
    hideturtle().
/*.......................*/

original2Aux_S(0,Tam):-
    pendown,
    forward(Tam),
    penup.

original2Aux_S(0,_,_,_).

original2Aux_S(N,Tam,X,Y):-
    Seg1     is Tam,
    Seg2    is Tam/2,
    Rad120  is 2.0944,
    Rad90   is 1.5708,
    X1      is X+(Seg2+Seg1)*cos(Rad90),
    Y1      is Y+(Seg2+Seg1)*sin(Rad90),
    X2      is X+(Seg2+Seg1)*cos(Rad90+Rad120),
    Y2      is Y+(Seg2+Seg1)*sin(Rad90+Rad120),
    X3      is X+(Seg2+Seg1)*cos(Rad90+Rad120*2),
    Y3      is Y+(Seg2+Seg1)*sin(Rad90+Rad120*2),


    setxy(X1,Y1),
    original2Aux_S(N,Tam),

    setxy(X2,Y2),
    original2Aux_S(N,Tam),

    setxy(X3,Y3),
    original2Aux_S(N,Tam)
    .

original2Aux_S(N,Tam):-
    Lvl    is N-1,
    Seg    is Tam,
    Seg2   is Tam/2,

    get(@myturtle_class,x,X),
    get(@myturtle_class,y,Y),


    setpencolor(cyan),
    original2Aux_S(0,Seg),
    get(@myturtle_class,x,X_1),
    get(@myturtle_class,y,Y_1),

    setpencolor(blue),
    left(120),
    original2Aux_S(0,Seg2),
    setxy(X_1,Y_1),
    setpencolor(cyan),
    left(120),
    original2Aux_S(0,Seg2),

    setxy(X,Y),

    setpencolor(cyan),
    original2Aux_S(0,Seg),
    get(@myturtle_class,x,X_2),
    get(@myturtle_class,y,Y_2),
    left(120),

    original2Aux_S(0,Seg2),
    setxy(X_2,Y_2),
    setpencolor(blue),
    left(120),
    original2Aux_S(0,Seg2),

    setxy(X,Y),

    setpencolor(blue),
    original2Aux_S(0,Seg),
    get(@myturtle_class,x,X_3),
    get(@myturtle_class,y,Y_3),
    left(120),

    setpencolor(cyan),
    original2Aux_S(0,Seg2),
    setxy(X_3,Y_3),
    left(120),
    original2Aux_S(0,Seg2),

    original2Aux_S(Lvl,Seg,X,Y)
    .


original2_S(Lvl,Tam):-
    Ys is (-(Tam*(Lvl+1))),
    Xs is (Tam),
    logo,setpencolor(white), setbgcolor(black),
    penup, setxy(Xs,Ys),
    original2Aux_S(Lvl,Tam),
    hideturtle().

/*.......................*/

original2Aux_C(0,Tam):-
    pendown,
    random(1,7,Rand2),
    colore(Rand2,Nomb2),
    setpencolor(Nomb2),
    forward(Tam),
    penup.

original2Aux_C(0,_,_,_).

original2Aux_C(N,Tam,X,Y):-
    Seg1     is Tam,
    Seg2    is Tam/2,
    Rad120  is 2.0944,
    Rad90   is 1.5708,
    X1      is X+(Seg2+Seg1)*cos(Rad90),
    Y1      is Y+(Seg2+Seg1)*sin(Rad90),
    X2      is X+(Seg2+Seg1)*cos(Rad90+Rad120),
    Y2      is Y+(Seg2+Seg1)*sin(Rad90+Rad120),
    X3      is X+(Seg2+Seg1)*cos(Rad90+Rad120*2),
    Y3      is Y+(Seg2+Seg1)*sin(Rad90+Rad120*2),


    setxy(X1,Y1),
    original2Aux_C(N,Tam),

    setxy(X2,Y2),
    original2Aux_C(N,Tam),

    setxy(X3,Y3),
    original2Aux_C(N,Tam)
    .


original2Aux_C(N,Tam):-
    Lvl    is N-1,
    Seg    is Tam,
    Seg2   is Tam/2,

    get(@myturtle_class,x,X),
    get(@myturtle_class,y,Y),


    setpencolor(cyan),
    original2Aux_C(0,Seg),
    get(@myturtle_class,x,X_1),
    get(@myturtle_class,y,Y_1),

    setpencolor(white),
    left(120),
    original2Aux_C(0,Seg2),
    setxy(X_1,Y_1),
    left(120),
    original2Aux_C(0,Seg2),

    setxy(X,Y),

    setpencolor(green),
    original2Aux_C(0,Seg),
    get(@myturtle_class,x,X_2),
    get(@myturtle_class,y,Y_2),
    left(120),

    setpencolor(white),
    original2Aux_C(0,Seg2),
    setxy(X_2,Y_2),
    left(120),
    original2Aux_C(0,Seg2),

    setxy(X,Y),

    setpencolor(blue),
    original2Aux_C(0,Seg),
    get(@myturtle_class,x,X_3),
    get(@myturtle_class,y,Y_3),
    left(120),

    setpencolor(white),
    original2Aux_C(0,Seg2),
    setxy(X_3,Y_3),
    left(120),
    original2Aux_C(0,Seg2),

    original2Aux_C(Lvl,Seg,X,Y)
    .

original2_C(Lvl,Tam):-
    Ys is (-(Tam*(Lvl+1))),
    Xs is (Tam),
    logo,setpencolor(white), setbgcolor(black),
    penup, setxy(Xs,Ys),
    original2Aux_C(Lvl,Tam),
    hideturtle().
/*_____________________________________________________*/


original3Aux_M(0,Tam):-
    pendown,
    setpencolor(white),
    forward(Tam),
    penup.

original3Aux_M(0,_,_,_).

original3Aux_M(N,Tam,X,Y):-
    Seg1     is Tam,
    Seg2    is Tam/2,
    Rad120  is 2.0944,
    Rad90   is 1.5708,
    X1      is X+(Seg2+Seg1)*cos(Rad90),
    Y1      is Y+(Seg2+Seg1)*sin(Rad90),
    X2      is X+(Seg2+Seg1)*cos(Rad90+Rad120),
    Y2      is Y+(Seg2+Seg1)*sin(Rad90+Rad120),
    X3      is X+(Seg2+Seg1)*cos(Rad90+Rad120*2),
    Y3      is Y+(Seg2+Seg1)*sin(Rad90+Rad120*2),


    setxy(X1,Y1),
    original3Aux_M(N,Tam),

    setxy(X2,Y2),
    original3Aux_M(N,Tam),

    setxy(X3,Y3),
    original3Aux_M(N,Tam)
    .

original3Aux_M(N,Tam):-
    Lvl    is N-1,
    Seg    is Tam*(1/3),
    Seg2   is Tam/3,

    get(@myturtle_class,x,X),
    get(@myturtle_class,y,Y),


    setpencolor(white),
    original3Aux_M(0,Seg),
    get(@myturtle_class,x,X_1),
    get(@myturtle_class,y,Y_1),

    setpencolor(red),
    left(120),
    original3Aux_M(0,Seg2),
    setxy(X_1,Y_1),
    setpencolor(white),
    left(120),
    original3Aux_M(0,Seg2),

    setxy(X,Y),

    setpencolor(white),
    original3Aux_M(0,Seg),
    get(@myturtle_class,x,X_2),
    get(@myturtle_class,y,Y_2),
    left(120),

    original3Aux_M(0,Seg2),
    setxy(X_2,Y_2),
    setpencolor(red),
    left(120),
    original3Aux_M(0,Seg2),

    setxy(X,Y),

    setpencolor(red),
    original3Aux_M(0,Seg),
    get(@myturtle_class,x,X_3),
    get(@myturtle_class,y,Y_3),
    left(120),

    setpencolor(magenta),
    original3Aux_M(0,Seg2),
    setxy(X_3,Y_3),
    left(120),
    original3Aux_M(0,Seg2),

    original3Aux_M(Lvl,Seg,X,Y)
    .


original3_M(Lvl,Tam):-
    Ys is (-(Tam*0.7)),
    Xs is (Tam),
    logo,setpencolor(white), setbgcolor(black),
    penup, setxy(Xs,Ys),
    original3Aux_M(Lvl,Tam),
    hideturtle().
/*.......................*/

original3Aux_S(0,Tam):-
    pendown,
    forward(Tam),
    penup.

original3Aux_S(0,_,_,_).

original3Aux_S(N,Tam,X,Y):-
    Seg1     is Tam,
    Seg2    is Tam/2,
    Rad120  is 2.0944,
    Rad90   is 1.5708,
    X1      is X+(Seg2+Seg1)*cos(Rad90),
    Y1      is Y+(Seg2+Seg1)*sin(Rad90),
    X2      is X+(Seg2+Seg1)*cos(Rad90+Rad120),
    Y2      is Y+(Seg2+Seg1)*sin(Rad90+Rad120),
    X3      is X+(Seg2+Seg1)*cos(Rad90+Rad120*2),
    Y3      is Y+(Seg2+Seg1)*sin(Rad90+Rad120*2),


    setxy(X1,Y1),
    original3Aux_S(N,Tam),

    setxy(X2,Y2),
    original3Aux_S(N,Tam),

    setxy(X3,Y3),
    original3Aux_S(N,Tam)
    .

original3Aux_S(N,Tam):-
    Lvl    is N-1,
    Seg    is Tam*(1/3),
    Seg2   is Tam/3,

    get(@myturtle_class,x,X),
    get(@myturtle_class,y,Y),


    setpencolor(white),
    original3Aux_S(0,Seg),
    get(@myturtle_class,x,X_1),
    get(@myturtle_class,y,Y_1),

    setpencolor(red),
    left(120),
    original3Aux_S(0,Seg2),
    setxy(X_1,Y_1),
    setpencolor(white),
    left(120),
    original3Aux_S(0,Seg2),

    setxy(X,Y),

    setpencolor(white),
    original3Aux_S(0,Seg),
    get(@myturtle_class,x,X_2),
    get(@myturtle_class,y,Y_2),
    left(120),

    original3Aux_S(0,Seg2),
    setxy(X_2,Y_2),
    setpencolor(red),
    left(120),
    original3Aux_S(0,Seg2),

    setxy(X,Y),

    setpencolor(red),
    original3Aux_S(0,Seg),
    get(@myturtle_class,x,X_3),
    get(@myturtle_class,y,Y_3),
    left(120),

    setpencolor(magenta),
    original3Aux_S(0,Seg2),
    setxy(X_3,Y_3),
    left(120),
    original3Aux_S(0,Seg2),

    original3Aux_S(Lvl,Seg,X,Y)
    .


original3_S(Lvl,Tam):-
    Ys is (-(Tam*0.7)),
    Xs is (Tam),
    logo,setpencolor(white), setbgcolor(black),
    penup, setxy(Xs,Ys),
    original3Aux_S(Lvl,Tam),
    hideturtle().

/*.......................*/
original3Aux_C(0,Tam):-
    pendown,
    random(1,7,Rand2),
    colore(Rand2,Nomb2),
    setpencolor(Nomb2),
    forward(Tam),
    penup.

original3Aux_C(0,_,_,_).

original3Aux_C(N,Tam,X,Y):-
    Seg1     is Tam,
    Seg2    is Tam/2,
    Rad120  is 2.0944,
    Rad90   is 1.5708,
    X1      is X+(Seg2+Seg1)*cos(Rad90),
    Y1      is Y+(Seg2+Seg1)*sin(Rad90),
    X2      is X+(Seg2+Seg1)*cos(Rad90+Rad120),
    Y2      is Y+(Seg2+Seg1)*sin(Rad90+Rad120),
    X3      is X+(Seg2+Seg1)*cos(Rad90+Rad120*2),
    Y3      is Y+(Seg2+Seg1)*sin(Rad90+Rad120*2),


    setxy(X1,Y1),
    original3Aux_C(N,Tam),

    setxy(X2,Y2),
    original3Aux_C(N,Tam),

    setxy(X3,Y3),
    original3Aux_C(N,Tam)
    .

original3Aux_C(N,Tam):-
    Lvl    is N-1,
    Seg    is Tam*(1/3),
    Seg2   is Tam/3,

    get(@myturtle_class,x,X),
    get(@myturtle_class,y,Y),


    setpencolor(white),
    original3Aux_C(0,Seg),
    get(@myturtle_class,x,X_1),
    get(@myturtle_class,y,Y_1),

    setpencolor(red),
    left(120),
    original3Aux_C(0,Seg2),
    setxy(X_1,Y_1),
    setpencolor(white),
    left(120),
    original3Aux_C(0,Seg2),

    setxy(X,Y),

    setpencolor(white),
    original3Aux_C(0,Seg),
    get(@myturtle_class,x,X_2),
    get(@myturtle_class,y,Y_2),
    left(120),

    original3Aux_C(0,Seg2),
    setxy(X_2,Y_2),
    setpencolor(red),
    left(120),
    original3Aux_C(0,Seg2),

    setxy(X,Y),

    setpencolor(red),
    original3Aux_C(0,Seg),
    get(@myturtle_class,x,X_3),
    get(@myturtle_class,y,Y_3),
    left(120),

    setpencolor(magenta),
    original3Aux_C(0,Seg2),
    setxy(X_3,Y_3),
    left(120),
    original3Aux_C(0,Seg2),

    original3Aux_C(Lvl,Seg,X,Y)
    .


original3_C(Lvl,Tam):-
    Ys is (-(Tam*0.7)),
    Xs is (Tam),
    logo,setpencolor(white), setbgcolor(black),
    penup, setxy(Xs,Ys),
    original3Aux_C(Lvl,Tam),
    hideturtle().

/*_____________________________________________________*/
magia3Aux(0,Tam):-
    forward(Tam).


magia3Aux(N,Tam):-
    Lvl is N-1,
    Seg is float(Tam)*float(0.539),
    right(22),
    magia3Aux(Lvl,Seg),

    magia3Aux(Lvl,Seg/2),
    right(180),
    penup,
    forward(Seg/2),
    pendown,
    right(180),

    left(44),
    magia3Aux(Lvl,Seg),

    penup,
    right(180),
    forward(Seg),
    pendown,
    magia3Aux(Lvl,Seg/2),
    penup,
    right(180),
    forward(Seg/2),
    forward(Seg),
    pendown,
    right(22).



magia3(Lvl,Tam):-
    logo,setpencolor(white), setbgcolor(black),
    right(45),
    magia3Aux(Lvl,Tam),
    right(90),
    magia3Aux(Lvl,Tam),
    right(90),
    magia3Aux(Lvl,Tam),
    right(90),
    magia3Aux(Lvl,Tam),
    right(90),
    hideturtle().





magia2Aux(0,Tam):-
    forward(Tam).


magia2Aux(N,Tam):-
    Lvl is N-1,
    Seg is Tam/2,
    magia2Aux(Lvl,Seg),

    right(180),
    penup,
    forward(Seg),
    pendown,
    right(180),

    right(45),
    magia2Aux(Lvl,Seg),

    right(180),
    penup,
    forward(Seg),
    pendown,
    right(180),


    left(90),
    magia2Aux(Lvl,Seg),


    right(180),
    penup,
    forward(Seg),
    pendown,
    right(180),

    right(45),
    forward(Seg).


magia2(Lvl,Tam):-
    logo,setpencolor(white), setbgcolor(black),
    right(90),
    magia2Aux(Lvl,Tam),
    right(180),
    penup,
    forward(Tam),
    right(180),
    pendown,

    right(90),
    magia2Aux(Lvl,Tam),
    right(180),
    penup,
    forward(Tam),
    right(180),
    pendown,

    right(90),
    magia2Aux(Lvl,Tam),
    right(180),
    penup,
    forward(Tam),
    right(180),
    pendown,

    right(90),
    magia2Aux(Lvl,Tam),
    right(180),
    penup,
    forward(Tam),
    right(180),
    pendown,
    hideturtle().






/* Libreria utilizada: ProLogo */

/*  
    ProLOGO - LOGO in Prolog.

    Authors: Lorenzo Masetti, Luca Cinti        
    E-mail: lorenzo.masetti@libero.it, lucacinti@supereva.it       
    WWW: http://www.prato.linux.it/~lmasetti/seriamente/ProLOGO           
    Copyright (C): 2003

    This program is free software; you can redistribute it and/or
    modify it under the terms of the GNU General Public License
    as published by the Free Software Foundation; either version 2
    of the License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
*/

:- use_module(library(pce)).

:- pce_autoload(finder, library(find_file)).
:- pce_global(@finder, new(finder)).
:- pce_image_directory('.').


/*** CLASSE PER LA GESTIONE DELLA TARTARUGA ***/
:- pce_begin_class(turtle,class).
variable(x,int:=0,both).
variable(y,int:=0,both).
variable(angle,int:=0,both).
variable(pen,int:=1,both).
variable(color,string:='#000000',both).
variable(visible,int:=1,both).
:- pce_end_class.

ifthenelse(A,B,C) :- call(A),!,B.
ifthenelse(A,B,C) :- C.


parser([]) --> [],!.
parser([H | L]) --> token(H),spazio,!,parser(L).

spazio --> [32],spazio,!.
spazio --> [13],spazio,!.
spazio --> [10],spazio,!.
spazio --> [9],spazio,!.

spazio --> [],!.

token(N) --> [X],{not(is_char(X)),name(N,[X])}.
token(W) --> chars(L), {name(W,L)}.

chars([H | T]) --> char(H),!,chars(T).
chars([]) --> [].

char(X) --> [X], {is_char(X)}.


is_char(X) :- code_type(X,digit).
is_char(X) :- code_type(X,alnum).
is_char(35). /* # */
is_char(95). /* _ */


/*** Risorse: le 359 immagini della tartaruga ***/
image(R, N, File) :-
	between(0, 359, N),
	turtlename(Prefix),
	atom_concat(Prefix, N, R),
	concat_atom(['img/',Prefix, N, '.gif'], File).

resource(R, image, image(File)) :-
	image(R, _N, File).




parola(Stringa,Parola,Resto) :-
	append(Parola,[32 | Resto],Stringa),!.

parola(Stringa,Stringa,[]).

/** tokenize(String,List) **/

tokenize([],[]).
tokenize(String,[First | List]) :- parola(String, Parola, Resto),name(First,Parola),tokenize(Resto,List).


list_to_string([],'').
list_to_string(List,String) :- word_list(String,List,[]).


list_to_string_no_spaces([],'').
list_to_string_no_spaces(List,String) :- word_list_nospace(String,List,[]).


word_list_nospace(X) --> [X].
word_list_nospace(X) --> [Prima], word_list_nospace(Dopo), {atom_concat(Prima,Dopo,X)}.


/*** GRAMMATICA LOGO **/

/** Terminali **/
fd_ --> [fd].
fd_ --> [a].
fd_ --> [avanti].
fd_ --> [forward].


bk_ --> [bk].
bk_ --> [back].
bk_ --> [i].
bk_ --> [indietro].

lt_ --> [lt].
lt_ --> [left].
lt_ --> [s].
lt_ --> [sinistra].
lt_ --> [leftturn].

rt_ --> [rt].
rt_ --> [right].
rt_ --> [d].
rt_ --> [destra].
rt_ --> [rightturn].

square_open_ -->['['].
square_close_ --> [']'].

repeat_ --> [repeat].
repeat_ --> [ripeti].


if_ --> [if].
if_ --> [se].

while_ --> [while].
while_ --> [mentre].


home_ --> [home].
home_ --> [tana].

make_ --> [make].
make_ --> [assegna].
make_ --> [as].

print_ --> [print].
print_ --> [pr].
print_ --> [stampa].

cls_ --> [cs].
cls_ --> [clearscreen].
cls_ --> [ps].
cls_ --> [puliscischermo].

clean_ --> [clean].
clean_ --> [pulisci].

clt_ --> [ct].
clt_ --> [cleartext].
clt_ --> [puliscitesto].
clt_ --> [pt].

penup_ --> [penup].
penup_ --> [pu].
penup_ --> [sulapenna].
penup_ --> [su].

pendown_ --> [pendown].
pendown_ --> [pd].
pendown_ --> [giulapenna].
pendown_ --> [giu].

read_ --> [read].
read_ --> [leggi].

label_ --> [label].
label_ --> [etichetta].


showturtle_ --> [showturtle].
showturtle_ --> [st].
showturtle_ --> [mostarta].
showturtle_ --> [mt].

hideturtle_ --> [hideturtle].
hideturtle_ --> [ht].
hideturtle_ --> [nastarta].
hideturtle_ --> [nt].

setx_ --> [setx].
setx_ --> [vaix].

sety_ --> [sety].
sety_ --> [vaiy].

setpos_ --> [setpos].
setpos_ --> [vaipos].

setxy_ --> [setxy].
setxy_ --> [vaixy].

setheading_ --> [setheading].
setheading_ --> [seth].
setheading_ --> [angolo].

setpencolor_ --> [setpencolor].
setpencolor_ --> [setpencolour].
setpencolor_ --> [pencolor].
setpencolor_ --> [pencolour].
setpencolor_ --> [setpc].
setpencolor_ --> [color].
setpencolor_ --> [colour].
setpencolor_ --> [colorepenna].
setpencolor_ --> [colore].

setbgcolor_ --> [setbackgroundcolor].
setbgcolor_ --> [setbackgroundcolour].
setbgcolor_ --> [setbgcolor].
setbgcolor_ --> [setbgcolour].
setbgcolor_ --> [bgcolor].
setbgcolor_ --> [bgcolour].
setbgcolor_ --> [coloresfondo].
setbgcolor_ --> [sfondo].

defaultcolors_ --> [defaultcolors].
defaultcolors_ --> [defaultcolours].
defaultcolors_ --> [coloristandard].

load_ --> [load].
load_ --> [carica].


about_ --> [about].
about_ --> [informazioni].

xcor_ --> [xcor].
ycor_ --> [ycor].
heading_ --> [heading].
heading_ --> [direzione].

showvars_ --> [pons].
showvars_ --> [printoutnames].
showvars_ --> [ponames].
showvars_ --> [showvars].
showvars_ --> [mostravar].

erall_ --> [erall].
erall_ --> [eraseall].
erall_ --> [cancellatutto].

first_ --> [first].
first_ --> [primo].

butfirst_ --> [butfirst].
butfirst_ --> [coda].

last_ --> [last].
last_ --> [ultimo].

readlist_ --> [readlist].
readlist_ --> [leggilista].

push_ --> [push].
push_ --> [metti].

concat_ --> [concat].

length_ --> [length].
length_ --> [lunghezza].
length_ --> [lung].

empty_ --> [empty].
empty_ --> [emptyp]. /** nome LOGO originale **/
empty_ --> [vuota].


and_ --> [and].
and_ --> [e].

or_ --> [or].
or_ --> [o].

not_ --> [not].
not_ --> [non].

true_ --> [true].
true_ --> [vero].

false_ --> [false].
false_ --> [falso].


atom_(X) --> [X].

/*** Gestione Memoria come lista di coppie ***/
/*** readmem( Ambiente da cui leggere , NomeVar, Valore ) ***/
readmem([val(Nome,N) | L],Nome,N) :- !.
readmem([ Head | Tail ],Nome,N) :- readmem(Tail,Nome,N).
readmem([],Nome,0). /*** variabili indefinite valgono 0 ***/

/*** writemem (Ambiente Iniziale,Nome Var,Valore,Ambiente dopo la scrittura) ***/
writemem([],Nome,X,[val(Nome,X)]) :- !.
writemem([val(Nome,OldValue) | Tail],Nome,X,[val(Nome,X) | Tail]) :- !.
writemem([ Head | Tail ],Nome,X,[Head | NewMem]) :- writemem(Tail,Nome,X,NewMem).


quote --> ['\"'].
dots --> [':'].
thing_ --> [thing].
thing_ --> [cosa].


/*** Variabili in lettura. Lettura :x oppure thing "x  ***/

variable_r(Env,Nome) --> dots,[Nome].
variable_r(Env,Nome) --> thing_,wordexpr(Env,Nome).


word(Nome) --> quote,atom_(Nome),!.
word('') --> quote.



and(true,true,true).
and(false,_,false).
and(_,false,false).

or(false,false,false).
or(true,_,true).
or(_,true,true).

not(true,false).
not(false,true).


/*** Espressioni Intere ***/

intexpr(Env,X) --> termine(Env,T),intexpr2(Env,E),!, {X is T+E}.

intexpr2(Env,X)--> ['+'],termine(Env,T),intexpr2(Env,E),!,{X is T+E}.
intexpr2(Env,X)--> ['-'],termine(Env,T),intexpr2(Env,E),!,{X is -T+E}.
intexpr2(Env,0) --> [].



termine(Env,X) --> fattore(Env,F),termine2(Env,X,F).
termine(Env,X) --> fattore(Env,F).

/*** Per calcolare le espressioni da sinistra a destra si tiene il risultato parziale e lo si passa al prossimo "termine2" che calcola (ricorsivamente) il risultato finale ***/

termine2(Env,X,Parziale) --> ['*'],fattore(Env,F),{Ris is Parziale*F},termine2(Env,X,Ris).
termine2(Env,X,Parziale) --> ['/'],fattore(Env,F),{F\=0,Ris is Parziale//F},termine2(Env,X,Ris).
termine2(Env,X,Parziale) --> ['/'],fattore(Env,F),{F=0},errorMsg('Division by zero').

termine2(Env,X,Parziale) --> ['%'],fattore(Env,F),{F\=0,Ris is Parziale mod F},termine2(Env,X,Ris).
termine2(Env,X,Parziale) --> ['%'],fattore(Env,F),{F=0},errorMsg('Division by zero').
termine2(Env,Parziale,Parziale) --> []. /*** Quando non ci sono ulteriori termini viene restituito il risultato finale ***/



/*
   Un'espressione puo' essere anche read [ inserisci un intero ] oppure solo read.
   Esempio: make "x read [ inserisci il numero di passi ] fd :x
*/
fattore(Env,X) --> read_,  list_string_(Mess), {readinput(X,Mess)}.
fattore(Env,X) --> read_,!,{readinput(X,'?')}.

fattore(Env,X) --> ['('],intexpr(Env,X),[')'].
fattore(Env,X) --> [N], {integer(N), X is N}.
fattore(Env,X) --> ['-'],fattore(Env,E),!, {X is -E}.
fattore(Env,X) --> variable_r(Env,Nome), { readmem(Env,Nome,X),integer(X)}.

fattore(Env,X) --> first_, listexpr(Env,[X|_]),{integer(X),!}.
fattore(Env,0) --> first_, listexpr(Env,[]), errorMsg('First doesn\'t like [] as input').

fattore(Env,0) --> last_, listexpr(Env,[]), errorMsg('Last doesn\'t like [] as input').
fattore(Env,X) --> last_, listexpr(Env,L), {last(X,L), integer(X)}.

fattore(Env,X) --> xcor_, {get(@myturtle_class,x,X)}.
fattore(Env,X) --> ycor_, {get(@myturtle_class,y,X)}.
fattore(Env,X) --> heading_, {get(@myturtle_class,angle,Angle),trasfAngleInv(Angle,X)}.

fattore(Env,X) --> length_, listexpr(Env,L), !,{length(L,X)}.

fattore(Env,X) --> length_, wordexpr(Env,Str), !,{atom_codes(Str,L),length(L,X)}.




word_list(X) --> [X].
word_list(X) --> [Prima], word_list(Dopo), {atom_concat(Prima,' ',Temp),atom_concat(Temp,Dopo,X)}.
list_string_(X) --> square_open_, word_list(X), square_close_.


/*** Espressioni Liste ***/

listexpr(Env,L) --> list_(L).
listexpr(Env,L) --> variable_r(Env,Nome), {readmem(Env,Nome,L),is_list(L)}.
listexpr(Env,L) --> butfirst_, listexpr(Env,[_ | L]).
listexpr(Env,[]) --> butfirst_, listexpr(Env,[]),errorMsg('butfirst doesn\'t like [] as input'). 

listexpr(Env,L) --> readlist_, list_string_(Mess),!, {readList(L,Mess)}.
listexpr(Env,L) --> readlist_,!, {readList(L,'')}.

listexpr(Env,[X | L]) --> push_,intexpr(Env,X),listexpr(Env,L).
listexpr(Env,[X | L]) --> push_,boolexpr(Env,X),listexpr(Env,L).
listexpr(Env,[X | L]) --> push_,wordexpr(Env,X),listexpr(Env,L).

listexpr(Env,L) --> concat_,listexpr(Env,L1),listexpr(Env,L2),{append(L1,L2,L)}.


atom_list([]) --> [].
atom_list([Head | Tail ]) --> [Head],atom_list(Tail).

list_(X) --> square_open_, atom_list(X), square_close_.


/*** Espressioni Word ***/ 

wordexpr(Env,X) --> word(X).
wordexpr(Env,X) --> variable_r(Env,Nome),{readmem(Env,Nome,X),not(integer(X))}.

wordexpr(Env,X) --> first_, listexpr(Env,[X|_]).
wordexpr(Env,X) --> last_, listexpr(Env,L), {last(X,L), not(integer(X))}.

wordexpr(Env,X) --> first_, wordexpr(Env,Str), {name(Str,[ F | T ]),name(X,[F])}.
wordexpr(Env,X) --> butfirst_, wordexpr(Env,Str), {name(Str,[ F | T ]),name(X,T)}.

wordexpr(Env,X) --> last_, wordexpr(Env,Str), {name(Str,L),last(Last,L),name(X,[Last])}.


/*** Espressioni booleane ***/


boolexpr(Env,X) --> boolterm(Env,F1), or_, boolexpr(Env,F2), {or(F1,F2,X)}.
boolexpr(Env,X) --> boolterm(Env,X).

boolterm(Env,X) --> boolfatt(Env,F1), and_, boolterm(Env,F2), {and(F1,F2,X)}.
boolterm(Env,X) --> boolfatt(Env,X).


boolfatt(Env,true) --> true_.
boolfatt(Env,false) --> false_.
boolfatt(Env,X) --> not_,['('],boolexpr(Env,Y),[')'], {not(Y,X)}.
boolfatt(Env,X) --> intexpr(Env,E1),['='],intexpr(Env,E2),{ifthenelse(E1=E2,X=true,X=false) }.
boolfatt(Env,X) --> intexpr(Env,E1),['>'],intexpr(Env,E2),{ifthenelse(E1>E2,X=true,X=false) }.
boolfatt(Env,X) --> intexpr(Env,E1),['<'],intexpr(Env,E2),{ifthenelse(E1<E2,X=true,X=false) }.
boolfatt(Env,X) --> intexpr(Env,E1),['>'],['='],intexpr(Env,E2),{ifthenelse(E1>=E2,X=true,X=false) }.
boolfatt(Env,X) --> intexpr(Env,E1),['<'],['='],intexpr(Env,E2),{ifthenelse(E1=<E2,X=true,X=false) }.
boolfatt(Env,X) --> intexpr(Env,E1),['!'],['='],intexpr(Env,E2),{ifthenelse(E1\=E2,X=true,X=false) }.
boolfatt(Env,X) --> ['('],boolexpr(Env,X),[')'].

boolfatt(Env,true) --> variable_r(Env,Nome),{ readmem(Env,X,true)}.
boolfatt(Env,false) --> variable_r(Env,Nome),!,{ readmem(Env,X,false)}.


boolfatt(Env,X) --> empty_, listexpr(Env,L), {ifthenelse(length(L,0),X=true,X=false)}.
boolfatt(Env,X) --> empty_, wordexpr(Env,Str), {atom_codes(Str,L),ifthenelse(length(L,0),X=true,X=false)}.




/*** Comandi e istruzioni ***/
command(Env,Env) --> [].
command(Env0,EnvF) --> instr(Env0,Env1),!,command(Env1,EnvF).
command(Env0,Env1) --> square_open_,!, command(Env0,Env1), square_close_.


instr(Env,Env) --> fd_,intexpr(Env,X),!, {forward(X)}.
instr(Env,Env) --> bk_,intexpr(Env,X),!, {back(X)}.
instr(Env,Env) --> rt_,intexpr(Env,X),!, {right(X)}.
instr(Env,Env) --> lt_,intexpr(Env,X),!, {left(X)}.
instr(Env,Env) --> home_,!, {home}.


instr(Env,Env) --> print_, intexpr(Env,X),!,{println(X)}.
instr(Env,Env) --> print_, boolexpr(Env,X),!,{println(X)}.
instr(Env,Env) --> print_, listexpr(Env,L),!, {list_to_string(L,String),println(String)}.

instr(Env,Env) --> print_, wordexpr(Env,X),!, {println(X)}.


instr(Env,Env) --> cls_, !, {clearscreen}.
instr(Env,Env) --> clean_,!, {clean}.

instr(Env,Env) --> penup_,!, {penup}.
instr(Env,Env) --> pendown_,!, {pendown}.

instr(Env,Env) --> showturtle_,!, {showturtle}.
instr(Env,Env) --> hideturtle_,!, {hideturtle}.

instr(Env,Env) --> setx_, intexpr(Env,X),!,{setx(X)}.
instr(Env,Env) --> sety_, intexpr(Env,Y),!,{sety(Y)}.
instr(Env,Env) --> setpos_, listexpr(Env,[X, Y]),!,{setxy(X,Y)}.
instr(Env,Env) --> setpos_, listexpr(Env,L),!,{list_to_string(L,StrL), concat_atom(['setpos doesn\'t like [ ',StrL,' ] as input.'],Msg)}, errorMsg(Msg).

instr(Env,Env) --> setxy_, intexpr(Env,X), intexpr(Env,Y),!,{setxy(X,Y)}.

instr(Env,Env) --> label_, listexpr(Env,L),!, {list_to_string(L,Str),label(Str)}.
instr(Env,Env) --> label_, wordexpr(Env,X),!, {label(X)}.


instr(Env,Env) --> setheading_, intexpr(Env,X),!, {setheading(X)}.


instr(Env,Env) --> setpencolor_, word(X),!, {setpencolor(X)}.
instr(Env,Env) --> setbgcolor_, word(X),!, {setbgcolor(X)}.


colore(0,black).
colore(1,blue).
colore(2,green).
colore(3,cyan).
colore(4,red).
colore(5,magenta).
colore(6,yellow).
colore(7,white).

instr(Env,Env) --> setpencolor_, intexpr(Env,X),!, {Code is abs(X mod 8), colore(Code,Name),setpencolor(Name)}.
instr(Env,Env) --> setbgcolor_, intexpr(Env,X),!, {Code is abs(X mod 8), colore(Code,Name),setbgcolor(Name)}.


instr(Env,Env) --> defaultcolors_, {defaultcolors}.

instr(Env,Env) --> clt_, {cleartext}.

instr(Env,Env) --> load_, listexpr(Env,L), {list_to_string_no_spaces(L,File),openScript(File)}.

instr(Env,Env) --> about_,{about}.

instr(Env,Env) --> showvars_, {showvars}.

instr(Env,[]) --> erall_.

/*** Gestione del repeat while e if ***/

openclose(0) --> [],!.
openclose(X) --> square_open_,!,{X1 is X+1},openclose(X1).
openclose(X) --> square_close_,!,{X1 is X-1},openclose(X1).
openclose(X) --> [I],openclose(X).
openclose(X,[],[]) :- X\=0,errorDialog('Syntax Error').




/*** gestione del Repeat ***/
instr(Env0,EnvF,L,C) :- repeat_(L,Lr), intexpr(Env0,X,Lr,Le),X>1,!,square_open_(Le,Los),command(Env0,Env1,Los,Lc),square_close_(Lc,Lcs),X1 is X-1,instr(Env1,EnvF,[repeat, X1 | Le],C).

instr(Env0,EnvF) --> repeat_, intexpr(Env0,1),!,square_open_,command(Env0,EnvF),square_close_.
 
instr(Env0,Env0) --> repeat_, intexpr(Env0,0),!,square_open_,openclose(1).


/*** gestione dell'If ***/
instr(Env0,EnvF) -->if_, boolexpr(Env0,true),!,square_open_,command(Env0,EnvF),square_close_,square_open_,openclose(1),!.

instr(Env0,EnvF) --> if_, boolexpr(Env0,false),!,square_open_,openclose(1),square_open_,command(Env0,EnvF),square_close_.

/*** gestione dello while ***/
instr(Env0,EnvF,L,C) :- while_(L,L1), boolexpr(Env0,true,L1,L2),!,square_open_(L2,L3),command(Env0,Env1,L3,L4),square_close_(L4,L5),instr(Env1,EnvF,L,C).

instr(Env0,Env0) --> while_, boolexpr(Env0,false),!,square_open_,openclose(1).

/*** gestione dell'assegnamento ***/
instr(Env0,EnvF) --> make_, wordexpr(Env0,Nome), wordexpr(Env0,X),!,{writemem(Env0,Nome,X,EnvF)}.
instr(Env0,EnvF) --> make_, wordexpr(Env0,Nome), intexpr(Env0,X),!,{writemem(Env0,Nome,X,EnvF)}.
instr(Env0,EnvF) --> make_, wordexpr(Env0,Nome), boolexpr(Env0,X),!,{writemem(Env0,Nome,X,EnvF)}.
instr(Env0,EnvF) --> make_, wordexpr(Env0,Nome), listexpr(Env0,X),!,{writemem(Env0,Nome,X,EnvF)}.


								 
/*** Command not found ***/
instr(Env,Env) --> [X],!, {atom_concat('I don\'t know how to ',X,Mess)},errorMsg(Mess).

	
	
/** converte da gradi in radianti **/
radianti(AngleGradi,Angle) :- Angle is (AngleGradi*pi/180).
/*** converte da radianti in gradi ***/
gradi(AngleRad,Angle) :- Angle is AngleRad*180/pi.


/*** imposta la tartaruga ***/
setTurtle(X,Y,Angle) :- send(@myturtle_class,x(X)),send(@myturtle_class,y(Y)),send(@myturtle_class,angle(Angle)).

/*** legge i valori della tartaruga ***/
getTurtle(X,Y,Angle,Pen,Visible) :- get(@myturtle_class,x,X),get(@myturtle_class,y,Y),get(@myturtle_class,angle,Angle),get(@myturtle_class,pen,Pen),get(@myturtle_class,visible,Visible).

getTurtle(X,Y,Angle,Pen) :-  get(@myturtle_class,x,X),get(@myturtle_class,y,Y),get(@myturtle_class,angle,Angle),get(@myturtle_class,pen,Pen).

getTurtle(X,Y,Angle) :-  get(@myturtle_class,x,X),get(@myturtle_class,y,Y),get(@myturtle_class,angle,Angle).

getColor(Color) :- get(@myturtle_class,color,Color).

/*** Esecuzione delle istruzioni atomiche ***/

forward(N) :- getTurtle(X,Y,Angle,Pen),radianti(Angle,Radianti),X1 is round(X+N*cos(Radianti)),Y1 is round(Y+N*sin(Radianti)),setTurtle(X1,Y1,Angle),line(X,Y,X1,Y1,Pen),paintTurtle.


back(N) :- getTurtle(X,Y,Angle,Pen),radianti(Angle,Radianti),X1 is round(X-N*cos(Radianti)),Y1 is round(Y-N*sin(Radianti)),setTurtle(X1,Y1,Angle),line(X,Y,X1,Y1,Pen),paintTurtle.



left(Angle) :- getTurtle(X,Y,CurrentAngle),NewAngle is ((CurrentAngle+Angle) mod 360),setTurtle(X,Y,NewAngle),paintTurtle.

right(Angle) :- getTurtle(X,Y,CurrentAngle),NewAngle is ((CurrentAngle-Angle) mod 360),setTurtle(X,Y,NewAngle),paintTurtle.


home :- getTurtle(X,Y,Angle,Pen),line(X,Y,0,0,Pen),setTurtle(0,0,90),paintTurtle.


penup :- send(@myturtle_class,pen(0)).


pendown :- send(@myturtle_class,pen(1)).


showturtle :- send(@myturtle_class,visible(1)),paintTurtle.


hideturtle :- send(@myturtle_class,visible(0)),send(@turtle_image,destroy).


label(String) :- getTurtle(X,Y,Angle),getColor(Color),trasf(X,Y,X1,Y1),new(Text,text(String)),send(Text,colour,Color),send(@graphics,display(Text,point(X1,Y1))).

println(String) :- send(@text,append(String)),send(@text,append('\n')).


setx(X) :- getTurtle(CurrX,Y,Angle,Pen),line(CurrX,Y,X,Y,Pen),setTurtle(X,Y,Angle),paintTurtle.


sety(Y) :- getTurtle(X,CurrY,Angle,Pen),line(X,CurrY,X,Y,Pen),setTurtle(X,Y,Angle),paintTurtle.


setxy(X,Y) :- getTurtle(CurrX,CurrY,Angle,Pen),line(CurrX,CurrY,X,Y,Pen),setTurtle(X,Y,Angle),paintTurtle.


setheading(Angle) :- trasfAngle(Angle,Angle2),send(@myturtle_class,angle(Angle2)),paintTurtle.


/*** trasforma dalle coordinate logo in coordinate della finestra ***/
trasf(X,Y,X1,Y1) :- get(@graphics,width,W), get(@graphics,height,H),X1 is (W/2+X), Y1 is (H/2-Y).

/*** trasformazioni dell'angolo ***/
trasfAngle(Angle,Angle2) :- AngleTemp is ((90-Angle) mod 360),ifthenelse(AngleTemp>=0,Angle2=AngleTemp,Angle2 is AngleTemp+360).
trasfAngleInv(Angle,Angle2) :- Angle2 is ((90- Angle) mod 360).


/*** DISEGNO  ***/
/*** se la penna e' su non si disegna niente ***/
line(_,_,_,_,0).


line(X0,Y0,X1,Y1,1) :- trasf(X0,Y0,X0v,Y0v),trasf(X1,Y1,X1v,Y1v),new(Line,line(X0v,Y0v,X1v,Y1v)),getColor(Color),send(Line,colour,Color),send(@graphics,display(Line)).



paintTurtle :- getTurtle(X,Y,Angle,_,0).

paintTurtle :- getTurtle(X,Y,Angle,_,1),trasf(X,Y,X1,Y1),trasfAngle(Angle,Angle2),image(R,Angle2,File),free(@turtle_image),send(@graphics,display(new(@turtle_image,bitmap(resource(R))),point(X1,Y1))).

defaultcolors :- setpencolor('#000000'),setbgcolor('#ffffff').

clearscreen :- send(@graphics,clear),setTurtle(0,0,90),paintTurtle.

clean :- send(@graphics,clear),paintTurtle.

cleartext :- send(@text,clear).


setpencolor(Color) :- send(@myturtle_class,color(Color)).
setbgcolor(Color) :-  send(@graphics,background(Color)).

about :- welcomemessage,println('Written by Lorenzo Masetti and Luca Cinti').

showvars :- ambiente(M),scrivivar(M).


scrivivar([]).
scrivivar([val(Nome,Valore) | Tail]) :- is_list(Valore),!,list_to_string(Valore,ValoreStr),concat_atom([ Nome,'=',ValoreStr],Testo),println(Testo),scrivivar(Tail).

scrivivar([val(Nome,Valore) | Tail]) :- concat_atom([Nome,'=',Valore],Testo),println(Testo),scrivivar(Tail).
scrivivar([H | T]) :- scrivivar(T).


readinput(X,Message) :-
	new(D,dialog('Input (Integer)')),
	send(D,append,new(T,int_item(Message,0))),
	new(Returner,message(D,return,T?selection)),
	send(D,append,button(ok,Returner)),
	send(D,default_button,ok),
	get(D,confirm,Answer),
	send(D,destroy),
	X = Answer.


readList(L,Message) :-	
	new(D,dialog('Input (List)')),
	send(D,append,new(T,text_item(Message,''))),
	new(Returner,message(D,return,T?selection)),
	send(D,append,button(ok,Returner)),
	send(D,append,button(cancel,message(D,return,''))),
	send(D,default_button,ok),
	get(D,confirm,Answer),
	send(D,destroy),
	string_to_list(Answer,Input),
	tokenize(Input,L).


errorDialog(Message) :-	
	send(@graphics,alert), /*** beep! ***/
	println(Message),
	new(D,dialog('Error')),
	send(D,append,label(mess,Message)),
	send(D,append,button(ok,message(D,return,@nil))),
	send(D,default_button,ok),
	get(D,confirm,Answer),
	send(D,destroy).

toend --> [X], toend.
toend(_,[]).

errorMsg(Message) --> {errorDialog(Message)},toend.

/*** Esegue un comando ***/
exec(Command,Env,EnvF):-
	string_to_list(Command,Comm),parser(C,Comm,[]),command(Env,EnvF,C,[]).

/*** Esegue il comando e pulisce la casella di input ***/
run(Program,Input) :-
	send(Input,clear),
	run(Program).

run(Program) :-
	ambiente(Env),
	exec(Program,Env,EnvF),
	retractall(ambiente(X)),
	assertz(ambiente(EnvF)).
	




/*** costruisce la interfaccia grafica ***/
:- free(@graphics).
:- pce_global(@graphics,new(window('ProLogo',size(600,400)))).
:- free(@turtle_image).
:- pce_global(@turtle_image,new(bitmap(''))).
:- free(@text).
:- pce_global(@text,new(view('TextScreen'))).

logo :- logo(90,300).

logo(W,H) :-
	retractall(ambiente(X)),
	assertz(ambiente([])),
	retractall(turtlename(X)),
	assertz(turtlename('turtle')),
	new(Turtle,turtle('myturtle')),
	send(@graphics,size(size(W,H))),
	new(Command,dialog('CommandWindow')),
	send(@text,editable(false)),
	HText is round(H/30),
	send(@text,size(size(W,HText))),
	new(Input,text_item('?-','',message(@prolog,run,@arg1,@receiver))),
	send(Input,length(W)),
	send(Command,append(Input)),
	send(@text,below,@graphics),
	send(Command,below,@graphics),
	new(Exec,button('Exec',message(Input,execute))),
	new(Quit,button('Quit',message(@graphics,destroy))),
	new(Open,button('Open',message(@prolog,loadscript))),
	new(TurtleSel,button('Turtle',message(@prolog,useturtle))),
	new(PenguinSel,button('Penguin',message(@prolog,usepenguin))),
	send(Command,append(Exec,right)),
	send(Command,append(Quit,right)),
	send(Command,append(Open,below)),
	send(Command,append(TurtleSel,right)),
	send(Command,append(PenguinSel,right)),
	send(Command,default_button(Exec)),
	send(Command,caret(Input)),
	send(@graphics,open),
	init.

init :- defaultcolors,
	clearscreen,
	showturtle,
	pendown,
	welcomemessage.



useturtle :-
	retractall(turtlename(X)),
	assertz(turtlename('turtle')),
	paintTurtle.

usepenguin :-
	retractall(turtlename(X)),
	assertz(turtlename('pinguino')),
	paintTurtle.

loadscript :-
	get(@finder,file,FileToLoad),
	openScript(FileToLoad).

loadscript.

openScript(FileToLoad) :-
	exists_file(FileToLoad),
	open(FileToLoad,read,File),
	read_stream_to_codes(File,Command,[]),
	close(File),
	run(Command).

openScript(FileToLoad) :- atom_concat('File not found: ',FileToLoad,Mess),errorDialog(Mess).


	
welcomemessage :- 
	get(@graphics,width,Width),
	get(@graphics,height,Height),
	println('Welcome to ProLOGO, a LOGO-like language written in Prolog. Version 0.9. ProLOGO is Free Software'),
	concat_atom(['Graphics Window is ',Width,'x',Height,' pixels'],Mess),
	println(Mess).




