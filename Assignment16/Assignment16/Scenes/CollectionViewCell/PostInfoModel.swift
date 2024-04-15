//
//  PostInfoModel.swift
//  Assignment16
//
//  Created by Ana on 4/15/24.
//

import UIKit

class PostInfoModel {
    var icon: UIImage
    var title: String
    var description: String
    
    init(icon: UIImage, title: String, description: String) {
        self.icon = icon
        self.title = title
        self.description = description
    }
}


var posts: [PostInfoModel] = [
    PostInfoModel(icon: UIImage(named: "Wizzard")!, title: "Alden Spellbrook", description: "თეთრი გღზელი წვერი, ლურჯი მოსასხამი"),
    PostInfoModel(icon: UIImage(named: "Assassin")!, title: "Ezio Auditore", description: "თეთრი ტანსაცმელი"),
    PostInfoModel(icon: UIImage(named: "Warrior")!, title: "Thorfinn", description: "ქერა, მოკლე თმა, ორი დანა"),
    PostInfoModel(icon: UIImage(named: "Archer")!, title: "Fred Bear", description: "მწვანე მოსასხმარი, წითელი ფეხსაცმელი"),
    PostInfoModel(icon: UIImage(named: "Archer")!, title: "Jack Cherchil", description: "ყავისფერი ზედა, ლურჯი შარვალი"),
]
