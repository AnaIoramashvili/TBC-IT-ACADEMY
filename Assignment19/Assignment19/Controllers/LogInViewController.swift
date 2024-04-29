//
//  LogInViewController.swift
//  Assignment19
//
//  Created by Ana on 4/26/24.
//


import UIKit

class LogInViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    // MARK: - Properties

    var logInView = LogInPageView()
    let viewModel = LogInViewModel()
    
    // MARK: - View Lifecycle

    override func loadView() {
        super.loadView()
        view = logInView
        viewModel.delegate = self
        
        logInView.PasswordTextField.isSecureTextEntry = true
        logInView.repeatPasswordField.isSecureTextEntry = true
        
        logInView.logInButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        logInView.imageButton.addAction(UIAction(handler: { [weak self] _ in
            self?.addImage()
        }), for: .touchUpInside)
    }
    
    // MARK: - Actions

    @objc func loginButtonTapped() {
        guard let username = logInView.nameTextField.text, !username.isEmpty else {
            showAlert(message: "ჩაწერეთ მომხმარებლის სახელი")
            return
        }

        guard let password = logInView.PasswordTextField.text, !password.isEmpty else {
            showAlert(message: "ჩაწერეთ პაროლი")
            return
        }

        guard let repeatPassword = logInView.repeatPasswordField.text, !repeatPassword.isEmpty else {
            showAlert(message: "გაიმეორეთ პაროლი")
            return
        }

        guard password == repeatPassword else {
            showAlert(message: "პაროლები არ ემთხვევა ერთმანეთს")
            return
        }
        viewModel.saveCredentials(username: username, password: password)

        let mainViewController = MainViewController()
        navigationController?.pushViewController(mainViewController, animated: true)
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Image Handling

    func addImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            logInView.imageButton.setImage(image, for: .normal)
            saveImage(image: image)
        }
        dismiss(animated: true)
    }

    func saveImage(image: UIImage) {
        if let data = image.jpegData(compressionQuality: 1.0) {
            let filename = getDocumentsDirectory().appendingPathComponent("addProfilePicture.png")
            try? data.write(to: filename)
        }
    }

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

// MARK: - LogInViewModelDelegate

extension LogInViewController: LogInViewModelDelegate {
    func didSaveCredentials(success: Bool) {
        if success {
            UserDefaults.standard.set(true, forKey: "FirstLogin")
            print(UserDefaults.standard.set(true, forKey: "FirstLogin"))
        } else {
            showAlert(message: "მონაცემები ვერ შეინახა")
        }
    }
}

