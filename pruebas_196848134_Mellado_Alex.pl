
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
*/
