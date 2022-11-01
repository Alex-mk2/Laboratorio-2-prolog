/*------------------------------------------------------
         _          _      ____      ____          
 ----   | |        / \    | __ )    |___ \    -------  
 ----   | |       / _ \   |  _ \      __) |   -------
 ----   | |___   / ___ \  | |_) |    / __/    -------
 ----   |_____| /_/   \_\ |____/    |_____|   -------
 --------------------------------------------------------
/
Nombre: Alex Mellado Gamboa
Sección: 
Profesor: Miguel Truffa
Asignatura: Paradigmas de la programacion
Rut: 19.684.813-4
% VERSIÓN SWI-PROLOG: 8.4.2


-------------------------Constructores-------------------
Predicado image (Constructor de imagen)
Dominio: Width(int) X Height(int) X [pixbit-d | pixrgb-d | pixhex-d] Aridad 5
Recorrido: Image
Metas primaria: pixbit-d, pixrgb-d, pixhex-d, alto, ancho
Meta Secundarias: Imagen

Predicado pixbit-d
Dominio: X(int) X Y(int) X Bit([0|1]) X Depth(int) Aridad 4
Recorrido: pixbit-d
Metas primaria: pixbit-d, Bit
Metas Secundarias: Imagen

Predicado pixrgb-d
Dominio: X(int) X Y(int) X R(C) X G(C) X B(C) X D
Recorrido: pixrgb-d
Meta primaria: pixrgb-d
Meta secundaria: imagen

Predicado pixhex-d
Dominio: X(int) X Y(int) X hex(string) X D(int)
Recorrido: pixhex-d
Meta primaria: pixhex-d
Meta secundaria: imagen
--------------------------------------------------------------------------------------------------------
*/


/*Constructor pixbit-d
Predicado pixbit-d
Dom: X(int) X Y(int) X Bit([0|1]) X Depth(int)
Rec: pixbit-d
Ejemplo uso: 
pixbitD(10, 0, 1, 1, Lista). Devuelve Lista = [10, 0, 1, 1].
pixbitD(10, 5, 0, 5, Lista). Devuelve Lista = [10, 5, 0, 5].
pixbitD(20, 20, 0, 10, Lista). Devuelve Lista = [20, 20, 0, 10].
*/
pixbitD(X, Y, Bit, Depth, [X,Y,Bit,Depth]).


/*Constructor pixrgb-d
Predicado pixrgb.d
Dom: X(int) X Y(int) X R(C) X G(C) X B(C) X D
Rec: pixrgb-d
Ejemplo uso:
pixrgb-d(10, 10, 255, 255,255, 10, Lista), Devuelve Lista = [10, 10, 255, 255, 255, 10].
pixrgb-d(5, 2, 55, 25,250, 4, Lista), Devuelve Lista = [5, 2, 55, 25, 250, 4].
pixrgb-d(10, 10, 25, 25,25, 10, Lista), Devuelve Lista = [10, 10, 25, 25, 25, 10].
*/
pixrgbD(X, Y, R, G, B, D, [X, Y, R, G, B, D]).

/*Constructor pixhex-d
Predicado pixhex-d
Dom: Dominio: X(int) X Y(int) X hex(string) X D(int)
Rec: pixhex-d
Ejemplo uso: 
pixhex-d(10, 10, "#FF5733", 30, Lista), Devuelve lista = [10, 10, "#FF5733", 30].
pixhex-d(1, 12, "#F08080", 35, Lista), Devuelve lista = [1, 12, "#F08080", 35].
pixhex-d(2, 5, "#FA8072", 20, Lista), Devuelve lista = [2, 5, "#FA8072", 20].
*/
pixhexD(X, Y, Hex, D, [X, Y, Hex, D]).


/*Constructor image
Predicado image
Dom: Width(int) X Height(int) X [pixbit-d | pixrgb-d | pixhex-d] Aridad 5
Rec: image
Ejemplo uso: 
pixbit-d(10,20,1,25,L1),
pixbit-d(5,10,0,20,L2),
pixbit-d(0,50,1,4,L3),
pixbit-d(10,10,0,22,L4),
image(10,10,[L1,L2,L3,L4],LG)., Devuelve listaGeneral con todos los parametros dados
*/

image(Width, Height, ListPixel, [Width, Height, ListPixel]).


/*Predicado para verificar la pertenencia en un pixbit-d
Dom: pixrgb-d 
Rec: Booleano
*/
isABitmap([]).
isABitmap([Pixbitd|Cola]):-
    pixbitD(_,_,Bit,_,Pixbitd),
    (Bit==0 ; Bit==1),
    isABitmap(Cola).

/*Predicado para verificar si existe bitmap en una imagen
Dom: imagen
Rec: Booleano
Ejemplo de uso: 

(pixbitD( 0, 0, 1, 10, PA), pixbitD( 0, 1, 0, 20, PB), 
pixbitD( 1, 0, 0, 30, PC), 
pixbitD( 1, 1, 1, 4, PD), 
image( 2, 2, [PA, PB, PC, PD], I), 
imagenABitmap(I)).
Retorna Falso, hay que revisar la condicion
*/

imagenABitmap([]).
imagenABitmap(Imagen):-
    image(_,_,Pixel,Imagen),
    isABitmap(Pixel),
    imagenABitmap(Pixel).

/*Predicado para verificar si existe pixrgb en una imagen
 Dom: pixrgb
 Rec: Booleano
*/
isAPixrgbD([]).
isAPixrgbD([Pixrgbd|Cola]):-
    pixrgbD(_,_,R,G,B,_, Pixrgbd),
    (R =< 0, R =< 255),
    (G =< 0, G =< 255),
    (B =< 0, B =< 255),
    isAPixrgbD(Cola).

/*Predicado para verificar si existe un pixmap
 * Dom: pixmap
 * Meta: Verificar si existe el pixmap (verdadero o falso).
*/

imagenIsAPixmap([]).
imagenIsAPixmap(Imagen):-
    image(_,_,Pixel,Imagen),
    isAPixrgbD(Pixel),
    imagenIsAPixmap(Pixel).

/*Predicado para verificar si existe pixhex en una imagen
 * Dom: pixhexD
 * Meta o rec: verificar la existencia de pixhex y asi distinguir entre los 3 tipos de pixeles
*/

isAPixhex([]).
isAPixhex([Pixhex|Cola]):-
    pixhexD(_,_,Pixhex,_,Hex),
    Hex = Pixhex,
    isAPixhex(Cola).

/*Predicado para verificar un hexmap
 * Dom: PixhexD
 * Meta o rec: verificar la existencia de un hexmap en una imagen
*/

imagenIsAHexmap([]).
imagenIsAHexmap(Imagen):-
    image(_,_,Pixel,Imagen),
    isAPixhex(Pixel),
    imagenIsAHexmap(Pixel).



/*Script de pruebas de los codigos hasta el momento empleados
pixbitD(10, 0, 1, 1, Lista). Devuelve Lista = [10, 0, 1, 1].
pixbitD(10, 5, 0, 5, Lista). Devuelve Lista = [10, 5, 0, 5].
pixbitD(20, 20, 0, 10, Lista). Devuelve Lista = [20, 20, 0, 10].
pixrgbD(10, 10, 255, 255,255, 10, Lista), Devuelve Lista = [10, 10, 255, 255, 255, 10].
pixrgbD(5, 2, 55, 25,250, 4, Lista), Devuelve Lista = [5, 2, 55, 25, 250, 4].
pixrgbD(10, 10, 25, 25,25, 10, Lista), Devuelve Lista = [10, 10, 25, 25, 25, 10].
pixhexD(10, 10, "#FF5733", 30, Lista), Devuelve lista = [10, 10, "#FF5733", 30].
pixhexD(1, 12, "#F08080", 35, Lista), Devuelve lista = [1, 12, "#F08080", 35].
pixhexD(2, 5, "#FA8072", 20, Lista), Devuelve lista = [2, 5, "#FA8072", 20].
pixbitD(10,20,1,25,L1),pixbitD(5,10,0,20,L2),pixbitD(0,50,1,4,L3),pixbitD(10,10,0,22,L4), image(10,10,[L1,L2,L3,L4],I). Devuelve I con los parametros dados
pixbitD(15,22,0,22,L1),pixbitD(1,1,0,30,L2),pixbitD(5,50,0,10,L3),pixbitD(10,10,1,50,L4), image(10,2,[L1,L2,L3,L4],I). Devuelve I con los parametros dados
pixhexD(15,22,"#F08080",22,L1),pixhexD(1,1,"#FA8072",30,L2),pixhexD(5,50,"#FF5733",10,L3),pixhexD(10,10,"#FF5733",50,L4), image(10,2,[L1,L2,L3,L4],I). Devuelve I con los parametros dados
(pixbitD( 0, 0, 1, 10, PA), pixbitD( 0, 1, 0, 20, PB), pixbitD( 1, 0, 0, 30, PC), pixbitD( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), 
imagenABitmap(I)). Retorna falso, hay que revisar la condición para verificar.