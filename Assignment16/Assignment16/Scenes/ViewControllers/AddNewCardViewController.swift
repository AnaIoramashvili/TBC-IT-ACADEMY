//
//  AddNewCardViewController.swift
//  Assignment16
//
//  Created by Ana on 4/14/24.
//

import Foundation
import UIKit

class AddNewCardViewController: UIViewController {
    
    lazy var backgroundView: UIImageView = {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "DefaultBackground")
        backgroundImage.contentMode = .scaleAspectFill
        return backgroundImage
    }()
    
    lazy var stackView1: UIStackView = {
        let stackView1 = UIStackView()
        stackView1.axis = .vertical
        stackView1.spacing = 15
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        return stackView1
    }()
    
    lazy var titleLabel1: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "პერსონაჟის სახელი"
        titleLabel.font = UIFont(name: "FiraGO-Bold", size: 14)
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var textField1: UITextField = {
        let textField1 = UITextField()
        textField1.font = UIFont(name: "FiraGO-Regular", size: 12)
        textField1.layer.borderColor = UIColor.white.cgColor
        textField1.layer.borderWidth = 1.0
        textField1.backgroundColor = .clear
        textField1.translatesAutoresizingMaskIntoConstraints = false
        
        let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.firstLineHeadIndent = 10
                
                let attributes: [NSAttributedString.Key: Any] = [
                    .foregroundColor: UIColor.gray,
                    .paragraphStyle: paragraphStyle
                ]
                textField1.attributedPlaceholder = NSAttributedString(string: "მაგ: AnaTheDestroyer", attributes: attributes)
        return textField1
    }()
    
    
    lazy var titleLabel2: UILabel = {
        let titleLabel2 = UILabel()
        titleLabel2.font = UIFont(name: "FiraGO-Bold", size: 14)
        titleLabel2.text = "აღწერე შენი პერსონაჟი"
        titleLabel2.textColor = .white
        titleLabel2.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel2
    }()
    
    lazy var textField2: UITextField = {
        let textField2 = UITextField()
        textField2.font = UIFont(name: "FiraGO-Regular", size: 12)
        textField2.layer.borderColor = UIColor.white.cgColor
        textField2.layer.borderWidth = 1.0
        textField2.backgroundColor = .clear
        textField2.translatesAutoresizingMaskIntoConstraints = false
        
        let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.firstLineHeadIndent = 10
                
                let attributes: [NSAttributedString.Key: Any] = [
                    .foregroundColor: UIColor.gray,
                    .paragraphStyle: paragraphStyle
                ]
                textField2.attributedPlaceholder = NSAttributedString(string: "მაგ: გრძელი თმა, მწვანე თვალები, მასკულინური", attributes: attributes)
        return textField2
    }()
    
    lazy var selectIconLabel: UILabel = {
        let selectIconLabel = UILabel()
        selectIconLabel.text = "აირჩიეთ აიქონი"
        selectIconLabel.font = UIFont(name: "FiraGo-Bold", size: 18)
        selectIconLabel.textColor = .white
        selectIconLabel.translatesAutoresizingMaskIntoConstraints = false
        return selectIconLabel
    }()
    
    lazy var stackView2: UIStackView = {
        let stackView2 = UIStackView()
        stackView2.axis = .horizontal
        stackView2.spacing = 27
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        return stackView2
    }()
    
    lazy var wizzardIconImage: UIImageView = {
        let wizzardIconImage = UIImageView()
        wizzardIconImage.image = UIImage(named: "Wizzard")
        wizzardIconImage.translatesAutoresizingMaskIntoConstraints = false
        return wizzardIconImage
    }()
    
    lazy var assassinIconImage: UIImageView = {
        let assassinIconImage = UIImageView()
        assassinIconImage.image = UIImage(named: "Assassin")
        assassinIconImage.translatesAutoresizingMaskIntoConstraints = false
        return assassinIconImage
    }()
    
    lazy var warriorIconImage: UIImageView = {
        let warriorIconImage = UIImageView()
        warriorIconImage.image = UIImage(named: "Warrior")
        warriorIconImage.translatesAutoresizingMaskIntoConstraints = false
        return warriorIconImage
    }()
    
    lazy var archerIconImage: UIImageView = {
        let archerIconImage = UIImageView()
        archerIconImage.image = UIImage(named: "Archer")
        archerIconImage.translatesAutoresizingMaskIntoConstraints = false
        return archerIconImage
    }()
    
    lazy var addButton: UIButton = {
        let addButton = UIButton()
        addButton.setTitle("დამატება", for: .normal)
        addButton.layer.cornerRadius = 23
        addButton.setTitleColor(.white, for: .normal)
        addButton.titleLabel?.font = UIFont(name: "FiraGO-Bold", size: 14)
        addButton.backgroundColor = .systemGreen
//        addButton.addTarget(self, action: #selector(addNewCard), for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        return addButton
    }()
    
    
    override func viewDidLoad() {
        layout()
    }
    
    func layout() {
        view.addSubview(backgroundView)
        view.addSubview(stackView1)
        view.addSubview(selectIconLabel)
        view.addSubview(stackView2)
        view.addSubview(addButton)
        
        stackView1.addArrangedSubview(titleLabel1)
        stackView1.addArrangedSubview(textField1)
        stackView1.addArrangedSubview(titleLabel2)
        stackView1.addArrangedSubview(textField2)
        
        stackView2.addArrangedSubview(wizzardIconImage)
        stackView2.addArrangedSubview(assassinIconImage)
        stackView2.addArrangedSubview(warriorIconImage)
        stackView2.addArrangedSubview(archerIconImage)


        textField1.layer.cornerRadius = 8
        textField2.layer.cornerRadius = 8
        
        NSLayoutConstraint.activate([
            stackView1.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            stackView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            textField1.heightAnchor.constraint(equalToConstant: 45),
            textField2.heightAnchor.constraint(equalToConstant: 45),
            
            selectIconLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 320),
            selectIconLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            stackView2.topAnchor.constraint(equalTo: view.topAnchor, constant: 370),
            stackView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 62),
            
            wizzardIconImage.heightAnchor.constraint(equalToConstant: 40),
            wizzardIconImage.widthAnchor.constraint(equalToConstant: 40),
            assassinIconImage.heightAnchor.constraint(equalToConstant: 40),
            assassinIconImage.widthAnchor.constraint(equalToConstant: 40),
            warriorIconImage.heightAnchor.constraint(equalToConstant: 40),
            warriorIconImage.widthAnchor.constraint(equalToConstant: 40),
            archerIconImage.heightAnchor.constraint(equalToConstant: 40),
            archerIconImage.widthAnchor.constraint(equalToConstant: 40),
            
            addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 664),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 121),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -121),
            addButton.heightAnchor.constraint(equalToConstant: 48),

        ])
    }
    
}
