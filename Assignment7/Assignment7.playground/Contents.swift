import UIKit

//1. შექმენით Enum-ი სახელით WeekDay შესაბამისი ქეისებით. დაწერეთ ფუნქცია რომელიც იღებს ამ ენამის ტიპს და ბეჭდავს გადაწოდებული დღე სამუშაოა თუ დასვენების.

enum WeekDay {
    case monday
    case tuesday
    case wednsday
    case thursday
    case friday
    case saturday
    case sunday
}

func weekDays(day: WeekDay) {
    switch day {
    case .saturday, .sunday:
        print("Today is a weeknd")
    default:
        print("Today is a workday")
    }
}

weekDays(day: .tuesday)


//2. შექმენით Enum-ი სახელად GialaSquad, რომელიც აღწერს გია სურამელაშვილის ფანკლუბის წევრების დონეებს ქეისებით : “TsigroviManto”, “MoshishvlebuliMkerdi”, “TuGapatio”. შექმენით ფროფერთი GialaSquad-ში, რომელსაც ექნება ინფორმაცია თუ რა ღირს თითოეული დონე თვეში (დონეები დალაგებულია ძვირიდან იაფისაკენ). დაუმატეთ მეთოდი რომელიც დაბეჭდავს თითოეული დონის ფასს

enum GialaSquad {
    case TsigroviManto
    case MoshishvlebuliMkerdi
    case TuGapatio
    
    var price: Double {
        switch self {
        case .TsigroviManto:
            return 25.5
        case .MoshishvlebuliMkerdi:
            return 50.9
        case .TuGapatio:
            return 100.1
        }
    }
    func getPrice() {
        print("\(self) ჯდება \(self.price) ლარი თვეში")
    }
    
}

let level = GialaSquad.TsigroviManto
level.getPrice()


//3. შექმენით enum-ი Weather შემდეგი ქეისებით, Sunny, Cloudy, Rainy და Snowy. ამ ქეისებს უნდა ჰქონდეს associated value Celsius-ის სახით. დაწერეთ function რომელიც მიიღებს ამ enum-ს, და მოგვცემს რეკომენდაციას რა უნდა ჩავიცვათ შესაბამისი ამინდის მიხედვით

enum Weather {
    case Snowy(Celsius: Double)
    case Rainy(Celsius: Double)
    case Cloudy(Celsius: Double)
    case Sunny(Celsius: Double)
}

func recommendClothing(for weather: Weather) -> String {
    switch weather {
    case .Snowy(let temperature) where temperature <= 10:
        return "თბილად ჩაიცვი, ყინავს!!!"
    case .Rainy(let temperature) where temperature > 10 && temperature <= 15:
        return "საწვიმარი დაგჭირდება და ქოლგა!!!"
    case .Cloudy(let temperature) where temperature > 15 && temperature <= 20:
        return "შარფი დაგჭირდება!!!"
    case .Sunny(let temperature) where temperature > 20 && temperature <= 25:
        return "ცხელა, იწვის ყველაფერი, თხლად ჩაიცვი!!!"
    default:
        return "ჯოჯოხეთია გარეთ!!! არ გაისვლება!!!"
    }
}

let snowyWeather = Weather.Snowy(Celsius: 10)
print(recommendClothing(for: snowyWeather))


//4. შექმენით struct-ი Kanye, ფროფერთებით: album, releaseYear. ამის შემდეგ შექმენით array-ი Kanye-ს ტიპის, ჩაამატეთ რამოდენიმე Kanye-ს ობიექტი, და შეავსეთ მასივი კანიეებით. დაწერეთ ფუნქცია, რომელიც მიიღებს ამ კანიეების მასივს და წელს. ფუნქციამ უნდა დაგვიბრუნოს ყველა ალბომი რომელიც გამოშვებულია გადაწოდებული წლის შემდეგ და დაბეჭდოს ისინი.

struct Kanye {
    var album: String
    var releaseYear: Int
}


var ye1 = Kanye(album: "album1", releaseYear: 2002)
var ye2 = Kanye(album: "album2", releaseYear: 2003)
var ye3 = Kanye(album: "album3", releaseYear: 2004)

var kanyeArray: [Kanye] = [ye1, ye2, ye3]

func getAllYeAlbums (for kanyeArray: [Kanye], year: Int) -> [String] {
    var albums: [String] = []
    for ye in kanyeArray {
        if ye.releaseYear > year {
            albums.append(ye.album)
        }
    }
    return albums
    
}

print(getAllYeAlbums(for: kanyeArray, year: 2003))


//5. შექმენით String-ის ტიპის lazy property wrapper სახელად, cachedData. ინიციალიზება გაუკეთეთ ქლოჟერით რომელიც აბრუნებს სტრინგს მნიშვნელობით “lazy ინიციალიზებულია”. მიწვდით ამ ფროფერთის და დაბეჭდეთ მისი მნიშვნელობა

@propertyWrapper
struct CachedData {
    private lazy var value: String = self.lazyInitializer()

    private let lazyInitializer: () -> String

    init(wrappedValue initialValue: @escaping @autoclosure () -> String) {
        self.lazyInitializer = initialValue
    }

    var wrappedValue: String {
        mutating get {
            return value
        }
    }
}

struct thisStruct {
    @CachedData(wrappedValue: {
        return "lazy ინიციალიზდა"
    }())
    var someString: String
}

var result = thisStruct()
print(result.someString)


// P.S optional დავალებასაც გავაკეთებ აუცილებლად <3 

