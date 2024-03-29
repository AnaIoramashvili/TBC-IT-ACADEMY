import UIKit

//შექმენით ციკლური რეფერენცები და გაწყვიტეთ
//აუცილებელია ქლოჟერების გამოყენება
//აუცილებელია value და რეფერენს ტიების გამოყენება (კლასები, სტრუქტურები, ენამები და პროტოკოლები)
//აუცილებელია გამოიყენოთ strong, weak & unowned რეფერენსები ერთხელ მაინც
//დაიჭირეთ self ქლოჟერებში
//გატესტეთ მიღებული შედეგები ინსტანსების შექმნით და დაპრინტვით


//შექმენით ციკლური რეფერენცები და გაწყვიტეთ, მაგალითები:

class Customer {
    let name: String
    var creditCard: CreditCard? // Strong Reference (var-ი არის გამოყენებული)

    init(name: String) {
        self.name = name
        print("\(name) ინიციალიზებულია")
    }

    deinit {
        print("\(name) დეინიციალიზებულია")
    }
}

class CreditCard {
    let cardNumber: Int
    weak var owner: Customer? // Weak Reference

    init(cardNumber: Int) {
        self.cardNumber = cardNumber
        print("საკრედიტო ბარათი ნომრით \(cardNumber) ინიციალიზებულია")
    }

    deinit {
        print("საკრედიტო ბარათი ნომრით \(cardNumber) დეინიციალიზებულია")
    }
}

var eka: Customer?
var card: CreditCard?

eka = Customer(name: "Eka")
card = CreditCard(cardNumber: 123123123)

eka?.creditCard = card
card?.owner = eka

// reference count-მა 1 დან დაიწია 0-ზე, შესაბამისად მოხდა მათი დეალოკაცია
eka = nil
card = nil


//Weak რეფერენცია
class Person {
    var name: String
    var phone: Phone?
    
    init(name: String) {
        self.name = name
        print("\(name) ინიციალიზებულია")
    }
    
    deinit {
        print("\(name) დეინიციალიზებულია")
    }
}


class Phone {
    let name: String
    weak var owner: Person?
    
    init(name: String) {
        self.name = name
        print("\(name) ინიციალიზებულია")
    }
    
    deinit {
        print("\(name) დეინიციალიზებულია")
    }
}


var iPhone: Phone?
var ana: Person?

iPhone = Phone(name: "iPhone")
ana = Person(name: "Ana")

iPhone?.owner = ana
ana?.name = "Anastasia"

iPhone = nil
ana = nil


//unowned რეფერენცია
class Parent {
    let name: String
    var child: Child?
    
    init(name: String) {
        self.name = name
        print("\(name) ინიციალიზებულია")
    }
    
    deinit {
        print("\(name) დეინიციალიზებულია")
    }
}

class Child {
    let eyeColor: String
    unowned let parent: Parent
    
    init(eyeColor: String, parent: Parent) {
        self.eyeColor = eyeColor
        self.parent = parent
        print(("შვილი \(eyeColor) ინიციალიზებულია"))
    }
    
    deinit {
        print("შვილი \(eyeColor) დეინიციალიზებულია")

    }
}


var parent: Parent?
var child: Child?

parent = Parent(name: "Giorgi")
child = Child(eyeColor: "Green", parent: parent!)

parent = nil
child = nil


// ქლოჟერების გამოყენება(weak მაგალითი)
class Player {
    var playerName: String
    var skill: (() -> Void)?
    
    init(playerName: String) {
        self.playerName = playerName
    }
    
    deinit {
        print("მოთამაშე \(playerName)-მ(ა) დატოვა თამაში")
    }
}

var player: Player?

player = Player(playerName: "Kvara")
player?.skill = { [weak player] in
    print("\(player?.playerName ?? "Messi") კარგად თამაშობს ფეხბურთს")
}

player = nil


//strong რეფერენიის გამოყენება და protocol-ის ჩართვა
protocol Vehicle {
    var brand: String { get }
    func start()
}

class Car: Vehicle {
    let brand: String
    
    init(brand: String) {
        self.brand = brand
    }
    
    func start() {
        print("\(brand)-მა დაიწყო მოძრაობა")
    }
}

class Human {
    let name: String
    var vehicle: Vehicle?
    
    init(name: String) {
        self.name = name
    }
    
    func drive() {
        if let vehicle = vehicle {
            print("\(name) ატარებს \(vehicle.brand)")
            vehicle.start()
        } else {
            print("\(name) არ ყავს მანქანა")
        }
    }
}

let myCar = Car(brand: "Mercedes")
let me = Human(name: "ანა")

//სტრონგ რეფერენსი შექმნა
me.vehicle = myCar

me.drive()


//self-ის დაჭერა ქლოუჟერებში
class MyClass {
    var closure: (() -> Void)?
    
    func setupClosure() {
        closure = { [weak self] in
            self?.doSomething()
        }
    }
    
    func doSomething() {
        print("Hello World")
    }
    
    deinit {
        print("დეინიციალიზაცია")
    }
}

var object: MyClass? = MyClass()
object?.setupClosure()
object = nil


//
class Wizard {
    let name: String
    var spellBook: () -> Void // ქლოჟერი

    init(name: String, spell: @escaping () -> Void) {
        self.name = name
        self.spellBook = spell
        print("\(name) Wizzard მზადაა მოქმედებისთვის!!")
    }

    deinit {
        print("\(name) Wizzard დაამარცხეს...")
    }
}

let fireSpell: () -> Void = {
    
    print("ცეცხლის ბურთების გამანადგურებელი წვიმა!!!!🔥")
}

var nino: Wizard? = Wizard(name: "NINO", spell: fireSpell)

nino?.spellBook()

nino = nil
fireSpell()
