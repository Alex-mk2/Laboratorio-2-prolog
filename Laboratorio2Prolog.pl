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


/*Selectores  TDA pitbitD*/
obtenerX([X|_], X).
obtenerY([_|[Y|_]], Y).
obtenerBit([_|[_|[Bit|_]]], Bit).
obtenerDepth([_|[_|[_|[Depth|_]]]], Depth).
obtenerListaPixel([_|[_|[_|[_|[ListaPixel|_]]]]], ListaPixel).


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


/*Selectores  TDA pixrgbD
Nota: No se repitieron los selectores X e Y ya que estan definidos*/
obtenerR([_|[_|[R|_]]], R).
obtenerG([_|[_|[_|[G|_]]]], G).
obtenerB([_|[_|[_|[_|[B|_]]]]], B).
obtenerD([_|[_|[_|[_|[_|[D|_]]]]]], D).




/*Constructor pixhex-d
Predicado pixhex-d
Dom: Dominio: X(int) X Y(int) X hex(string) X D(int)
Rec: pixhex-d
Ejemplo uso: 
pixhexD(10, 10, "#FF5733", 30, Lista), Devuelve lista = [10, 10, "#FF5733", 30].
pixhexD(1, 12, "#F08080", 35, Lista), Devuelve lista = [1, 12, "#F08080", 35].
pixhexD(2, 5, "#FA8072", 20, Lista), Devuelve lista = [2, 5, "#FA8072", 20].
*/
pixhexD(X, Y, Hex, D, [X, Y, Hex, D]).


/*Selectores  TDA pixhexD
Nota: No se repitieron los selectores X e Y ya que estan definidos*/
obtenerHex([_|[_|[Hex|_]]], Hex).
obtenerDHex([_|[_|[_|[D|_]]]], D).



/*Constructor image
Predicado image
Dom: Width(int) X Height(int) X [pixbit-d | pixrgb-d | pixhex-d] Aridad 5
Meta: Construir la imagen
Ejemplo uso: 
pixbit-d(10,20,1,25,L1),
pixbit-d(5,10,0,20,L2),
pixbit-d(0,50,1,4,L3),
pixbit-d(10,10,0,22,L4),
image(10,10,[L1,L2,L3,L4],LG)., Devuelve listaGeneral con todos los parametros dados
*/

imagen(Alto, Ancho, ListaPixeles, [Alto, Ancho, ListaPixeles]).


/*Selectores  TDA Image*/
obtenerAlto([Alto|_], Alto).
obtenerAncho([_|[Ancho|_]], Ancho).
obtenerListaPixelImagen([_|[_|[ListaPixeles|_]]], ListaPixeles).
obtenerPixeles([_|[_|[_|[Pixeles|_]]]], Pixeles).

/*Predicado para verificar la pertenencia en un pixbitD
Dom: pixrgb-d 
Meta: Saber si es un bitmap
*/
isABitmap([]).
isABitmap(Pixbit):-
    obtenerBit(Pixbit, Bit),
    (Bit==0 ; Bit==1).

/*Predicado complemento de isABitmap
Dom: lista
Meta: Verificar en la lista el bitmap*/

verificarBitmap([]).
verificarBitmap([Cabeza|Resto]):- 
    isABitmap(Cabeza),
    verificarBitmap(Resto).


/*Predicado para verificar si existe bitmap en una imagen
Dom: imagen
Meta: A traves de los predicados complemento, saber realmente si lo que se ingresa en una imagen es un bitmap
Ejemplo de uso: 

(pixbitD( 0, 0, 1, 10, PA), pixbitD( 0, 1, 0, 20, PB), 
pixbitD( 1, 0, 0, 30, PC), 
pixbitD( 1, 1, 1, 4, PD), 
image( 2, 2, [PA, PB, PC, PD], I), 
imagenABitmap(I)).

(((pixhexD( 0, 0, "#FF5733", 10, PA), 
         pixhexD( 0, 1, "#FF5733", 20, PB), 
         pixhexD( 1, 0, 1, 30, PC), 
         pixhexD( 1, 1, 1, 4, PD), 
         imagen(2,2,[PA, PB, PC, PD],I), 
imagenABitmap(I)))).
Retorna Falso.
*/

imagenIsABitmap([]).
imagenIsBitmap(Imagen):- 
    obtenerListaPixelImagen(Imagen, ListaPixeles), 
    verificarBitmap(ListaPixeles).



/*Predicado para verificar si existe pixrgb
 Dom: pixrgb
 Meta: Verificar si es un pixrgb con las condiciones dadas
*/
isAPixrgbD([]).
isAPixrgbD(Pixrgbd):-
           obtenerR(Pixrgbd, R),
           obtenerG(Pixrgbd, G),
           obtenerB(Pixrgbd, B),
           (R >= 0, R =< 255),
           (G >= 0, G =< 255),
           (B >= 0, B =< 255).

/*Predicado para verificar Pixmap
 * Dom: lista
 * Meta: Como el predicador para verificar bitmap, este seria para pixmap
 * y la meta sería la misma, verificar si es un pixmap
*/
verificarPixmap([]).
verificarPixmap([Cabeza|Resto]):- 
    isAPixrgbD(Cabeza),
    verificarPixmap(Resto).

/*Predicado para verificar si existe un pixmap
 * Dom: pixmap
 * Meta: Verificar si existe el pixmap (verdadero o falso) a traves de los predicados
 * complementos.
*/

imagenIsAPixmap([]).
imagenIsAPixmap(Imagen):-
           obtenerListaPixelImagen(Imagen, ListaPixeles),
           verificarPixmap(ListaPixeles).
           

/*Predicado para verificar si existe pixhex en una imagen
 * Dom: pixhexD
 * Meta o rec: verificar la existencia de pixhex y asi distinguir entre los 3 tipos de pixeles
*/

isAPixhex([]).
isAPixhex(Pixhex):-
    obtenerHex(Pixhex, Hex),
    string(Hex).
    
/*Predicado para verificar 
 * Dom: lista
 * Meta: De igual manera que los predicados verificarPixmap o verificarBitmap
 * Opera de la misma manera.
*/

verificarHexmap([]).
verificarHexmap([Cabeza|Resto]):-
    isAPixhex(Cabeza),
    verificarHexmap(Resto).
   

/*Predicado para verificar un hexmap
 * Dom: PixhexD
 * Meta o rec: verificar la existencia de un hexmap en una imagen
*/

imagenIsAHexmap([]).
imagenIsAHexmap(Imagen):-
    obtenerListaPixelImagen(Imagen, ListaPixeles),
    verificarHexmap(ListaPixeles).


/*Predicado complemento compress? verificar si se puede comprimir una imagen
 * Dom: Lista
 * Meta: complementar el predicado compress?
*/
isACompress([]).
isACompress(Compress):-
    obtenerAlto(Compress, Alto),
    obtenerAncho(Compress,Ancho),
    obtenerListaPixelImagen(Compress, ListaPixeles),
    (ListaPixeles < Alto * Ancho).
    
    
/*Predicado complemento para verificar isAcompress
 * Dom: Lista
 * Meta: Complemento al predicado IsAcompress
*/

verificarCompress([]).
verificarCompress([Cabeza|Resto]):-
    isACompress(Cabeza),
    verificarCompress(Resto).

/*Predicado para saber si una imagen se puede comprimir o no
 * Dom: Compress y complementos
 * Meta: Saber si es posible comprimir una imagen
*/

compress([]).
compress(Imagen):-
    obtenerListaPixelImagen(Imagen, ListaPixeles),
    verificarCompress(ListaPixeles).

    

/*Predicado pertenencia
 * De aqui surgio la idea del predicado verificar
 * Dom: elemento X elemento
 * Meta: Verificar si ese elemento existe
*/

pertenece(Elemento, [Elemento|_] ).
pertenece(Elemento, [_|Resto]):-
	pertenece(Elemento, Resto).



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
pixbitD(10,20,1,25,L1),pixbitD(5,10,0,20,L2),pixbitD(0,50,1,4,L3),pixbitD(10,10,0,22,L4), imagen(10,10,[L1,L2,L3,L4],I). Devuelve I con los parametros dados
pixbitD(15,22,0,22,L1),pixbitD(1,1,0,30,L2),pixbitD(5,50,0,10,L3),pixbitD(10,10,1,50,L4), imagen(10,2,[L1,L2,L3,L4],I). Devuelve I con los parametros dados
pixhexD(15,22,"#F08080",22,L1),pixhexD(1,1,"#FA8072",30,L2),pixhexD(5,50,"#FF5733",10,L3),pixhexD(10,10,"#FF5733",50,L4), imagen(10,2,[L1,L2,L3,L4],I). Devuelve I con los parametros dados


----------------------------------------------Pertenencias Bitmap----------------------------------------------------------------------------------------------------------

(pixbitD( 0, 0, 1, 10, PA), 
pixbitD( 0, 1, 0, 20, PB), 
pixbitD( 1, 0, 0, 30, PC), 
pixbitD( 1, 1, 1, 4, PD), 
imagen( 2, 2, [PA, PB, PC, PD], I), 
imagenABitmap(I)). 
Retorna verdadero, cumple con la condición de bit

(((pixhexD( 0, 0, "#FF5733", 10, PA), 
pixhexD( 0, 1, "#FF5733", 20, PB), pixhexD( 1, 0, 1, 30, PC), 
pixhexD( 1, 1, 1, 4, PD), 
imagen(2,2,[PA, PB, PC, PD],I), 
imagenABitmap(I)))).
Retorna Falso, cumple con la condición de bit.

(pixrgbD( 0, 0, 4, 10,10, 10, PA), pixrgbD( 0, 1, 4, 20,20, 20,PB), 
pixrgbD( 1, 0, 4, 30,30,30, PC), 
pixrgbD( 1, 1, 4, 4,4,4, PD), 
imagen( 2, 2, [PA, PB, PC, PD], I), 
imagenABitmap(I)). Retorna falso, cumple con la condicion de bit

--------------------------------------------------------------------Pertenencias Pixmap-------------------------------------------------------------------------------------

(pixbitD( 0, 0, 1, 10, PA), 
pixbitD( 0, 1, 0, 20, PB), 
pixbitD( 1, 0, 0, 30, PC), 
pixbitD( 1, 1, 1, 4, PD), 
imagen( 2, 2, [PA, PB, PC, PD], I), 
imagenIsAPixmap(I)). Retorna falso, cumple con la condición de pixmap

(pixhexD( 0, 0, "#FA8072", 10, PA), pixhexD( 0, 1, 0, 20, PB), 
pixhexD( 1, 0, 0, 30, PC), 
pixhexD( 1, 1, "#FA8072", 4, PD), 
imagen( 2, 2, [PA, PB, PC, PD], I), 
imagenIsAPixmap(I)). Retorna falso, cumple con la condicion de pixmap

(pixrgbD( 0, 0, 4, 10,10, 10, PA), pixrgbD( 0, 1, 4, 20,20, 20,PB), 
pixrgbD( 1, 0, 4, 30,30,30, PC), 
pixrgbD( 1, 1, 4, 4,4,4, PD), 
imagen( 2, 2, [PA, PB, PC, PD], I), 
imagenIsAPixmap(I)). Retorna verdadero, cumple con la condición de pixmap



--------------------------------------------------------------Pertenencia Hexmap--------------------------------------------------------------

(pixrgbD( 0, 0, 4, 10,10, 10, PA), 
pixrgbD( 0, 1, 4, 20,20, 20,PB), 
pixrgbD( 1, 0, 4, 30,30,30, PC), 
pixrgbD( 1, 1, 4, 4,4,4, PD), 
imagen( 2, 2, [PA, PB, PC, PD], I), 
imagenIsAHexmap(I)). Retorna Falso, no es un hexmap

(pixbitD( 0, 0, 4, 10, PA), pixbitD( 0, 1, 4, 10,PB), 
pixbitD( 1, 0, 4, 30,PC), 
pixbitD( 1, 1, 4, 4, PD), 
imagen( 2, 2, [PA, PB, PC, PD], I), 
imagenIsAHexmap(I)). Retorna falso, no es un hexmap

(pixhexD( 0, 0, "#FF5733", 10, PA), pixhexD( 0, 1, "#FF5733", 10,PB), 
pixhexD( 1, 0, "#FF5733", 30,PC), 
pixhexD( 1, 1, "#FF5733", 4, PD), 
imagen( 2, 2, [PA, PB, PC, PD], I), 
imagenIsAHexmap(I)). Cumple con la condición



------------------------------------------------------------Compress---------------------------------------------------------------------------
(pixbitD( 0, 0, 20, 10, PA), pixbitD( 0, 1, 20, 10,PB), 
pixbitD( 1, 2, 20, 30,PC), 
pixbitD( 1, 1, 20, 4, PD), 
imagen( 2, 2, [PA, PB, PC, PD], I), 
compress(I)). Tira falso