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
*/


/*Constructor pixbit-d
Dom: X(int) X Y(int) X Bit([0|1]) X Depth(int)
Rec: pixbit-d
Ejemplo uso: 
pixbit-d(10, 10, 1, 5, Lista). Devuelve Lista = [10, 10, 1, 5].
*/
pixbit-d(X, Y, Bit, Depth, [X,Y,Bit,Depth]).


/*Constructor pixrgb-d
Dom: X(int) X Y(int) X R(C) X G(C) X B(C) X D
Rec: pixrgb-d
Ejemplo uso:
pixrgb-d(10, 10, 255, 255,255, 10, Lista), Devuelve Lista = [10, 10, 255, 255, 255, 10].
*/
pixrgb-d(X, Y, R, G, B, D, [X, Y, R, G, B, D]).

/*Constructor pixhex-d
Dom: Dominio: X(int) X Y(int) X hex(string) X D(int)
Rec: pixhex-d
Ejemplo uso: pixhex-d(10, 10, "#FF5733", 30, Lista), Devuelve lista = [10, 10, "#FF5733", 30].
*/
pixhex-d(X, Y, Hex, D, [X, Y, Hex, D]).
