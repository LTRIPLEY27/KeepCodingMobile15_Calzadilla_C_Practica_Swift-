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
    
    var seleccion : [Seleccion]
    var grupo : [Group]
    
    init(seleccion : [Seleccion] = [], grupo : [Group] = []){
        self.seleccion = seleccion
        self.grupo = grupo

    }
    
    
    // VARIABLE COMPUTADA QUE GENERA LOS EQUIPOS DE FORMA ALEATORIA
    var makeTeams : Void {
        var group : Group = Group()

        for i in 0 ... 3 {
            group = Group()
            var names: [Seleccion] = []
            for _ in 0 ... 3 {
                var random = Int.random(in: 0 ... seleccion.count)
                names.append(seleccion[random])
                seleccion.remove(at: random)
            }

            group = Group(nameGroup: "\(i)", members : seleccion, matchs: Game(equipoLocal: true, equipoVisitante: false))
            
            grupo.append(group)
        }
        
        grupo.forEach{ print($0.members)}
    
    }
    
    var toString : Void {
        print("\n\nParticipantes :")
        for i in seleccion {
            print("\n\nEquipo : \(i.toString) \nGrupo \(i.toString)")
            }
    }
}


// CLASE SELECCIÓN, COMPRENDER{A LA LISTA DE OBJETOS DE LA CLASE MUNDIAL
class Seleccion {

    var country : Country
    var players : [String]
    var victory : Int

    
    init (name : String = "", country : Country, players : [String] = [], victory : Int = 0){
        
        self.country = country
        self.players = players
        self.victory = victory

    }
    
    enum Country {
        case PaisesBajos, Senegal, Ecuador, Brazil, Catar, Inglaterra, EstadosUnidos, Iran, Gales, Argentina, Polonia, Mexico, Arabia, Francia, Australia, Tunez, Dinamarca, Japon, Espana, Alemania, CostaRica, Marruecos, Croacia, Belgica, Canada, Portugal, Ghana, Uruguay, Corea, Camerun, Serbia, Suiza
    }
    
    
    // INTERPOLACIÓN DE STRING PARA RETORNAR TODOS LOS ATRIBUTOS
    public var toString : String { return "\n\nSelección : \(country) \n - Jugadores : \(players) "}
}


/**7.- Crear una clase para representar los partidos entre selecciones, deberá contener
 atributos como equipo local, visitante y resultado como mínimo. Generar una lista
 aleatoria de partidos entre la lista de selecciones anteriores y hacer un print de este
 estilo por partido:
 Partido: España 3 - 1 Brasil*/

class Game {
    var equipoLocal : Bool
    var equipoVisitante : Bool
    var resultados : [String] = []
    
    init(equipoLocal : Bool = false, equipoVisitante : Bool = false) {

        self.equipoLocal = equipoLocal
        self.equipoVisitante = equipoVisitante

    }
    
    
    
   /* var match : String  {
        var randomGoals1 : Int = Int.random(in: 0 ... 10)
        var randomGoals2 : Int = Int.random(in: 0 ... 10)

        
        //return "\n\nResultados : \(selecciones[0].country) - \(randomGoals1) - \(selecciones[1].country) \(randomGoals2)"
        print("\n\nResultados : \(selecciones[0].country) - \(randomGoals1) - \(selecciones[1].country) \(randomGoals2)")
        
        return "\(selecciones[0].country)  \(selecciones[1].country)"
    }*/
    
    /*var toString : String {

        return "\n\nPartido \(selecciones[0].country) - \(selecciones[1].country) \n\nPais : \(selecciones[0].country) \nLocal : \(equipoLocal) \n\nPais : \(selecciones[1].country) \nVisitante \(equipoVisitante) \n\n \(match)"
    }*/
}


/**8.- Generar de forma aleatoria, dentro de la clase Mundial, un listado de grupos con
 un máximo de 4 selecciones por grupo, se puede crear una clase nueva Grupo que
 contenga el nombre del grupo, listado de participantes y listado de partidos. Por
 ejemplo: Grupo A España, Brasil, Francia, Alemania.*/

class Group {
    
    var nameGroup : String
    var members: [Seleccion]
    var matchs : Game

    init(nameGroup : String = "", members: [Seleccion] = [], matchs : Game = Game()) {
        
        self.nameGroup = nameGroup
        self.members = members
        self.matchs = matchs
    }
    
    func makeMatch()
    {
        var randomGoals1 : Int = Int.random(in: 0 ... 10)
        var randomGoals2 : Int = Int.random(in: 0 ... 10)
        
        if randomGoals1 > randomGoals2 {
            members[0].victory += 3
        }
        if randomGoals1 == randomGoals2 {
            members[0].victory += 1
            members[1].victory += 1
        } else {
            members[1].victory += 3
        }
        
        print("\n\nResultados : \(members[0].country) - \(randomGoals1) - \(members[1].country) \(randomGoals2)")
    }
    
    var toString : String {
        
        return "\n\nGrupo \(nameGroup) \nSelecciones \(members) \nPartidos \(matchs)"
    }
}



// MARK - INSTANCIACION DE CLASES  -->  {SELECCIONES}

// MARK - GRUPOS  -->  A
var holanda = Seleccion(name: "Paises Bajos", country: Seleccion.Country.PaisesBajos, players : ["Von Cryuff","Van der Meer", "Robben"])

var senegal = Seleccion(name: "Senegal", country: Seleccion.Country.Senegal, players : ["Von Cryuff","Van der Meer", "Robben"])

var ecuador = Seleccion(name: "Ecuador", country: Seleccion.Country.Ecuador, players : ["Von Cryuff","Van der Meer", "Robben"])

var catar = Seleccion(name: "Catár", country: Seleccion.Country.Catar, players : ["Von Cryuff","Van der Meer", "Robben"])

// MARK - GRUPOS  -->  B


var inglaterra = Seleccion(name: "Inglaterra", country: Seleccion.Country.Inglaterra, players : ["Messi","Lautaro", "Di maria"])

var usa = Seleccion(name: "Estados Unidos", country: Seleccion.Country.EstadosUnidos, players : ["Messi","Lautaro", "Di maria"])

var iran = Seleccion(name: "Irán", country: Seleccion.Country.Iran, players : ["Messi","Lautaro", "Di maria"])

var gales = Seleccion(name: "Gales", country: Seleccion.Country.Gales, players : ["Messi","Lautaro", "Di maria"])

// MARK - GRUPOS  -->  C

var argentina = Seleccion(name: "Argentina", country: Seleccion.Country.Argentina, players : ["Messi","Lautaro", "Di maria"])

var polonia = Seleccion(name: "Polonia", country: Seleccion.Country.Polonia, players : ["Messi","Lautaro", "Di maria"])

var mexico = Seleccion(name: "Mexico", country: Seleccion.Country.Mexico, players : ["Messi","Lautaro", "Di maria"])

var arabia = Seleccion(name: "Arabia", country: Seleccion.Country.Arabia, players : ["Messi","Lautaro", "Di maria"])

// MARK - GRUPOS  -->  D

var francia = Seleccion(name: "Francia", country: Seleccion.Country.Francia, players : ["Neymar","Rodrygo", "Faustinho"])

var australia = Seleccion(name: "Australia", country: Seleccion.Country.Australia, players : ["Neymar","Rodrygo", "Faustinho"])

var tunez = Seleccion(name: "Tunez", country: Seleccion.Country.Tunez, players : ["Neymar","Rodrygo", "Faustinho"])

var dinamarca = Seleccion(name: "Dinamarca", country: Seleccion.Country.Dinamarca, players : ["Neymar","Rodrygo", "Faustinho"])


// MARK - GRUPOS  -->  E
var japon = Seleccion(name: "Japón", country: Seleccion.Country.Japon, players : ["Yakusa","Fukunaga", "Mishi"])

var espanya = Seleccion(name: "España", country: Seleccion.Country.Espana, players : ["Pedri","Morata", "Casillas"])

var alemania = Seleccion(name: "Alemania", country: Seleccion.Country.Alemania, players : ["Neymar","Rodrygo", "Faustinho"])

var costa_rica = Seleccion(name: "Costa Rica", country: Seleccion.Country.CostaRica, players : ["Neymar","Rodrygo", "Faustinho"])

// MARK - GRUPOS  -->  F

var marruecos = Seleccion(name: "Marruecos", country: Seleccion.Country.Marruecos, players : ["Zidane","Mbappé", "Cherrie"])

var croacia = Seleccion(name: "Croacia", country: Seleccion.Country.Croacia, players : ["Neymar","Rodrygo", "Faustinho"])

var belgica = Seleccion(name: "Bélgica", country: Seleccion.Country.Belgica, players : ["Neymar","Rodrygo", "Faustinho"])

var canada = Seleccion(name: "Canadá", country: Seleccion.Country.Canada, players : ["Neymar","Rodrygo", "Faustinho"])


// MARK - GRUPOS  -->  G

var brazil = Seleccion(name: "Brazil", country: Seleccion.Country.Brazil, players : ["Neymar","Rodrygo", "Faustinho"])

var serbia = Seleccion(name: "Serbia", country: Seleccion.Country.Serbia, players : ["Neymar","Rodrygo", "Faustinho"])

var suiza = Seleccion(name: "Suiza", country: Seleccion.Country.Suiza, players : ["Neymar","Rodrygo", "Faustinho"])

var camerun = Seleccion(name: "Camerún", country: Seleccion.Country.Camerun, players : ["Neymar","Rodrygo", "Faustinho"])

// MARK - GRUPOS  -->  H


var portugal = Seleccion(name: "Portugal", country: Seleccion.Country.Portugal, players : ["Neymar","Rodrygo", "Faustinho"])

var ghana = Seleccion(name: "Ghana", country: Seleccion.Country.Ghana, players : ["Neymar","Rodrygo", "Faustinho"])

var uruguay = Seleccion(name: "Uruguay", country: Seleccion.Country.Uruguay, players : ["Neymar","Rodrygo", "Faustinho"])

var corea = Seleccion(name: "Corea", country: Seleccion.Country.Corea, players : ["Neymar","Rodrygo", "Faustinho"])

// MARK - MUNDIAL  -->

var equipos = Mundial(seleccion: [argentina, brazil, holanda, espanya, francia, japon, catar, arabia, alemania, australia, belgica, corea, canada, camerun, croacia, costa_rica, dinamarca, ecuador, gales, ghana, iran, inglaterra, mexico, marruecos, polonia, portugal, suiza, serbia, senegal, usa, uruguay, tunez])


print(equipos.seleccion.count)

equipos.makeTeams

equipos.grupo[0].makeMatch();

print(equipos.seleccion[0].victory)
print(equipos.seleccion[1].victory)

print("Cantidad de Grupos de 4 participantes en la copa: \(equipos.grupo.count)")
//equipos.makeTeams.self


//juegos.resultados.append(juegos.match)


//print(equipos.toString)


//print(juegos.toString)


//juegos.resultados.forEach{ print($0)}


equipos.grupo.forEach{ print(" aca \($0.toString)")}


