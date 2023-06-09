import UIKit

//Clousers

var add = { (a: Int, b: Int) in
    return a*b
}

print(add(2,3))

var multipli: (String,Int) -> (String) = { (d:String, age: Int) in
    return "Hello" + d + " With age " + "\(age)" + " Years"
}
print(multipli(" Jagan", 26))

var onlyParm = { (name: String) in
    print(name + "\(add(2,3))")
}

onlyParm("jagan")

var onlyreturn = {
    return add(7,5)
}

print(onlyreturn)

var names = [1,2,3,4]
var sort = names.sorted { first, second in
    return first > second
}
var filter = names.filter { value in
    return value != 4
}
let map  = names.map { int in
    return int * 5
}

let flatMap = names.compactMap { int in
    int * 9
}
print(map)
print(flatMap)

func sum(a: Int,b:Int,clouser: ((Int) -> Int)) -> Int {
    var sun = 0
    for i in a...b  {
        sun += clouser(i)
    }
    return sun
}

let value = sum(a: 1, b: 4) { value in
    let final = value * 2
    print("-->\(final)")

    return final
}

print(value)

//Enums
enum Heros {
    case Hanuman
    case Shiva
    case Krishna
    
}
enum HeroNames: String {
    case Hanuman = "Anjaneya"
    case Shiva = "Mahakal"
    case Krishna = "Gopala"
    
    func type () -> String {
        return self.rawValue
    }
}

let hero = Heros.Krishna

switch hero {
case .Krishna:
    print("Loard Krishna")
case .Shiva:
    print("Mahakal")
default: break
}

enum SpritualHeros {
    case name(String)
    case age(Int)
    case powers([String:Any])
    case history([[String:Any]])
}

let spritual = SpritualHeros.history([["Height":"Infinite"]])

enum Result {
    case sucess([String:Any])
    case error(Error)
}

func passResult(_ clouser: @escaping ((Result) -> (Void))) {
    clouser(Result.sucess(["status":"sucess"]))
}
passResult { result in
    switch result {
    case .sucess(let value):
        print(value)
    case .error(let error):
        print(error.localizedDescription)
    }
}

func superNaturanHeros(hero:Heros, _ clouser: @escaping((SpritualHeros) -> (Void))) {
    switch hero {
    case .Krishna:
        clouser(SpritualHeros.name("Loard Krishna"))
        case .Hanuman:
        clouser(SpritualHeros.age(12))
    default:
        clouser(SpritualHeros.powers(["":""]))
    }
}

superNaturanHeros(hero: .Shiva) { spritual in
    print(spritual)
}

//Property Observers
struct MyStruct {
    var name: String = ""
    var age: Int = 0
    lazy var person: String = {
        return name
    }()
    var des: String {
        return "des" + name
    }
    
    var mask: String {
        get {
            return des
        } set(newValue) {
            print(newValue)
            name = name + newValue
        }
    }
    
    var value: Int = 0 {
        willSet(newValue) {
            print("newValue: -->\(newValue)")
        }
        didSet {
            if value < age {
                print("value:-->\(value)")
            }
        }
    }
    
    init(name: String, age:Int) {
        self.name = name
        self.age = age
    }
    
   mutating func addAge(num: Int) {
       self.age  += num
    }
}


var str = MyStruct(name: "Jagan", age: 23)
str.addAge(num: 23)
str.value = 34
print(str.value)

