import Foundation

// Funktionen als Daten

func format(value: Int) -> String {
    return "\(value) EUR"
}


let operation = format
operation(10)


func processNumber(value : Int, operation: (Int) -> String) -> String {
    return operation(value)
}

processNumber(value: 10, operation: format)


// Closures

let operation1 = { (value : Int) -> String in
    return "\(value) EUR"
}
operation1(10)


let currency = "EUR"
let operation2 = { (value : Int) -> String in
    return "\(value) \(currency)"
}
operation2(10)



// Kurzschreibweise für Swift-Blöcke

let numbers = [5, 10, 20, 100, 1]

// Funktionen können referenziert und übergeben werden, z.B. als Parameter
// Array#map ruft eine Funktion für jedes Element eines Arrays auf und liefert
// ein neues Array mit den Rückgabewerten der Funktion:

numbers.map(format)

// Block-Syntax: Implizite Funktionsdeklaration

numbers.map({(element : Int) -> String in return "\(element) EUR"})

// "return" kann entfallen wenn Code ein einzelner Ausdruck ist

numbers.map({(element : Int) -> String in "\(element) EUR"})

// Typ der Parameter / Rückgabewerte werden vom Compiler ermittelt

numbers.map({(element) in "\(element) EUR"})

// Wenn der letzte Parameter einer Funktion ein Block ist,
// kann der Block hinter den Funktionsaufruf / ohne () geschrieben werden:

numbers.map() { element in "\(element) EUR"}
numbers.map{ element in "\(element) EUR"}

// Parameter können alternativ über $0, $1, $2 usw. referenziert werden
numbers.map { "\($0) EUR" }






// Listenoperationen

// -- Filtern

numbers.filter { element in element > 10 }

// -- Map / Transformation

numbers.map { element in "\(element) EUR" }

// -- Sortierreihenfolge

struct Person {
    var name: String
}

let persons = [Person(name: "Bob"), Person(name: "Carol"), Person(name: "Alice")]

persons.sorted { $0.name < $1.name }

// -- Summen

struct Position {
    var name: String
    var price: Decimal
}

let positions = [Position(name: "Pen", price: 1.20), Position(name: "Paper", price: 2.50)]

let total = positions.reduce(0) { sum, element in sum + element.price } // Ergebnis: 3.70

[10, 20, 30].reduce(0, +)      // Ergebnis: 60
