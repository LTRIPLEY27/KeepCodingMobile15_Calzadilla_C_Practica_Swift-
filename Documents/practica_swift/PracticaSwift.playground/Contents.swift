import UIKit

// PRACTICA SWIFT

/*
 1.- Calcular y generar una lista con los 100 primeros números primos y hacer un
 print de los últimos 10
 */

var primo = [Int]();    //  --- DECLARACION DE LA LISTA PARA SER MAS TACITO
for i in 1 ... 200 where i % 2 == 0 { primo.append(i) }

primo.count   /// VERIFICACION DE LOS 100 PRIMO

for x in 0 ... 9  {print((primo.reversed()[x]))}
