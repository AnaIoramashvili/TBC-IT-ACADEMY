//
//  StudentData.swift
//  Assignment15
//
//  Created by Ana on 4/12/24.
//

import Foundation
import UIKit

struct StudentData {
    let fullName: String
    let age: Int
    let gender: Gender
    let hobby: String
    let icon: UIImage
}


enum Gender: String {
    case female = "Female"
    case male = "Male"
}


var students = [
    StudentData(fullName: "nodar ghachava", age: 28, gender: .male, hobby: "hiking in the caucasus mountains", icon: UIImage(named: "male1")!),
    StudentData(fullName: "elene donadze", age: 21, gender: .female, hobby: "collecting vintage georgian jewelry", icon: UIImage(named: "female1")!),
    StudentData(fullName: "temuri chitashvili", age: 26, gender: .male, hobby: "developing open source software", icon: UIImage(named: "male2")!),
    StudentData(fullName: "irina datoshvili", age: 24, gender: .female, hobby: "practicing aerial silk dancing", icon: UIImage(named: "female2")!),
    StudentData(fullName: "tornike elyanishvili", age: 27, gender: .male, hobby: "playing classical guitar", icon: UIImage(named: "male3")!),
    StudentData(fullName: "nini bardavelidze", age: 23, gender: .female, hobby: "studying marine biology", icon: UIImage(named: "female2")!),
    StudentData(fullName: "barbare tepnadze", age: 25, gender: .female, hobby: "exploring minimalist baking", icon: UIImage(named: "female4")!),
    StudentData(fullName: "mariam sreseli", age: 20, gender: .female, hobby: "learning new languages", icon: UIImage(named: "female3")!),
    StudentData(fullName: "valeri mekhashishvili", age: 30, gender: .male, hobby: "competitive chess playing", icon: UIImage(named: "male1")!),
    StudentData(fullName: "zuka papuashvili", age: 24, gender: .male, hobby: "restoring classic cars", icon: UIImage(named: "male4")!),
    StudentData(fullName: "nutsa beriashvili", age: 24, gender: .female, hobby: "curating modern art exhibitions", icon: UIImage(named: "female1")!),
    StudentData(fullName: "luka kharatishvili", age: 28, gender: .male, hobby: "documentary filmmaking", icon: UIImage(named: "female2")!),
    StudentData(fullName: "data robakidze", age: 27, gender: .male, hobby: "urban gardening", icon: UIImage(named: "male1")!),
    StudentData(fullName: "nika kakhniashvili", age: 29, gender: .male, hobby: "skydiving", icon: UIImage(named: "male4")!),
    StudentData(fullName: "sandro gelashvili", age: 25, gender: .male, hobby: "digital music production", icon: UIImage(named: "male2")!),
    StudentData(fullName: "ana namgaladze", age: 21, gender: .female, hobby: "photographing street fashion", icon: UIImage(named: "female4")!),
    StudentData(fullName: "bakar kharabadze", age: 30, gender: .male, hobby: "mountain biking", icon: UIImage(named: "male4")!),
    StudentData(fullName: "archil menabde", age: 27, gender: .male, hobby: "crafting handmade pottery", icon: UIImage(named: "male1")!),
    StudentData(fullName: "tamuna kakhidze", age: 22, gender: .female, hobby: "volunteering at animal shelters", icon: UIImage(named: "female2")!),
    StudentData(fullName: "giorgi michitashvili", age: 23, gender: .male, hobby: "bird watching", icon: UIImage(named: "male3")!),
    StudentData(fullName: "salome topuria", age: 23, gender: .female, hobby: "yoga and meditation", icon: UIImage(named: "female1")!),
    StudentData(fullName: "luka gujejiani", age: 29, gender: .male, hobby: "competitive video gaming", icon: UIImage(named: "male2")!),
    StudentData(fullName: "gega tatulishvili", age: 26, gender: .male, hobby: "exploring virtual reality tech", icon: UIImage(named: "male4")!),
    StudentData(fullName: "raisa badalova", age: 24, gender: .female, hobby: "ballet dancing", icon: UIImage(named: "female4")!),
    StudentData(fullName: "aleksandre saroiani", age: 28, gender: .male, hobby: "astronomy and telescope making", icon: UIImage(named: "male1")!),
    StudentData(fullName: "begi kopaliani", age: 29, gender: .male, hobby: "collecting rare vinyl records", icon: UIImage(named: "male3")!),
    StudentData(fullName: "akaki titberidze", age: 26, gender: .male, hobby: "kayaking in whitewater rivers", icon: UIImage(named: "male2")!),
    StudentData(fullName: "sandro kupatadze", age: 27, gender: .male, hobby: "scuba diving in the black sea", icon: UIImage(named: "male1")!),
    StudentData(fullName: "gvantsa gvagvalia", age: 22, gender: .female, hobby: "organic gardening", icon: UIImage(named: "female4")!),
    StudentData(fullName: "vano kvakhadze", age: 24, gender: .male, hobby: "studying quantum physics", icon: UIImage(named: "male3")!)
]
