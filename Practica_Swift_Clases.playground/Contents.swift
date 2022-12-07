import UIKit

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
    
    
    // VARIABLE COMPUTADA PARA GENERAR LA LISTA DE GRUPOS ALEATORIOS
    var makeTeams : Void {
        var group : Group = Group()
        for i in 0 ... 4 {
            group = Group()
            //var names: Set <String> = []
            var names: [Seleccion] = []
            for _ in 0 ... 3 {
                var random = Int.random(in: 0 ... seleccion.count)
                //names.insert(seleccion[random].name)
                names.append(seleccion[random])
                seleccion.remove(at: random)
            }
            
            group = Group(nameGroup: "\(i)", members : names, matchs: [Game(equipoLocal: true, equipoVisitante: false, selecciones: [japon, argentina])])
           
            grupo.append(group)
        }
        grupo.forEach{ print($0.toString)}
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
    var score : Int

    //var partidos : Game  // --> ejercicio 7
    
    init (name : String = "", country : Country, players : [String] = [], victory : Int = 0, score : Int = 0){
        
        self.country = country
        self.players = players
        self.score = score
    }
    
    enum Country {
        case PaisesBajos, Senegal, Ecuador, Brazil, Catar, Inglaterra, EstadosUnidos, Iran, Gales, Argentina, Polonia, Mexico, Arabia, Francia, Australia, Tunez, Dinamarca, Japon, Espana, Alemania, CostaRica, Marruecos, Croacia, Belgica, Canada, Portugal, Ghana, Uruguay, Corea, Camerun, Serbia, Suiza
    }
    
    
    // INTERPOLACIÓN DE STRING PARA RETORNAR TODOS LOS ATRIBUTOS
    public var toString : String { return "\n\nSelección : \(name) \n - País : \(country) \n - Jugadores : \(players)"}
}

/**8.- Generar de forma aleatoria, dentro de la clase Mundial, un listado de grupos con
 un máximo de 4 selecciones por grupo, se puede crear una clase nueva Grupo que
 contenga el nombre del grupo, listado de participantes y listado de partidos. Por
 ejemplo: Grupo A España, Brasil, Francia, Alemania.*/

class Group {
    
    var nameGroup : String
    var members: [Seleccion]
    var matchs : Game
    var puntos : Int
    
//    init(nameGroup : String = "", members: Set <String> = [], matchs : [Game] = []) {
    init(nameGroup : String = "", members: [Seleccion] = []) {
        
        self.nameGroup = nameGroup
        self.members = members
        //self.matchs = matchs
    }
    
    
    
    func makeTheMatch() : Void{
        //matchs = Game()
        
       // matchs.
        
        members[0].get
    }
    
    var toString : String {
        
        return "\n\nGrupo \(nameGroup) \nSelecciones \(members) \nPartidos \(matchs)"
    }
}


/**var checkWinner : Void {
 var selA = grupo[0].members[0]
 var selB = grupo[0].members[1]
 
 game = Game(selecciones: [selA, selB])
 
 
}*/


/**7.- Crear una clase para representar los partidos entre selecciones, deberá contener
 atributos como equipo local, visitante y resultado como mínimo. Generar una lista
 aleatoria de partidos entre la lista de selecciones anteriores y hacer un print de este
 estilo por partido:
 Partido: España 3 - 1 Brasil*/

class Game {
    var equipoLocal : Bool
    var equipoVisitante : Bool
    var grupo : [Group] = []
    //var selecciones : [Seleccion]
    
    init(equipoLocal : Bool = false, equipoVisitante : Bool = true, grupo : [Group] = []){
        self.equipoLocal = equipoLocal
        self.equipoVisitante = equipoVisitante
        self.grupo = grupo

    }

    /*func match() : Void {
        
        var sele1 = grupo[0].
        
        var randomGoals1 : Int = Int.random(in: 0 ... 10)
        var randomGoals2 : Int = Int.random(in: 0 ... 10)

        
        //return "\n\nResultados : \(selecciones[0].country) - \(randomGoals1) - \(selecciones[1].country) \(randomGoals2)"
        print("\n\nResultados : \(selecciones[0].country) - \(randomGoals1) - \(selecciones[1].country) \(randomGoals2)")
        
        return "\(selecciones[0].country)  \(selecciones[1].country)"
    }*/
    
    var toString : String {

        return "\n\nPartido \(selecciones[0].country) - \(selecciones[1].country) \n\nPais : \(selecciones[0].country) \nLocal : \(equipoLocal) \n\nPais : \(selecciones[1].country) \nVisitante \(equipoVisitante) \n\n \(match)"
    }
}
