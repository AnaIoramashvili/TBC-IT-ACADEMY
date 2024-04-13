//
//  ViewController.swift
//  Assignment13
//
//  Created by Ana on 4/7/24.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var lockLaptop: UIImageView = {
        let lockLaptop = UIImageView()
        lockLaptop.image = UIImage(systemName: "lock.laptopcomputer")
        lockLaptop.tintColor = .black
        lockLaptop.translatesAutoresizingMaskIntoConstraints = false
        return lockLaptop
    }()
    
    lazy var stackView1: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "მოგესალმებით!"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "ამ აპლიკაციის გამოყენების საუკეთესო გზა თქვენს ანგარიშზე შესვლაა, თუ არ გაქვთ ანგარიში გააკეთეთ, თუ არ გსურთ გაკეთება დასტოვეთ აქაურობა და წაშალეთ აპლიკაცია."
        label.numberOfLines = 0
        label.font = UIFont(name: "Arial", size: 14)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10
        
        let attributedString = NSMutableAttributedString(string: label.text ?? "")
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle,range: NSMakeRange(0, attributedString.length))
        label.attributedText = attributedString
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var authorizationLabel: UILabel = {
        let label = UILabel()
        label.text = "ავტორიზაცია"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var stackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
        
    lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "სრული სახელი"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var fullNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "მაგ: ჰასბულა"
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "ელ. ფოსტა"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "მაგ: hasbula777@gmail.com"
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "პაროლი"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "მაგ: hasbuliko123123"
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("შესვლა", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var orLabel: UILabel = {
        let label = UILabel()
        label.text = "ან"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var leftLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 150).isActive = true
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }()

    lazy var rightLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 150).isActive = true
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }()
    
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var googleButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 12
        button.setTitle("გამოიყენეთ Google", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        
        let googleSymbol = UIImage(systemName: "g.circle.fill")
        button.setImage(googleSymbol, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .black
//        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var facebookButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 12
        button.setTitle("გამოიყენეთ Facebook", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        
        let fbSymbol = UIImage(systemName: "f.circle.fill")
        button.setImage(fbSymbol, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .black
//        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(lockLaptop)
        view.addSubview(stackView1)
        view.addSubview(stackView2)
        view.addSubview(buttonStackView)
        view.addSubview(orLabel)
        view.addSubview(rightLineView)
        view.addSubview(leftLineView)
        view.addSubview(authorizationLabel)
        view.addSubview(lineView)
        view.addSubview(loginButton)
        
        stackView1.addArrangedSubview(titleLabel)
        stackView1.addArrangedSubview(textLabel)
        
        stackView2.addArrangedSubview(fullNameLabel)
        stackView2.addArrangedSubview(fullNameTextField)
        stackView2.addArrangedSubview(emailLabel)
        stackView2.addArrangedSubview(emailTextField)
        stackView2.addArrangedSubview(passwordLabel)
        stackView2.addArrangedSubview(passwordTextField)
        
        
        buttonStackView.addArrangedSubview(googleButton)
        buttonStackView.addArrangedSubview(facebookButton)

        
        NSLayoutConstraint.activate([
            lockLaptop.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            lockLaptop.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lockLaptop.widthAnchor.constraint(equalToConstant: 90),
            lockLaptop.heightAnchor.constraint(equalToConstant: 50),
            
            stackView1.topAnchor.constraint(equalTo: lockLaptop.bottomAnchor, constant: 20),
            stackView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        
            authorizationLabel.topAnchor.constraint(equalTo: stackView1.bottomAnchor, constant: 30),
            authorizationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            lineView.topAnchor.constraint(equalTo: authorizationLabel.bottomAnchor, constant: 10),
            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            lineView.heightAnchor.constraint(equalToConstant: 1),

            
            stackView2.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 24),
            stackView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            
            lineView.heightAnchor.constraint(equalToConstant: 1),
              
            fullNameTextField.heightAnchor.constraint(equalToConstant: 40),
              
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
              
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            googleButton.heightAnchor.constraint(equalToConstant: 48),
            
            facebookButton.heightAnchor.constraint(equalToConstant: 48),
            
            
            loginButton.topAnchor.constraint(equalTo: stackView2.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            
            orLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            orLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            leftLineView.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor),
            leftLineView.trailingAnchor.constraint(equalTo: orLabel.leadingAnchor, constant: -8),
            
            rightLineView.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor),
            rightLineView.leadingAnchor.constraint(equalTo: orLabel.trailingAnchor, constant: 8),
              
            buttonStackView.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 20),
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -28)
        ])
    }
    
    @objc func loginButtonTapped() {
        let email = emailTextField.text ?? ""
        let isValidEmail = checkEmailForMe(email)
        
        let password = passwordTextField.text ?? ""
        let isValidPassword = password.count >= 6 && password.count <= 15
        
        if !isValidEmail {
            emailTextField.layer.borderColor = UIColor.red.cgColor
            emailTextField.layer.borderWidth = 1.0
            print("ელ.ფოსტა არ არის შეყვანილი/ არასწორი ელ. ფოსტის ფორმატი")
        } else {
            emailTextField.layer.borderColor = nil
            emailTextField.layer.borderWidth = 0.0
        }
        
        if !isValidPassword {
            passwordTextField.layer.borderColor = UIColor.red.cgColor
            passwordTextField.layer.borderWidth = 1.0
            print("პაროლი არ არის შეყვანილი/ არასწორი პაროლის ფორმატი")
        } else {
            passwordTextField.layer.borderColor = nil
            passwordTextField.layer.borderWidth = 0.0
        }
        
    }

    
    
    func checkEmailForMe(_ email: String) -> Bool {
        let isCorrectPattern = email.contains("@") && email.contains(".") && !email.contains(" ")
        let hasValidSuffix = email.hasSuffix(".com") || email.hasSuffix(".ge")
        
        return isCorrectPattern && hasValidSuffix
    }
    
    
}




