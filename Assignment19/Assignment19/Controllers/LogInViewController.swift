//
//  LogInViewController.swift
//  Assignment19
//
//  Created by Ana on 4/26/24.
//

import UIKit

class LogInViewController: UIViewController {
    var logInView: LogInPageView!
    let viewModel = LogInViewModel()
    
    override func loadView() {
        super.loadView()
        logInView = LogInPageView()
        view = logInView
        
        logInView.actionButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        logInView.PasswordTextField.isSecureTextEntry = true
        logInView.repeatPasswordField.isSecureTextEntry = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
    }
    
    @objc func loginButtonTapped() {
        guard let username = logInView.nameTextField.text, !username.isEmpty else {
            showAlert(message: "Please enter a username")
            return
        }
        
        guard let password = logInView.PasswordTextField.text, !password.isEmpty else {
            showAlert(message: "Please enter a password")
            return
        }
        
        guard let repeatPassword = logInView.repeatPasswordField.text, !repeatPassword.isEmpty else {
            showAlert(message: "Please repeat the password")
            return
        }
        
        guard password == repeatPassword else {
            showAlert(message: "Passwords do not match")
            return
        }
        
        viewModel.saveCredentials(username: username, password: password)
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension LogInViewController: LogInViewModelDelegate {
    func didSaveCredentials(success: Bool) {
        if success {
            let mainViewController = MainViewController()
            navigationController?.pushViewController(mainViewController, animated: true)
        } else {
            showAlert(message: "Failed to save credentials")
        }
    }
}
