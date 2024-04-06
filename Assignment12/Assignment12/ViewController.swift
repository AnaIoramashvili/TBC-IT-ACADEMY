//
//  ViewController.swift
//  Assignment12
//
//  Created by Ana on 4/5/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ratingStackView: UIStackView!
    @IBOutlet weak var heartImageView: UIImageView!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var coffeeNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var sizeStackView: UIStackView!
    @IBOutlet weak var priceAmountLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.cornerRadius = 18

        
        struct Coffee {
            var productName: String
            var price: Double
            var productSize: String
        }

            
        let coffee = Coffee(productName: "კაპუჩინო", price: 4.53, productSize: "საშუალო")

        
        coffeeNameLabel.text = coffee.productName
        priceAmountLabel.text = "₾ \(coffee.price)"

    }
}
        
