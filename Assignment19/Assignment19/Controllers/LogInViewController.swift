//
//  LogInViewController.swift
//  Assignment19
//
//  Created by Ana on 4/26/24.
//

import UIKit

class LogInViewController: UIViewController {
    var logInView: LogInPageView
    
    init() {
        self.logInView = LogInPageView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = logInView

    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        logInView.actionButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc func loginButtonTapped() {
        let mainViewController = MainViewController()
        navigationController?.pushViewController(mainViewController, animated: true)
    }
}
