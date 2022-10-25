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
pixbit-d(10, 10, 1, 5, Lista). Devuelve Lista = [10, 10, 1, 5].
*/
pixbitD(X, Y, Bit, Depth, [X,Y,Bit,Depth]).


/*Constructor pixrgb-d
Predicado pixrgb.d
Dom: X(int) X Y(int) X R(C) X G(C) X B(C) X D
Rec: pixrgb-d
Ejemplo uso:
pixrgb-d(10, 10, 255, 255,255, 10, Lista), Devuelve Lista = [10, 10, 255, 255, 255, 10].
*/
pixrgbD(X, Y, R, G, B, D, [X, Y, R, G, B, D]).

/*Constructor pixhex-d
Predicado pixhex-d
Dom: Dominio: X(int) X Y(int) X hex(string) X D(int)
Rec: pixhex-d
Ejemplo uso: pixhex-d(10, 10, "#FF5733", 30, Lista), Devuelve lista = [10, 10, "#FF5733", 30].
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


/*Predicado Bit
Predicado para saber si un bit es 0 o 1.
Dom: Bit o Elemento.
Rec: Booleano, más que nada identificar si el bit es 0 o 1, esa es la única condición.

Ejemplo uso: 
(bit(0)).
*/

is_Abit(Bit):-
    Bit == 0,
    Bit == 1.

/*Predicado para verificar si en una lista es un bit, Aridad 1
Dom: ListaPixel
Rec: Booleano
*/

pixelABit(Pixel):-
    pixbitD(_,_,Bit,_,Pixel),
    is_Abit(Bit).

/*Predicado para saber si en una lista de pixeles hay un bit Aridad 2
Dom: Pixel
Rec: booleano
*/

containpixelABit([Pixel|Cola]):-
    pixelABit(Pixel),
    containpixelABit(Cola).

/*Predicado para verificar la pertenencia en un pixbit-d
Dom: pixrgb-d 
Rec: Booleano
*/
isABitmap([]).
isABitmap([Pixbitd| Cola]):-
    pixbitD(_,_,Bit,_,Pixbitd),
    (Bit==0 ; Bit==1),
    containpixelABit(Cola).

/*Predicado para verificar si existe bitmap en una imagen
Dom: imagen
Rec: imagen verificada->bitmap
*/

imagenABitmap([]).
imagenABitmap(Imagen):-
    Pixel = [],
    image(_,_,Pixel,Imagen),
    containpixelABit(Pixel).

