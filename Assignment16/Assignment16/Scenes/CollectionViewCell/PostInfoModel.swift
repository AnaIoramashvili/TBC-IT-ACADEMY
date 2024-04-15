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
    PostInfoModel(icon: UIImage(named: "Wizzard")!, title: "Beka ras gverchi?", description: "ახლა გავხსენი დავალება ეს რააარიიი"),
    PostInfoModel(icon: UIImage(named: "Assassin")!, title: "რამე სიმღერა მირჩიეთ ", description: "დავალების კეთებისას ღამე ძაან მეძინება,ყავამ არ მიშველა"),
    PostInfoModel(icon: UIImage(named: "Warrior")!, title: "ფიგმამ თქვენც დაგტანჯათ? ", description: "შევწუხდი დაბალი ხარისხით იწერს ყველას"),
    PostInfoModel(icon: UIImage(named: "Archer")!, title: "მეტი ბედინა გვინდა ", description: "შევწუხდით ნუ, აღარ გვინდა ამდენი ტეილორ Swift-ი"),
    PostInfoModel(icon: UIImage(named: "Archer")!, title: "მეტი ბედინა გვინდა ", description: "შევწუხდით ნუ, აღარ გვინდა ამდენი ტეილორ Swift-ი"),
]
