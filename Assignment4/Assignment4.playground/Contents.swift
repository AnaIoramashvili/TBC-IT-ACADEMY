import UIKit

//1. while ციკლის გამოყენებით, 1-დან 20-მდე დაბეჭდეთ ყველა კენტი რიცხვის ნამრავლი.
var number = 1
var multiply = 1

while number <= 20 {
    if number % 2 != 0 {
        multiply *= number
    }
    number += 1
}

print(multiply)


//2. შექმენით String ტიპის ცვლადი და ციკლის გამოყენებით შემოაბრუნეთ ის, მაგ: თუ გვაქვს “Test” უნდა მივიღოთ “tseT”
var word = "Banana"
var reverseStr = ""

for character in word {
    reverseStr = String(character) + reverseStr
}

print(reverseStr)


//3. while loop-ისა და switch statement-ის გამოყენებით შექმენით უსასრულო შუქნიშანი, რომელიც ბეჭდავს შემდეგნაირად. "🔴->🌕->🟢->🔴->🌕..."
var currentTrafficLight = "🔴"
var count = 1

while count <= 20 { // while true არ დავწერე რომ არ გაქრაშულიყო
    switch currentTrafficLight {
    case "🔴":
        print("🔴")
        currentTrafficLight = "🌕"
    case "🌕":
        print("🌕")
        currentTrafficLight = "🟢"
    case "🟢":
        print("🟢")
        currentTrafficLight = "🔴"
    default:
        break
    }
    count += 1
}


//4. Taylor Swift-ის კონცერტის ბილეთები იყიდება, თუმცა რაოდენობა ძალიან შეზღუდულია. While loop-ის მეშვეობით შექმენით ბილეთების გაყიდვის სიმულაცია და ყოველ გაყიდულ ბილეთზე დაბეჭდეთ “ბილეთი გაყიდულია, დარჩენილია მხოლოდ X რაოდენობა”, მანამ სანამ ბილეთების რაოდენობა მიაღწევს 0-ს, რის შემდეგაც ბეჭდავთ - “ყველა ბილეთი გაყიდულია გელოდებით კონცერტზე”
var tickets = 20
var ticketsCount = 1

while ticketsCount <= tickets {
    print("ბილეთი გაყიდულია, დარჩენილია მხოლოდ \(tickets) რაოდენობა")
    tickets -= 1
    if tickets == 0 {
        print("ყველა ბილეთი გაყიდულია გელოდებით კონცერტზე")
    }
}


//5. შექმენით array, შეავსეთ ისინი ელემენტებით. შეამოწმეთ და დაბეჭდეთ: "array-ში ყველა ელემენტი განსხვავებულია" ან "array შეიცავს მსგავს ელემენტებს"  (array-ს ტიპს არაქვს მნიშვნელობა.)
var numbers = [1, 2, 1, 10, 20, 20, 32, 3, 6, 7]

func containsDuplicate(_ nums: [Int]) -> String {
    var seen = Set<Int>()
    for num in nums {
        if seen.contains(num) {
            return "array შეიცავს მსგავს ელემენტებს"
        } else {
            seen.insert(num)
        }
    }
    return "array-ში ყველა ელემენტი განსხვავებულია"
}

print(containsDuplicate(numbers))


//6. დაწერეთ ქლოჟერი რომელიც გამოითვლის ორი რიცხვის სხვაობას და დააბრუნებს მიღებულ მნიშვნელობას
let subtractTwoNumbers = { (num1: Int, num2: Int) -> Int in
    return num1 - num2
}

let result = subtractTwoNumbers(10, 3)
print(result)


//7. დაწერეთ ფუნქცია, რომელსაც გადააწვდით String ტიპის პარამეტრს. დაითვალეთ ამ პარამეტრში თანხმოვნების რაოდენობა და დაბეჭდეთ ის.
var word1 = "თიბისი"

func countConsonant(word: String) -> Int {
    var vowels: [Character] = ["ა", "ე", "ი", "ო", "უ"]
    var count = 0
    for char in word {
        if !vowels.contains(char) {
            count += 1
        }
    }
    return count
}

print(countConsonant(word: word1))

