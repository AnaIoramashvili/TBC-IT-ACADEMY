//
//  OnBoardingViewController.swift
//  Assignment16
//
//  Created by Ana on 4/14/24.
//

import Foundation
import UIKit

class OnBoardingViewController: UIViewController {
    
    lazy var backgroundView: UIImageView = {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "SecondPageBackground")
        backgroundImage.contentMode = .scaleAspectFill
        return backgroundImage
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = """
                    შედი
                    აპლიკაციაში
                    და შექმენი
                    შენი პერსონაჟი
                    """
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name: "FiraGO-Regular", size: 28)
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var startButton: UIButton = {
        let startButton = UIButton()
        startButton.setTitle("დაწყება", for: .normal)
        startButton.layer.cornerRadius = 23
        startButton.setTitleColor(.white, for: .normal)
        startButton.titleLabel?.font = UIFont(name: "FiraGO-Bold", size: 14)
        startButton.backgroundColor = .systemBlue
        startButton.addTarget(self, action: #selector(goToMainVC), for: .touchUpInside)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        return startButton
    }()

    override func viewDidLoad() {
        layout()
    }

    func layout() {
        view.addSubview(backgroundView)
        view.addSubview(titleLabel)
        view.addSubview(startButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 382),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            titleLabel.heightAnchor.constraint(equalToConstant: 200),
            
            startButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 222),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            startButton.heightAnchor.constraint(equalToConstant: 48),
            
        ])
    }
    
    @objc func goToMainVC() {
        let maincViewController = MainViewController()
        navigationController?.setViewControllers([maincViewController], animated: true)
    }
}
