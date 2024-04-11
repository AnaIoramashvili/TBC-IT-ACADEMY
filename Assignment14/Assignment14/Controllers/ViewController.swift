//
//  ViewController.swift
//  Assignment14
//
//  Created by Ana on 4/10/24.
//

import UIKit

var selectedZodiacSign: ZodiacSign?

class MainViewController: UIViewController {
    
    lazy var backgroundView: UIImageView = {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = .scaleAspectFill
        return backgroundImage
    }()
    
    lazy var stackView1: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "მიშა ცაგარელის ჰაბი"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "მოცემულ აპლიკაციაში შეგიძლიათ გაიგოთ თქვენი ზოდიაქოს ყველაზე გამოკვეთილი უნარები და თვისებები."
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var stackview2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var zodiacNameLabel: UILabel = {
        let label = UILabel()
        label.text = "ზოდიაქოს სახელი"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "მაგ: თევზები"
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.textColor = .white
        textField.backgroundColor = .clear
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.borderWidth = 1.0
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        if let placeHolder = textField.placeholder {
            let attribute: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.lightGray,
                .font: UIFont.systemFont(ofSize: 12)]
            textField.attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: attribute)
        }
        
        return textField
    }()
    
    lazy var nextButton:  UIButton = {
        let button = UIButton()
        button.setTitle("შემდეგ", for: .normal)
        button.layer.cornerRadius = 12
        button.backgroundColor = .purple
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(goToSecondPage), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
    }


    
    
// MARK: Layout
    func layout() {
        
        view.addSubview(backgroundView)
        view.addSubview(stackView1)
        view.addSubview(stackview2)
        view.addSubview(nextButton)
        stackView1.addArrangedSubview(titleLabel)
        stackView1.addArrangedSubview(textLabel)
        stackview2.addArrangedSubview(zodiacNameLabel)
        stackview2.addArrangedSubview(textField)
        
        NSLayoutConstraint.activate([
            stackView1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            stackView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            stackview2.topAnchor.constraint(equalTo: stackView1.bottomAnchor, constant: 100),
            stackview2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackview2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            
            nextButton.topAnchor.constraint(equalTo: stackview2.bottomAnchor, constant: 30),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 50),


        ])
        

    }
    

    @objc func goToSecondPage() {
        guard let searchZodiacSign = textField.text, !searchZodiacSign.isEmpty else {
            textField.layer.borderColor = UIColor.red.cgColor
            textField.layer.borderWidth = 1.0
            return
        }
        
        textField.layer.borderColor = UIColor.white.cgColor
        
        if let zodiacToShow = zodiacSignsDic[searchZodiacSign] {
            selectedZodiacSign = zodiacToShow
            let secondNavController = SecondViewController()
            navigationController?.pushViewController(secondNavController, animated: true)
        } else {
            textField.layer.borderColor = UIColor.red.cgColor
            textField.layer.borderWidth = 1.0
        }
        

//
//        let secondNavController = SecondViewController()
//        navigationController?.pushViewController(secondNavController, animated: true)
    }
    

}

