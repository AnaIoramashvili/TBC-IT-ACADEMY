//
//  SecondViewController.swift
//  Assignment14
//
//  Created by Ana on 4/10/24.
//

import UIKit


class SecondViewController: UIViewController {
    
    var zodiacSign: ZodiacSign?
    
    lazy var backgroundView: UIImageView = {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = .scaleAspectFill
        return backgroundImage
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
    
    lazy var zodiacText: UITextView = {
        let zodiacText = UITextView()
        zodiacText.text = ""
        zodiacText.font = .systemFont(ofSize: 14)
        zodiacText.textColor = .lightGray
        zodiacText.backgroundColor = .clear
        zodiacText.translatesAutoresizingMaskIntoConstraints = false
        return zodiacText
    }()
    
    lazy var polarSignButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .purple
        button.setTitle("პოლარული ნიშანი", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.layer.cornerRadius = 12
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(goToThirdPage), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        if let sign = selectedZodiacSign {
            print(sign.name)
            zodiacName.text = sign.name
            zodiacImageView.image = sign.icon
            zodiacText.text = sign.description
        }
        
        layout()
    }
    
    func layout() {
        
        view.addSubview(backgroundView)
        view.addSubview(zodiacImageView)
        view.addSubview(zodiacName)
        view.addSubview(zodiacText)
        view.addSubview(polarSignButton)
        
        NSLayoutConstraint.activate([
            zodiacImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            zodiacImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            zodiacImageView.widthAnchor.constraint(equalToConstant: 156),
            zodiacImageView.heightAnchor.constraint(equalToConstant: 156),
            
            zodiacName.topAnchor.constraint(equalTo: zodiacImageView.bottomAnchor, constant: 5),
            zodiacName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            zodiacName.widthAnchor.constraint(equalToConstant: 150),
            zodiacName.heightAnchor.constraint(equalToConstant: 34),
            
            zodiacText.topAnchor.constraint(equalTo: zodiacName.bottomAnchor, constant: 13),
            zodiacText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            zodiacText.widthAnchor.constraint(equalToConstant: 327),
            zodiacText.heightAnchor.constraint(equalToConstant: 420),
            
            polarSignButton.topAnchor.constraint(equalTo: zodiacText.bottomAnchor, constant: 20),
            polarSignButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            polarSignButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            polarSignButton.heightAnchor.constraint(equalToConstant: 50),
            polarSignButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60)

        ])
        
        
        
    }
    
    @objc func goToThirdPage() {
        let thirdViewController = ThirdViewController()
        navigationController?.pushViewController(thirdViewController, animated: true)
    }

    
}
