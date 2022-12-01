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
Metas primaria: pixbit-d, pixrgb-d, pixhex-d, alto, ancho
Meta Secundarias: Imagen

Predicado pixbit-d
Dominio: X(int) X Y(int) X Bit([0|1]) X Depth(int) Aridad 4
Metas primaria: pixbit-d, Bit
Metas Secundarias: Imagen

Predicado pixrgb-d
Dominio: X(int) X Y(int) X R(C) X G(C) X B(C) X D
Meta primaria: pixrgb-d
Meta secundaria: imagen

Predicado pixhex-d
Dominio: X(int) X Y(int) X hex(string) X D(int)
Meta primaria: pixhex-d
Meta secundaria: imagen
--------------------------------------------------------------------------------------------------------
*/


/*Constructor pixbit-d
Predicado pixbit-d
Dom: X(int) X Y(int) X Bit([0|1]) X Depth(int)
Meta primaria: pixbit-d
Ejemplo uso: 
pixbitD(10, 0, 1, 1, Lista). Devuelve Lista = [10, 0, 1, 1].
pixbitD(10, 5, 0, 5, Lista). Devuelve Lista = [10, 5, 0, 5].
pixbitD(20, 20, 0, 10, Lista). Devuelve Lista = [20, 20, 0, 10].
*/
pixbitD(X, Y, Bit, Depth, [X,Y,Bit,Depth]).


/*Selectores  TDA pixbitD*/
obtenerX([X|_], X).
obtenerY([_|[Y|_]], Y).
obtenerBit([_|[_|[Bit|_]]], Bit).
obtenerDepth([_|[_|[_|[Depth|_]]]], Depth).
obtenerListaPixel([_|[_|[_|[_|[ListaPixel|_]]]]], ListaPixel).


/*Constructor pixrgb-d
Predicado pixrgb.d
Dom: X(int) X Y(int) X R(C) X G(C) X B(C) X D
Meta primaria: pixrgb-d
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
Meta primaria: pixhex-d
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
Meta primaria: Construir la imagen
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
Meta secundaria: Saber si es un bitmap
*/
isABitmap([]).
isABitmap(Pixbit):-
    obtenerBit(Pixbit, Bit),
    (Bit==0 ; Bit==1).

/*Predicado complemento de isABitmap
Dom: lista
Meta secundaria: Verificar en la lista el bitmap*/

verificarBitmap([]).
verificarBitmap([Cabeza|Resto]):- 
    isABitmap(Cabeza),
    verificarBitmap(Resto).


/*Predicado para verificar si existe bitmap en una imagen
Dom: imagen
Meta primaria: A traves de los predicados complemento, saber realmente si lo que se ingresa en una imagen es un bitmap
Ejemplo de uso: 
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
 Meta secundaria: Verificar si es un pixrgb con las condiciones dadas
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
 * Meta secundaria: Como el predicador para verificar bitmap, este seria para pixmap
 * y la meta sería la misma, verificar si es un pixmap
*/
verificarPixmap([]).
verificarPixmap([Cabeza|Resto]):- 
    isAPixrgbD(Cabeza),
    verificarPixmap(Resto).

/*Predicado para verificar si existe un pixmap
 * Dom: pixmap
 * Meta Primaria: Verificar si existe el pixmap (verdadero o falso) a traves de los predicados
 * complementos.
*/

imagenIsAPixmap([]).
imagenIsAPixmap(Imagen):-
           obtenerListaPixelImagen(Imagen, ListaPixeles),
           verificarPixmap(ListaPixeles).
           

/*Predicado para verificar si existe pixhex en una imagen
 * Dom: pixhexD
 * Meta secundaria: verificar la existencia de pixhex y asi distinguir entre los 3 tipos de pixeles
*/

isAPixhex([]).
isAPixhex(Pixhex):-
    obtenerHex(Pixhex, Hex),
    string(Hex).
    
/*Predicado para verificar 
 * Dom: lista
 * Meta secundaria: De igual manera que los predicados verificarPixmap o verificarBitmap
 * Opera de la misma manera.
*/

verificarHexmap([]).
verificarHexmap([Cabeza|Resto]):-
    isAPixhex(Cabeza),
    verificarHexmap(Resto).
   

/*Predicado para verificar un hexmap
 * Dom: PixhexD
 * Meta Primaria: verificar la existencia de un hexmap en una imagen
*/

imagenIsAHexmap([]).
imagenIsAHexmap(Imagen):-
    obtenerListaPixelImagen(Imagen, ListaPixeles),
    verificarHexmap(ListaPixeles).


/*Predicado complemento compress? verificar si se puede comprimir una imagen
 * Dom: Lista
 * Meta Secundaria: complementar el predicado compress?
*/
isACompress([]).
isACompress(Compress):-
    obtenerAlto(Compress, Alto),
    obtenerAncho(Compress,Ancho),
    obtenerListaPixelImagen(Compress, ListaPixeles),
    (ListaPixeles < Alto * Ancho).
    
    
/*Predicado complemento para verificar isAcompress
 * Dom: Lista
 * Meta Secundaria: Complemento al predicado IsAcompress
*/

verificarCompress([]).
verificarCompress([Cabeza|Resto]):-
    isACompress(Cabeza),
    verificarCompress(Resto).

/*Predicado para saber si una imagen se puede comprimir o no
 * Dom: Compress 
 * Meta primaria: Saber si es posible comprimir una imagen
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


/*Predicado flipHbit
 * Predicado para voltear un pixbit
 * Dom: Pixeles X Ancho X NuevosPixeles
 * Meta: Complemento para el predicado flipH
*/

flipHPixbit([], _,[]).
flipHPixbit([Pixeles|Resto],Largo,[NewPixel|Resto2]):-
    pixbitD(X, Y, Bit, Depth, Pixeles),
    (   X < Largo + 1
    ->  NewX is (X - 1)
    ;   NewX is X
    ),
    pixbitD(NewX, Y, Bit, Depth, NewPixel),
    flipHPixbit(Resto, Largo, Resto2).



/*Predicado para voltear un pixrgb 
 * Dom: Pixeles X Ancho X NuevosPixeles 
 * Meta: Rotar un Pixel perteneciente a pixrgb
*/

flipHPixrgb([], _,[]).
flipHPixrgb([Pixeles|Resto],Largo,[NewPixel|Resto2]):-
    pixrgbD(X, Y, R, G, B, D , Pixeles),
    (   X < (Largo + 1)
    ->  NewX is ((X - 1))
    ;   NewX is X
    ),
    pixrgbD(NewX, Y, R, G, B, D, NewPixel),
    flipHPixrgb(Resto, Largo, Resto2).

/*Predicado que voltea una imagen horinzontalmente
 * Dom: Imagen X NuevaImagen
 * Meta: Voltear una imagen
*/

imagenFlipH(I, I2):-
    imagen(X,Y,Pixeles,I),
    (imagenIsAPixmap(I)
    ->  flipHPixrgb(Pixeles,X,NuevaListaPixeles)
    ;   flipHPixbit(Pixeles,X,NuevaListaPixeles)
    ),
    imagen(X, Y, NuevaListaPixeles, I2).
   

    
/*Predicado que voltea un pixbit de forma vertical
 * Dom: Pixeles X Alto X NuevosPixeles
 * Meta: Voletar de forma vertical un pixbit
*/
flipVPixbit([], _,_,[]).
flipVPixbit([Pixeles|Resto],Ancho,Alto,[NewPixel|Resto2]):-
    pixbitD(X, Y, Bit, Depth, Pixeles),
    (   Y < Alto + 1
    ->  NewY is (Y - 1)
    ;   NewY is Y
    ),
    pixbitD(X, NewY, Bit, Depth, NewPixel),
    flipVPixbit(Resto, Ancho, Alto,Resto2).

/*Predicado que voltea un pixrgb de manera vertical
 * Dom: Pixeles X Alto X NuevosPixeles
 * Meta: Voltear una imagen de tipo pixrgb de manera vertical
*/

flipVPixrgb([],_,_,[]).
flipVPixrgb([Pixeles|Resto],Ancho, Alto,[NewPixel|Resto2]):-
    pixrgbD(X, Y, R, G, B, D , Pixeles),
    (   Y < (Alto + 1)
    ->  NewY is ((Y - 1))
    ;   NewY is Y
    ),
    pixrgbD(X, NewY, R, G, B, D, NewPixel),
    flipVPixrgb(Resto, Ancho, Alto,Resto2).

/*Predicado para voltear una imagen
 * Dom: Imagen X NuevaImagen
 * Meta: Voltear una imagen con sus debidas caracteristicas en los pixeles
*/

imagenFlipV(I, I2):-
    imagen(X,Y,Pixeles,I),
    (imagenIsAPixmap(I)
    ->  flipVPixrgb(Pixeles,X,Y, NuevaListaPixeles)
    ;   flipVPixbit(Pixeles,X,Y,NuevaListaPixeles)
    ),
    imagen(X, Y, NuevaListaPixeles, I2).


/*Predicado para agregar elementos a la lista
 * Dom: Elemento X Lista X elemento
 * Meta: Añadir elementos a la lista
*/
append(Elemento, [], [Elemento]).
append(Elemento, Lista, [Elemento|Lista]).

/*Predicado que recorta un pixbit
 * Dom: ListaPixbit X X(int) X Y(int) X X1(int) X (Y1) X PixbitResultante 
 * Meta: Recortar una imagen con los pixeles pixbitD, para finalmente recortar una imagen
*/

cropPixbit([],_,_,_,_,[]).
cropPixbit([Pixeles|Resto], X1, Y1, X2, Y2, PixbitResultante):-
    cropPixbit(Resto, X1, Y1, X2,Y2, PixelesAnteriores),
    pixbitD(Alto, Ancho,_,_,Pixeles),
    (X1 =< Alto), 
    (Alto =< X2),
    (Y1 =< Ancho),
    (Ancho =< Y2),
    (append(Pixeles, PixelesAnteriores, PixbitResultante);
    (append([],PixelesAnteriores, PixbitResultante))).
    

/*Predicado que recorta un pixrgb
 * Dom: ListaPixRGB X X1(int) X Y1(int) X X2(int) X Y2(int) X PixRGBResultante
 * Meta: Recortar un pixrgbD para finalmente recortar una imagen
*/

cropPixRGB([],_,_,_,_,[]).
cropPixRGB([Pixeles|Resto], X1,Y1,X2,Y2, PixRGBResultante):-
    cropPixRGB(Resto,X1,Y1,X2,Y2,PixelesAnteriores),
    pixrgbD(Alto,Ancho,_,_,_,_,Pixeles),
    (X1 =< Alto),
    (Alto =< X2),
    (Y1 =< Ancho),
    (Ancho =< Y2),
    (append(Pixeles,PixelesAnteriores, PixRGBResultante);
    (append([],PixelesAnteriores,PixRGBResultante))).

/*Predicado que recorta un pixhex
 * Dom: ListaPixHex X X1(int) X Y1(int) X X2(int) X Y2(int) X PixHexResultante
 * Meta: Recortar un pixhexD para finalmente recortar una imagen
*/
cropPixHex([],_,_,_,_,[]).
cropPixHex([Pixeles|Resto], X1,Y1,X2,Y2,PixHexResultante):-
    cropPixHex(Resto,X1,Y1,X2,Y2,PixelesAnteriores),
    pixhexD(Alto,Ancho,_,_,Pixeles),
    (X1 =< Alto), 
    (Alto =< X2),
    (Y1 =< Ancho),
    (Ancho =< Y2),
    (append(Pixeles,PixelesAnteriores,PixHexResultante);
    (append([],PixelesAnteriores,PixHexResultante))).

/*Predicado para recortar una imagen con la lista de pixeles
 * Dom: Imagen X X1(int) X Y1(int) X X2(int) X Y2(int) X ImagenResultante
 * Meta: Recortar una imagen con todas las listas de pixeles realizados previamente
 * Para así obtener el recorte de una imagen con sus pixeles.
*/

imagenCrop(Imagen, X1, Y1, X2, Y2, ImagenResultante):-
    imagen(X3, Y3, ListaPixeles, Imagen),
    ((imagenIsABitmap(Imagen),cropPixbit(ListaPixeles,X1,Y1,X2,Y2, NuevaListaPixeles),!);
    (imagenIsAPixmap(Imagen),cropPixRGB(ListaPixeles,X1,Y1,X2,Y2, NuevaListaPixeles),!);
    (imagenIsAHexmap(Imagen),cropPixHex(ListaPixeles,X1,Y1,X2,Y2, NuevaListaPixeles))),
    imagen(X3,Y3,NuevaListaPixeles,ImagenResultante).

/*Predicado complemento para convertir una imagen
 * Dom: Elemento X Elemento
 * Meta: Complemento para convertir una imagen
 * Para trabajar con este apartado se uso la documentacion en prolog para convertir a hex
 * Se trabaja con el formato 0xFF
 */ 

convertirRGBAHex(Numero,Elemento):-
    Numero =< 0xFF,
    format(atom(Atom_lower),'|`0t~16r~2|', Numero),
    upcase_atom(Atom_lower,Elemento).

convertirRGBAHex(Numero,Elemento):-
    Numero =< 0xFFFF,
    format(atom(Atom_lower),'|`0t~16r~4|', Numero),
    upcase_atom(Atom_lower,Elemento).

convertirRGBAHex(Numero,Elemento):-
    Numero =< 0xFFFFFFFF,
    format(atom(Atom_lower),'|`0t~16r~8|', Numero),
    upcase_atom(Atom_lower,Elemento).

convertirRGBAHex(Numero,Elemento):-
    Numero =< 0xFFFFFFFFFFFFFFFF,
    format(atom(Atom_lower),'|`0t~16r~16|', Numero),
    upcase_atom(Atom_lower,Elemento).

/*Predicado complemento para recorrer y convertir una lista de RGB a Hexadecimal
 * Dom: Lista X Elemento
 * Meta: Poder convertir una imagenRGB a una imagenHex
*/

listaImagenRGBToHex([], ListaPixeles, ListaPixeles).
listaImagenRGBToHex([Cabeza|Resto], PixelesHexa, ListaPixeles):-
    pixrgbD(X, Y, R, G, B, D, Cabeza),
    convertirRGBAHex(R, Red),
    convertirRGBAHex(G, Green),
    convertirRGBAHex(B, Blue),
    string_concat(Red,Green, ListaRG),
    string_concat(ListaRG, Blue, ListaRGB),
    pixhexD(X,Y,HexNew, D, _),
    append(ListaPixeles,HexNew, PixelesHexa),
	listaImagenRGBToHex(Resto, PixelesHexa, PixelesHexa).

/*Predicado para convertir una imagenRGB a una imagenHex
 * Dom: ImagenRGB X ImagenHex
 * Meta: Poder convertir una imagenRGB a una imagenHexa
*/

imagenRGBAImagenHex(Imagen, NuevaImagen):-
    imagen(X,Y,ListaPixeles,Imagen),
    listaImagenRGBToHex(ListaPixeles,_, ListaHex),
    imagen(X,Y,ListaHex,NuevaImagen).

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
Retorna Falso, no cumple con la condición de bit.

(pixrgbD( 0, 0, 4, 10,10, 10, PA), pixrgbD( 0, 1, 4, 20,20, 20,PB), 
pixrgbD( 1, 0, 4, 30,30,30, PC), 
pixrgbD( 1, 1, 4, 4,4,4, PD), 
imagen( 2, 2, [PA, PB, PC, PD], I), 
imagenABitmap(I)). Retorna falso, no cumple con la condicion de bit

--------------------------------------------------------------------Pertenencias Pixmap-------------------------------------------------------------------------------------

(pixbitD( 0, 0, 1, 10, PA), 
pixbitD( 0, 1, 0, 20, PB), 
pixbitD( 1, 0, 0, 30, PC), 
pixbitD( 1, 1, 1, 4, PD), 
imagen( 2, 2, [PA, PB, PC, PD], I), 
imagenIsAPixmap(I)). Retorna falso, no cumple con la condición de pixmap

(pixhexD( 0, 0, "#FA8072", 10, PA), pixhexD( 0, 1, 0, 20, PB), 
pixhexD( 1, 0, 0, 30, PC), 
pixhexD( 1, 1, "#FA8072", 4, PD), 
imagen( 2, 2, [PA, PB, PC, PD], I), 
imagenIsAPixmap(I)). Retorna falso, no cumple con la condicion de pixmap

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
compress(I)). Retorna falso

pixbitD( 0, 0, 1, 10, PA), 
pixbitD( 0, 1, 0, 20, PB), 
pixbitD( 1, 0, 0, 30, PC), 
pixbitD( 1, 1, 1, 4, PD), 
imagen( 2, 2, [PA, PB, PC, PD], I), 
compress(I). Retorna falso

pixbitD( 1, 0, 1, 10, PA), 
pixbitD( 1, 1, 0, 10, PB), 
pixbitD( 1, 0, 0, 10, PC), 
pixbitD( 1, 1, 1, 10, PD), 
imagen( 2, 2, [PA, PB, PC, PD], I), 
compress(I).Retorna falso




-------------------------------------------------imagenFlipH----------------------------------------------------------
(pixbitD(2, 2, 1, 10, PA), 
pixbitD( 2, 2, 1, 0, PB), 
pixbitD( 2, 2, 1, 10, PC), 
pixbitD( 2, 2, 0, 10, PD), 
imagen( 2, 2, [PA, PB, PC, PD], I), 
imagenFlipH(I,I2)).


(pixrgbD(2, 2, 1, 10,10,10, PA), 
pixrgbD( 2, 2, 1, 0,20,20, PB), 
pixrgbD( 2, 2, 1, 10,30,30, PC), 
pixrgbD( 2, 2, 0, 10,40,40, PD), 
imagen( 2, 2, [PA, PB, PC, PD], I), 
imagenFlipH(I,I2)).

(pixbitD( 2, 2, 10, 10, PA), 
pixbitD( 2, 2, 20, 20, PB), 
pixbitD( 2, 2, 30, 30, PC), 
pixbitD( 2, 2, 40, 40, PD), 
imagen( 2, 2, [PA, PB, PC, PD], I), 
imagenFlipH(I,I2)).


--------------------------------------------------ImagenFlipV--------------------------------------------------------------
(pixrgbD(2, 2, 1, 10,10,10, PA), 
pixrgbD( 2, 2, 1, 0,20,20, PB), 
pixrgbD( 2, 2, 1, 10,30,30, PC), 
pixrgbD( 2, 2, 0, 10,40,40, PD), 
imagen( 2, 2, [PA, PB, PC, PD], I), 
imagenFlipV(I,I2)).


(pixbitD( 2, 2, 1, 10, PA), 
pixbitD( 2, 2, 1, 20, PB), 
pixbitD( 2, 2, 1, 30, PC), 
pixbitD( 2, 2, 1, 4, PD), 
imagen( 2, 2, [PA, PB, PC, PD], I), 
imagenFlipV(I,I2)).


(pixrgbD(2, 2, 1, 10,10,10, PA), 
pixrgbD(2, 2, 1, 0,20,20, PB), 
pixrgbD(2, 2, 1, 10,30,30, PC), 
pixrgbD(2, 2, 0, 10,40,40, PD), 
imagen(2, 2, [PA, PB, PC, PD], I), 
imagenFlipV(I,I2)).

---------------------------------------------------cropImagen--------------------------------------------------------------
imagenCrop(Img1, 10, 10, 40, 40, Img2). Devuelve los elementos recortados en una imagen
imagenCrop(Img1, 5, 5, 20, 20, Img2). Devuelve los elementos recortados en una imagen
imagenCrop(Img1, 4, 4, 12, 12, Img2). Devuelve los elementos recortados en una imagen


---------------------------------------------------imgRGB->imgHex-------------------------------------------------------------
(pixrgbD( 0, 0, 10, 10, 10, 10, P1), 
pixrgbD( 0, 1, 20, 20, 20, 20, P2), 
pixrgbD( 1, 0, 30, 30, 30, 30, P3), 
pixrgbD( 1, 1, 40, 40, 40, 40, P4), 
imagen( 2, 2,[ P1, P2, P3, P4], I1), imagenRGBAImagenHex(I1, I2)). Devuelve un escrito en hexadecimal

(pixrgbD( 0, 0, 5, 5, 5, 5, P1), 
pixrgbD( 0, 1, 10, 10, 10, 10, P2), 
pixrgbD( 1, 0, 30, 30, 30, 30, P3), 
pixrgbD( 1, 1, 40, 40, 40, 40, P4), 
imagen( 2, 2,[ P1, P2, P3, P4], I1), imagenRGBAImagenHex(I1, I2)). Devuelve un escrito en hexadecimal

(pixrgbD( 0, 0, 5, 5, 5, 5, P1), 
pixrgbD( 0, 1, 10, 10, 10, 10, P2), 
pixrgbD( 1, 0, 10, 10, 10, 10, P3), 
pixrgbD( 1, 1, 20, 20, 20, 20, P4), 
imagen( 2, 2,[ P1, P2, P3, P4], I1), imagenRGBAImagenHex(I1, I2)). Devuelve un escrito en hexadecimal

*/

