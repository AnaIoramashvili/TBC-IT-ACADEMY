//
//  LogInPageView.swift
//  Assignment19
//
//  Created by Ana on 4/26/24.
//

import UIKit

// MARK: - Protocol

protocol LogInViewDelegate: AnyObject {
//    func loginButtonTapped()
}

class LogInPageView: UIView {
    // MARK: - UI Components
    
    let imageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "addProfilePicture"), for: .normal)
        button.layer.cornerRadius = 66
        button.clipsToBounds = true
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "მომხმარებლის სახელი"
        label.font = UIFont(name: "FiraGO", size: 11)
        label.textColor = UIColor(named: "labelColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "შეიყვანეთ მომხმარებლის სახელი"
        textField.font = UIFont.systemFont(ofSize: 11)
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let stackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "პაროლი"
        label.font = UIFont(name: "FiraGO", size: 11)
        label.textColor = UIColor(named: "labelColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let PasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "შეიყვანეთ პაროლი"
        textField.font = UIFont.systemFont(ofSize: 11)
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let stackView3: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let repeatPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "გაიმეორეთ პაროლი"
        label.font = UIFont(name: "FiraGO", size: 11)
        label.textColor = UIColor(named: "labelColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let repeatPasswordField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "განმეორებით შეიყვანეთ პაროლი"
        textField.font = UIFont.systemFont(ofSize: 11)
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("შესვლა", for: .normal)
        button.layer.cornerRadius = 20
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "FiraGO", size: 11)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    weak var delegate: LogInViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Views

    private func setupViews() {
        backgroundColor = .systemBackground
        addSubview(imageButton)
        
        addSubview(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(nameTextField)
        
        addSubview(stackView2)
        stackView2.addArrangedSubview(passwordLabel)
        stackView2.addArrangedSubview(PasswordTextField)
        
        addSubview(stackView3)
        stackView3.addArrangedSubview(repeatPasswordLabel)
        stackView3.addArrangedSubview(repeatPasswordField)
        
        addSubview(logInButton)
        setupConstraints()
        
        let textFields = [nameTextField, PasswordTextField, repeatPasswordField]
        textFields.forEach { textField in
            textField.layer.cornerRadius = 22.5
            textField.layer.masksToBounds = true
            textField.backgroundColor = UIColor.systemGray5
            textField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        }
        
//        logInButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
    }
    
    // MARK: - Setup Constraints

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageButton.topAnchor.constraint(equalTo: topAnchor, constant: 80),
            imageButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 121),
            imageButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -121),
            imageButton.heightAnchor.constraint(equalToConstant: 132),
            
            stackView.topAnchor.constraint(equalTo: imageButton.bottomAnchor, constant: 47),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            stackView2.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 31),
            stackView2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            stackView2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            stackView3.topAnchor.constraint(equalTo: stackView2.bottomAnchor, constant: 31),
            stackView3.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            stackView3.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            logInButton.topAnchor.constraint(equalTo: stackView3.bottomAnchor, constant: 50),
            logInButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            logInButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            logInButton.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
    
//    private func setupActions() {
//        logInButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
//    }
//
//    @objc private func loginButtonPressed() {
//        delegate?.loginButtonTapped()
//    }
    
}

