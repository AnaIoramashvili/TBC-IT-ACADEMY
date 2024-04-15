//
//  AddNewCardViewController.swift
//  Assignment16
//
//  Created by Ana on 4/14/24.
//
import UIKit

class AddNewCardViewController: UIViewController {
    
    // MARK: - Properties

    var delegate: ReceiveDataDelegate?
    var imageSelected: String = ""
    
    // MARK: - Views

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
        textField1.textColor = .white
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
        textField2.textColor = .white
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

    lazy var wizzardIconButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Wizzard"), for: .normal)
        button.addTarget(self, action: #selector(addWizzardIconButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var assassinIconButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Assassin"), for: .normal)
        button.addTarget(self, action: #selector(addAssassinIconButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var warriorIconButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Warrior"), for: .normal)
        button.addTarget(self, action: #selector(addWarriorIconButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var archerIconButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Archer"), for: .normal)
        button.addTarget(self, action: #selector(addArcherIconButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    lazy var addButton: UIButton = {
        let addButton = UIButton()
        addButton.setTitle("დამატება", for: .normal)
        addButton.layer.cornerRadius = 23
        addButton.setTitleColor(.white, for: .normal)
        addButton.titleLabel?.font = UIFont(name: "FiraGO-Bold", size: 14)
        addButton.backgroundColor = .systemGreen
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        return addButton
    }()
        
    override func viewDidLoad() {
        navigationController?.navigationBar.isHidden = true
        layout()
    }

    
    // MARK: - Layout

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
        
        stackView2.addArrangedSubview(wizzardIconButton)
        stackView2.addArrangedSubview(assassinIconButton)
        stackView2.addArrangedSubview(warriorIconButton)
        stackView2.addArrangedSubview(archerIconButton)
        
        textField1.layer.cornerRadius = 8
        textField2.layer.cornerRadius = 8
        
        NSLayoutConstraint.activate([
            stackView1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 47),
            stackView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            textField1.heightAnchor.constraint(equalToConstant: 45),
            textField2.heightAnchor.constraint(equalToConstant: 45),
            
            selectIconLabel.topAnchor.constraint(equalTo: stackView1.bottomAnchor, constant: 29),
            selectIconLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            stackView2.topAnchor.constraint(equalTo: selectIconLabel.bottomAnchor, constant: 14),
            stackView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 62),
            
            wizzardIconButton.heightAnchor.constraint(equalToConstant: 40),
            wizzardIconButton.widthAnchor.constraint(equalToConstant: 40),
            assassinIconButton.heightAnchor.constraint(equalToConstant: 40),
            assassinIconButton.widthAnchor.constraint(equalToConstant: 40),
            warriorIconButton.heightAnchor.constraint(equalToConstant: 40),
            warriorIconButton.widthAnchor.constraint(equalToConstant: 40),
            archerIconButton.heightAnchor.constraint(equalToConstant: 40),
            archerIconButton.widthAnchor.constraint(equalToConstant: 40),
            
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 121),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -121),
            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            addButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    // MARK: - Action

    @objc func addWizzardIconButton() {
        imageSelected = "Wizzard"
    }
    
    @objc func addAssassinIconButton(){
        imageSelected = "Assassin"
    }
    
    @objc func addWarriorIconButton(){
        imageSelected = "Warrior"
    }
    
    @objc func addArcherIconButton(){
        imageSelected = "Archer"
    }
    
    @objc func addButtonTapped() {
        let post = PostInfoModel(icon: UIImage(named: imageSelected)!, title: textField1.text!, description: textField2.text!)
        delegate?.receive(post: post)
        navigationController?.popViewController(animated: true)
    }
}
