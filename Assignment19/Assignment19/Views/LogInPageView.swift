//
//  LogInPageView.swift
//  Assignment19
//
//  Created by Ana on 4/26/24.
//

import UIKit

class LogInPageView: UIView {
    
    // MARK: - Properties
    
    private let imageButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "addProfilePicture"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let textFieldsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let actionButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("შესვლა", for: .normal)
        button.layer.cornerRadius = 20
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "FiraGO", size: 11)
        button.backgroundColor = .systemGreen
//        button.addTarget(LogInPageView.self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
        
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setupViews() {
        addSubview(imageButton)
        addSubview(textFieldsStackView)
        addSubview(actionButton)
        
        addTextFieldWithLabel(title: "მომხმარებლის სახელი", placeholder: "შეიყვანეთ მომხმარებლის სახელი")
        addTextFieldWithLabel(title: "პაროლი", placeholder: "შეიყვანეთ პაროლი")
        addTextFieldWithLabel(title: "გაიმეორეთ პაროლი", placeholder: "განმეორებით შეიყვანეთ პაროლი")
        
        setupConstraints()
    }
    
    private func addTextFieldWithLabel(title: String, placeholder: String) {
        let label = UILabel()
        label.text = title
        label.font = UIFont(name: "FiraGO", size: 11)
        label.adjustsFontForContentSizeCategory = false
        label.textColor = .label
        print("Label font: \(label.font?.fontName ?? "") - size \(label.font?.pointSize ?? 0)")

        
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.font = UIFont.systemFont(ofSize: 11)
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 22.5
        textField.layer.masksToBounds = true
        textField.backgroundColor = UIColor.systemGray5
        textField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [label, textField])
        stackView.axis = .vertical
        stackView.spacing = 8
        
        textFieldsStackView.addArrangedSubview(stackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageButton.topAnchor.constraint(equalTo: topAnchor, constant: 110),
            imageButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 121),
            imageButton.widthAnchor.constraint(equalToConstant: 132),
            imageButton.heightAnchor.constraint(equalToConstant: 132),
            
            textFieldsStackView.topAnchor.constraint(equalTo: imageButton.bottomAnchor, constant: 47),
            textFieldsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            textFieldsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            textFieldsStackView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -50),
            
            actionButton.topAnchor.constraint(equalTo: textFieldsStackView.bottomAnchor, constant: 50),
            actionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            actionButton.heightAnchor.constraint(equalToConstant: 45),
            actionButton.widthAnchor.constraint(equalToConstant: 327),
        ])
    }

    
//    @objc func buttonTapped() {
//    }
}
