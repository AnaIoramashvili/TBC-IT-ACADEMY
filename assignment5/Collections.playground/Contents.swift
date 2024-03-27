import UIKit
import Foundation

//1. დაწერეთ ფუნქცია რომელიც პარამეტრად მიიღებს String-ს და დააბრუნებს ბულიანს. ფუნქციამ უნდა შეამოწმოს მიღებული სტრინგი სარკისებურია თუ არა (სიტყვა ან წინადადება რომელიც იკითხება ერთნაირად როგორც თავიდან, ისე ბოლოდან მაგ: “ანა”, “აირევი ივერია”, “მადამ”)
func mirrorWord(_ word: String) -> Bool {
    let reversedString = String(word.reversed())
    return word == reversedString
}

let word1 = "ანა"
let word2 = "გამარჯობა"

print(mirrorWord(word1))
print(mirrorWord(word2))


//2. დაწერეთ ფუნქცია რომელიც გადაცემულ რიცხვების array-ს ააკვარდატებს, დაპრინტავს და დააბრუნებს მნიშვნელობას.
func numbersSquared(numbers: [Int]) -> [Int] {
    var squaredNumbers: [Int] = []
    
    for number in numbers {
        let newValue =  number * number
        squaredNumbers.append(newValue)
     }
    return squaredNumbers
}

let numbers = [1, 3, 5, 9, 2]
print(numbersSquared(numbers: numbers))

//3. დაწერეთ Closure რომელიც გაფილტრავს ლუწ რიცხვებს Int-ების Array-დან.
let numberss = [2, 5, 6, 8, 10, 12, 13, 14, 16, 20]

let evenNumbers = numberss.filter { $0 % 2 == 0 }

print(evenNumbers)


//4. დაწერეთ ფუნქცია, რომელიც პარამეტრად იღებს Int-ების მასივს. Escaping closure-ის მეშვეობით დაბეჭდეთ მიწოდებული მასივის ჯამი 5 წამის შემდეგ. დარწმუნდით რომ closure არის escaping და გამოიძახეთ ის მას შემდეგ რაც ფუნქცია დაბრუნდება.
func printAfterFiveSec(_ numbers: [Int], completion: @escaping (Int) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        var sum = 0
        for num in numbers {
            sum += num
        }
        completion(sum)
    }
}

let myNumbers = [2, 5, 7, 9, 1, 3]

printAfterFiveSec(myNumbers) { sum in
    print(sum)
}


//5. შექმენით  კონტაქტების Dict სადაც key არის სახელი და value ტელეფონის ნომერი, დაამატეთ, დაბეჭდეთ/მოძებნეთ და წაშალეთ კონტაქტი
var myContacts = ["Ana": "593119678",
                  "Giorgi": "591222448",
                  "Mari": "593872513",
                  "Eka": "598231093"]

print(myContacts)
myContacts.updateValue("593119678", forKey: "Nika")
print(myContacts)
myContacts.removeValue(forKey: "Nika")
print(myContacts)


//6. დაწერეთ ფუნქცია რომელიც პარამეტრად იღებს [String: Int] ტიპის Dictionary-ს და დააბრუნებს ანბანურად დალაგებულ dictionary-ს key ელემენტების მასივს.
func arrangedDic(from dictionary: [String: Int]) -> [String] {
    let keys = dictionary.keys.sorted()
    return keys
}

let myDict = ["A": 1,
              "B": 2,
              "Z": 2,
              "G": 8]
print(arrangedDic(from: myDict))


//7. შექმენით Double-ების მასივი, შეავსეთ ის თქვენთვის სასურველი რიცხვებით.  loop-ის გამოყენებით იპოვეთ ყველაზე დიდი რიცხვი ამ მასივში და დაბეჭდეთ.
var myArray: [Double] = [1.2, 9.1, 2.3 , 4.6, 3.8]

var largestNumber = myArray[0]

for number in myArray {
    if number > largestNumber {
        largestNumber = number
    }
}

print(largestNumber)


//Optional
//მოცემულია Dictionary სადაც წარმოდგენილია ლელა წურწუმიას სიმღერებისა და მათი ხანგრძლივობა(წმ) მონაცემები:

let lelaWhatMovementIsThis: [String: Int] = [

    "ღამის “სიჩუმე გაფანტე": 235,

    "ვიხსენებ ყველაფერს თავიდან": 219,

    "სულელი წვიმა": 231,

    "ალალ მე": 231,

    "იდუმალი ღამე": 221,

    "ჩუმად ნათქვამი": 199,

    "თეთრი ქარავანი": 221,

    "ძველი ვერხვები": 193

]

//1. დაწერეთ ფუნქცია რომელიც გამოითვლის და დაბეჭდავს სიღერების ჯამურ ხანგრძლივობას წუთებში და წამებში
//2. დაწერეთ ფუნქცია რომელიც იპოვის და დაბეჭდავს ყველაზე ხანგრძლივი და ხანმოკლე სიმღერის სახელს.
//3. დაწერეთ ფუნქცია რომელიც გამოითვლის სიმღერების საშუალო ხანგრძლივობას
//4. დაწერეთ ფუნქცია რომელიც შემთხვევითად ამოარჩევს სიმღერას და დაბეჭდავს მის სახელს


//1.
func sumDictionaryValues(_ dictionary: [String: Int]) -> Int {
    var sum = 0
    for value in dictionary.values {
        sum += value
    }
    return sum
}

let sum = sumDictionaryValues(lelaWhatMovementIsThis)
print(sum)
print("სიმღერის ჯამური ხანგრძლივობაა წუთებში \(sum / 60), ხოლო წამებში \(sum % 60)")

//2.
func getMaxMinSongName(_ dictionary: [String: Int]) -> String {
    var minSong = Array(dictionary.values)[0]
    var maxSong = Array(dictionary.values)[0]
    
    var minSongName = ""
    var maxSongName = ""
    
    for (key, value) in dictionary {
        if value > maxSong {
            maxSong = value
            maxSongName = key
        }
        if value < minSong {
            minSong = value
            minSongName = key
        }
    }
    return "ყველაზე ხანგრძლივი მუსიკა: \(maxSongName), ყველაზე ხანმოკლე სიმღერაა: \(minSongName)"
}


let result = getMaxMinSongName(lelaWhatMovementIsThis)
print(result)


//3.
func getAvgOfDict(_ dictionary: [String: Int]) -> Double {
    var dictValues = Array(dictionary.values)
    
    var sum = 0
    var count = dictValues.count
    
    for num in dictValues {
        sum += num
    }
    
    return Double(sum) / Double(count)
}


print(getAvgOfDict(lelaWhatMovementIsThis))


//4.
func getRandomSong(_ dictionary: [String: Int]) -> String? {
    let dicSongs = Array(dictionary.keys)
        guard let randomSong = dicSongs.randomElement() else {
        return "როგორც ჩანს ლელას არავინ უსმენს"
    }
    
    return randomSong
}

print(getRandomSong(lelaWhatMovementIsThis)!)
