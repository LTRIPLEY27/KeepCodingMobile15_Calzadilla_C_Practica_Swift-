import UIKit

// PRACTICA SWIFT

/**
 1.- Calcular y generar una lista con los 100 primeros números primos y hacer un
 print de los últimos 10
 */

var primos : [Int] = [2];    //  --- DECLARACION DE LA LISTA PARA SER MAS TACITO

// LO INTENT{E DESDE {ESTA MANERA PERO NO S{E MUY BIEN INDICAR CONDICIONALES
for i in 3 ... 541 where  i % 2 != 0  && i % i == 0  { primos.append(i) }

/// VERIFICACION DE LOS 100 PRIMO
print(primos)

// IMPRESIÓN DE LOS ÚLTIMOS 10 PRIMOS

print("\n \n Los últimos 10 elementos de la lista son : ")
for x in 0 ... 9  {print((primos.reversed()[x]))}

/**
 2.- Calcular la suma de los primeros 50 números primos y hacer un print del
 resultado.
 */

func suma() -> Int {
    var sumTotal : Int = 0;
    for _ in 0 ... 49 {
        sumTotal = primos.reduce(into : 0){$0 += $1}
    }
    return sumTotal
}

print("\n \n La suma de los 50 primeros primos es igual \(suma())")

/**
 3.- Dada la siguiente lista, obtener todos los elementos que contengan más de dos
 vocales:
 val players: [String] = [“Vinicius”, “Messi”, “Ronaldo”, “Pedri”, “Mbappe”,
 “Modric”, “Militao”, “Morata”, “Valverde”, “Benzema”, “Piqué” ]
 */

var players: [String] = ["Vinicius", "Messi", "Ronaldo", "Pedri", "Mbappe","Modric", "Militao", "Morata", "Valverde", "Benzema", "Piqué" ]

//var jugador = players.filter{ $0.contains {$0 == "a" || $0 == "e" || $0 == "i" || $0 == "o" || $0 == "u" }}

var jugadores : [String] = []

func vocalCounter()  -> [String] {
    for i in players {
        var cont : Int = 0
        for x in i where x == "a" || x == "e" || x == "i" || x == "o" || x == "u"  {
            cont += 1
        }
        if cont > 2 {
            //print("\n Jugadores con más de 2 vocales en su nombre : \(i)")
            jugadores.append(i)
        }
    }
    
    return jugadores
}

print("\n Jugadores con más de 2 vocales en su nombre son: \(vocalCounter())")

/**
 4.- Crear un enumerado que permita indicar la posición en el campo de un jugador
 de fútbol, por ejemplo: Portero, Lateral Derecho, Central, Lateral Izquierdo,
 Mediocentro, Extremo Derecha, Extremo Izquierda, Delantero, etc
 */

enum Player {
    case Portero
    case LateralDerecho
    case Central
    case LateralIzquierdo
    case Mediocentro
    case ExtremoDerecha
    case ExtremoIzquierda
    case Delantero
}


/**
 5.- Crear una clase, con los atributos necesarios, para representar a los miembros
 que participan en una selección del mundial y un enumerado que los diferencie por
 tipo, por ejemplo: Jugador, Seleccionador, Médico, etc.
 */


class Member {
    
    // ATRIBUTOS
    var name : String = ""
    var age : UInt = 0
    var tipo : Tipo
    
    init (name : String = "", age : UInt = 0, tipo : Tipo){
        self.name = name
        self.age = age
        self.tipo = tipo
    }
    
    // DECLARACI{ON DEL ENUM
    enum Tipo {
        case Jugador
        case Seleccionador
        case Médico
        case Asistente
    }
    
    var toString : String { return "\n\nMiembro : \nNombre : \(name) \nEdad : \(age) \nTipo : \(tipo)"}
}

// INSTANCIACIÓN DE CLASE
var member = Member(name: "Messi", age: 25, tipo: Member.Tipo.Jugador)

print(member.toString)

/**6.- Crear las clases necesarias, con los atributos mínimos, para representar las
 selecciones de fútbol del Mundial de fútbol 2022, por ejemplo: Una clase que
 represente el Mundial, necesitaremos que contenga un listado de Selecciones, cada
 selección tendrá sus atributos, como nombre, país, jugadores, seleccionador, etc.*/


// CLASE MUNDIAL, CONTENDRÁ UNA LISTA DE CADA SELECCIÓN A DISPUTAR EL MUNDIAL
class Mundial {
    
    var seleccion : [Seleccion] = []
    
    init(seleccion : [Seleccion]){
        self.seleccion = seleccion
    }
    
    var toString : String {
        print("\n\nParticipantes :")
        for i in seleccion {
            print("\n\nEquipo : \(i.toString)")
            }
        return seleccion.description
    }
}


// CLASE SELECCIÓN, COMPRENDER{A LA LISTA DE OBJETOS DE LA CLASE MUNDIAL
class Seleccion {
    var name : String
    var country : Country
    var players : [String]
    var director : String
    
    init (name : String = "", country : Country, players : [String] = [],director : String = ""){
        
        self.name = name
        self.country = country
        self.players = players
        self.director = director
    }
    
    enum Country {
        case PaisesBajos, Senegal, Ecuador, Brazil, Catar, Inglaterra, EstadosUnidos, Iran, Gales, Argentina, Polonia, Mexico, Arabia, Francia, Australia, Tunez, Dinamarca, Japon, Espana, Alemania, CostaRica, Marruecos, Croacia, Belgica, Canada
    }
    
    
    // INTERPOLACIÓN DE STRING PARA RETORNAR TODOS LOS ATRIBUTOS
    public var toString : String { return "\n\nSelección : \(name) \n - País : \(country) \n - Jugadores : \(players) \n - Técnico : \(director)"}
}

var argentina = Seleccion(name: "Albiceleste", country: Seleccion.Country.Argentina, players : ["Messi","Lautaro", "Di maria"], director: "Luis Scaloni")
var brazil = Seleccion(name: "Canarihna", country: Seleccion.Country.Brazil, players : ["Neymar","Rodrygo", "Faustinho"], director: "Ronaldinho")
var holanda = Seleccion(name: "Naranja Mecánica", country: Seleccion.Country.PaisesBajos, players : ["Von Cryuff","Van der Meer", "Robben"], director: "Fred Niels")
var espanya = Seleccion(name: "La Roja", country: Seleccion.Country.Espana, players : ["Pedri","Morata", "Casillas"], director: "Luis Stream")
var francia = Seleccion(name: "Les Blues", country: Seleccion.Country.Francia, players : ["Zidane","Mbappé", "Cherrie"], director: "Luc Besson")
var japon = Seleccion(name: "Blue Samurays", country: Seleccion.Country.Japon, players : ["Yakusa","Fukunaga", "Mishi"], director: "Tadeo Hidetora")

print(argentina.toString)

var equipos = Mundial(seleccion: [argentina, brazil, holanda, espanya, francia, japon])

print(equipos.toString)


/**7.- Crear una clase para representar los partidos entre selecciones, deberá contener
 atributos como equipo local, visitante y resultado como mínimo. Generar una lista
 aleatoria de partidos entre la lista de selecciones anteriores y hacer un print de este
 estilo por partido:
 Partido: España 3 - 1 Brasil*/
