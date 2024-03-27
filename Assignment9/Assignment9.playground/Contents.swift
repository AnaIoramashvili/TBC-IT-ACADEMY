import UIKit

//1. შექმენით ენამი Gender სადაც იქნება 2 გენდერი (გენდერზე არ გამომეკიდოთ, თუ გინდათ მეტი ჩაამატეთ)

enum Gender {
    case Female
    case Male
}

//2. შექმენით Protocol სახელად SuperBeing. გაუწერეთ მას ფროფერთები - name: String, strength: Int, speed: Int, weakness: String, gender: Gender

protocol SuperBeing {
    var name: String { get }
    var strenght: Int { get }
    var speed: Int { get }
    var weakness: String { get }
    var gender: Gender { get }
}

//3. SuperBeing-ის strength-სა და speed-ს მიეცით default მნიშვნელობა

extension SuperBeing {
    var strenght: Int {
        return 10
    }
    var speed: Int {
        return 120
    }
}

//4. შექმენით კლასები Superhero და SuperVillain, დაუქონფორმეთ SuperBeing-ს.

class SuperHero: SuperBeing {
    var name: String
    var weakness: String
    var gender: Gender
    var strenght: Int
    var speed: Int
    
    required init(name: String, weakness: String, gender: Gender, strenght: Int, speed: Int) {
        self.name = name
        self.weakness = weakness
        self.gender = gender
        self.strenght = strenght
        self.speed = speed
    }
}

class SuperVillain: SuperBeing {
    var name: String
    var weakness: String
    var gender: Gender
    var strenght: Int
    var speed: Int
    
    required init(name: String, weakness: String, gender: Gender, strenght: Int, speed: Int) {
        self.name = name
        self.weakness = weakness
        self.gender = gender
        self.strenght = strenght
        self.speed = speed
    }
}

//5. გაუწერეთ Superhero კლასს დამატებითი პარამეტრები outfitColor: String, equipment: String, vehicle: String

extension SuperHero {
    var outfitColor: String {
        return gender == .Female ? "Pink" : "Black"
    }
    var equipment: String {
        return gender == .Female ? "Light" : "Heavy"
    }
    var vehicle: String {
        return gender == .Female ? "G Wagon" : "Porsche"
    }
}

//6. გაუწერეთ Superhero კლასს მეთოდი - rescue, რომელიც პარამეტრად მიიღებს დაზარალებულის სახელს და დაბეჭდავს -
//“‘სუპერგმირის სახელი’ არ შეუშინდა სახიფათო სიტუაციას და ‘დაზარალებულის სახელი’ გადაარჩინა სიკვდილს” (მაგ: “ბეტმენი” არ შეუშინდა სახიფათო სიტუაციას და “გელა” გადაარჩინა სიკვდილს).

extension SuperHero {
    func rescue(victimName: String) {
        print("\(name) არ შეუშინდა სახიფათო სიტუაციას და \(victimName) გადაარჩინა სიკვდილს")
    }
}

let batman = SuperHero(name: "Batman", weakness: "Betman", gender: .Male, strenght: 100, speed: 300)
batman.rescue(victimName: "Gela")

//7. გაუწერეთ Superhero კლასს მეთოდი - combat, რომელიც პარამეტრად მიიღებს Supervillain-ს და დაბეჭდავს -
//“‘სუპერგმირის სახელი’ შეერკინა და დაამარცხა ‘ბოროტმოქმედის სახელი’” (მაგ: “ბეტმენი” შეერკინა და დაამარცხა “ჯოკერი”)

extension SuperHero {
    func combat(Supervillain: SuperVillain) {
        print("\(self.name) შეერკინა და დაამარცხა \(Supervillain.name)")
    }
}

let spiderMan = SuperHero(name: "Spiderman", weakness: "Spiderman", gender: .Male, strenght: 150, speed: 300)

let goblin = SuperVillain(name: "Goblin", weakness: "Spiderman", gender: .Female, strenght: 400, speed: 40)

spiderMan.combat(Supervillain: goblin)

//8. გაუწერეთ SuperVillain კლასს დამატებითი პარამეტრები evilScheme: String, obsession: String, rivalry: String

extension SuperVillain {
    var evilScheme: String {
        return "სამყაროს განადგურება"
    }
    var obsession: String {
        return "მასობრივი მკვლელობა"
    }
    var rivalry: String {
        return "სიკეთე"
    }
    
}

//9. გაუწერეთ SuperVillain კლასს მეთოდი - attack - რომელიც პარამეტრად მიიღებს Superhero-ს და დაბეჭდავს -
//“ბოროტმ. სახელი” გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა “სუპერგმირის სახელი” მის შეჩერებას თუ შეძლებს” (მაგ: “ჯოკერი” გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა “ბეტმენი” მის შეჩერებას თუ შეძლებს)

extension SuperVillain {
    func attack(Superhero: SuperHero) {
        print("\(self.name) გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა \(Superhero.name) მის შეჩერებას თუ შეძლებს")
    }
}

let Hulk = SuperHero(name: "Hulk", weakness: "No one", gender: .Female, strenght: 600, speed: 300)
let magneto = SuperVillain(name: "Magneto", weakness: "Magneto", gender: .Male, strenght: 400, speed: 120)
magneto.attack(Superhero: Hulk)

//10. გაუწერეთ SuperVillain კლასს მეთოდი experimentation - რომელიც პარამეტრად მიიღებს სტრინგს (subject) და დაბეჭდავს -
//“‘ბოროტმოქმედის სახელი’ ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად ‘მსხვერპლის სახელი’ აღმოჩნდა” (მაგ: “ჯოკერი” ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად “გელა” აღმოჩნდა)

extension SuperVillain {
    func experimentation(subject: String) {
        print("\(name) ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად \(subject) აღმოჩნდა")
    }
}

let bane = SuperVillain(name: "Bane", weakness: "Water", gender: .Male, strenght: 500, speed: 90)

bane.experimentation(subject: "Givi")

//11. შექმენით მინიმუმ 5-5 ობიექტი თითოეული SuperBeing-ის დაქონფირმებული კლასებიდან
// Superheros

let antMan = SuperHero(name: "antMan", weakness: "Big people", gender: .Male, strenght: 10, speed: 5)
let thor = SuperHero(name: "Thor", weakness: "Black Magic", gender: .Female, strenght: 500, speed: 300)
let aquaMan = SuperHero(name: "Aqua Man", weakness: "Crabs", gender: .Male, strenght: 900, speed: 430)
let flash = SuperHero(name: "Flash", weakness: "The reverse flash", gender: .Female, strenght: 1000, speed: 12000)
let greenArrow = SuperHero(name: "Green Arrow", weakness: "Blade", gender: .Male, strenght: 30, speed: 65)

//SupperVillains
let thanos = SuperVillain(name: "Thanos", weakness: "Empathy", gender: .Male, strenght: 1000, speed: 500)
let joker = SuperVillain(name: "Joker", weakness: "Batman", gender: .Male, strenght: 50, speed: 80)
let loki = SuperVillain(name: "Loki", weakness: "Honor", gender: .Male, strenght: 200, speed: 300)
let sharleto = SuperVillain(name: "Sharleto", weakness: "Wooden objects", gender: .Male, strenght: 800, speed: 150)
let catwoman = SuperVillain(name: "Catwoman", weakness: "Compassion", gender: .Female, strenght: 70, speed: 120)



//Optional:
//წარმოიდგინეთ სცენა სადაც ორი სუპერგმირი - დრეიკი და ლექს-სენი ერთმანეთს ეჯიბრებიან თუ რომელი უფრო სწრაფია. დრეიკი ამბობს რომ ის ყველაზე სწრაფია მსოფლიოში და რიანაც უდასტურებს.
//
//-“ლექს-სენს არცერთი შეჯიბრი არ წაუგია ისტორიაში” აცხადებს მისი კოლაბორატორი თაკო და დასძენს, რომ დრეიკი შიშისაგან უნდა კანკალებდეს, რადგან არც კი იცის რა ელოდება. ამ სუპერგმირების ბედი თქვენზეა დამოკიდებული, თქვენ უნდა გადაწყვიტოთ ვინ არის მსოფლიოში ყველაზე სწრაფი და ვინ შეძლებს ბილბორდის ტოპ ჩარტების განადგურებას.
//
//
//
//დაწერეთ ჯენერიკ ფუნქცია compareSwiftness რომელიც იღებს მხოლოდ ორ პარამეტრს პირველ და მეორე სუპერგმირებს რომლებიც დაქვემდებარებულები იქნებიან SuperBeing პროტოკოლზე, ფუნქცია უნდა აბრუნებდეს სტრინგს
//ფუნქციის ბადიში შეამოწმეთ speed მნიშვნელობები ორივე სუპერგმირის
//დააბრუნეთ სტრინგი აღწერით თუ რომელი სუპერგმირია უფრო სწრაფი (გაითვალისწინეთ ისიც თუ სიჩქარეები ერთმანეთის ტოლია)

func compareSwiftness<SuperHero: SuperBeing>(first: SuperHero, second: SuperHero) -> String {
    if first.speed > second.speed {
        return "\(first.name) უფრო სწრაფია ვიდრე \(second.name)"
    } else if first.speed < second.speed {
        return "\(second.name) უფრო სწრაფია ვიდრე \(first.name)"
    } else {
        return "\(first.name) და \(second.name) სიჩქარეები ტოლია"
    }
}


let drake = SuperHero(name: "Drake", weakness: "ლექს-სენი", gender: .Male, strenght: 100, speed: 30)
let lex = SuperHero(name: "ლექს-სენი", weakness: "Drake", gender: .Male, strenght: 400, speed: 50)

let result  = compareSwiftness(first: drake, second: lex)
print(result)
