//
//  ThirdViewController.swift
//  Assignment14
//
//  Created by Ana on 4/11/24.
//

import Foundation
import UIKit

var zodiacSign: ZodiacSign?

class ThirdViewController: UIViewController {
    
    lazy var backgroundView: UIImageView = {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = .scaleAspectFill
        return backgroundImage
    }()
    
    lazy var stackview: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var zodiacImageView: UIImageView = {
        let zodiacImage = UIImageView()
        zodiacImage.image = UIImage(named: "")
        zodiacImage.translatesAutoresizingMaskIntoConstraints = false
        return zodiacImage
    }()
    
    lazy var zodiacName: UILabel = {
        let zodiacName = UILabel()
        zodiacName.font = UIFont.systemFont(ofSize: 24)
        zodiacName.text = ""
        zodiacName.textColor = .white
        zodiacName.textAlignment = .center
        zodiacName.translatesAutoresizingMaskIntoConstraints = false
        return zodiacName
    }()
    
    override func viewDidLoad(){
        layout()
        if let sign = selectedZodiacSign {
            print(sign.name)
            zodiacName.text = sign.polarSign
            zodiacImageView.image = sign.polarIcon
        }

    }
    
    func layout() {
        view.addSubview(backgroundView)
        view.addSubview(stackview)
        
        stackview.addArrangedSubview(zodiacImageView)
        stackview.addArrangedSubview(zodiacName)
        
        NSLayoutConstraint.activate([
            stackview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackview.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            zodiacImageView.heightAnchor.constraint(equalToConstant: 165),
            zodiacImageView.widthAnchor.constraint(equalToConstant: 165)

        ])

    }

    
}

