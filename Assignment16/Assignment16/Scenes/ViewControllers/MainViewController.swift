//
//  ViewController.swift
//  Assignment16
//
//  Created by Ana on 4/14/24.
//

import UIKit

class MainViewController: UIViewController {
    
    lazy var backgroundView: UIImageView = {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "DefaultBackground")
        backgroundImage.contentMode = .scaleAspectFill
        return backgroundImage
    }()
    
    lazy var addButton: UIButton = {
        let addButton = UIButton()
        addButton.setTitle("ახალი პერსონაჟის დამატება", for: .normal)
        addButton.layer.cornerRadius = 23
        addButton.setTitleColor(.white, for: .normal)
        addButton.titleLabel?.font = UIFont(name: "FiraGO-Bold", size: 14)
        addButton.backgroundColor = .systemBlue
        addButton.addTarget(self, action: #selector(addNewCard), for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        return addButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    func layout() {
        view.addSubview(backgroundView)
        view.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            addButton.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 664),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43),
            addButton.heightAnchor.constraint(equalToConstant: 48),
        ])

    }
    
    @objc func addNewCard() {
        let addNewCardViewController = AddNewCardViewController()
        navigationController?.pushViewController(addNewCardViewController, animated: true)
        
    }


}

