//
//  LogInViewController.swift
//  Assignment19
//
//  Created by Ana on 4/26/24.
//

import UIKit

class LogInViewController: UIViewController, LogInViewDelegate {
    var logInView = LogInPageView()
    let viewModel = LogInViewModel()

    
    override func loadView() {
        super.loadView()
        view = logInView
        logInView.delegate = self
        
        logInView.PasswordTextField.isSecureTextEntry = true
        logInView.repeatPasswordField.isSecureTextEntry = true
        
        changePicButton()
        loginButtonTapped()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInView.logInButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
//        viewModel.delegate = self
    }
    
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
    
    func loadImage() {
        let fileURL = getDocumentsDirectory().appendingPathComponent("addProfilePicture.png")
        if let imageData = try? Data(contentsOf: fileURL),
           let image = UIImage(data: imageData) {
            logInView.imageButton.setImage(image, for: .normal)
        }
    }
}

extension LogInViewController: LogInViewModelDelegate {
    func didSaveCredentials(success: Bool) {
        if success {
            let mainViewController = MainViewController()
            navigationController?.pushViewController(mainViewController, animated: true)
        } else {
            showAlert(message: "მონაცემები ვერ შეინახა")
        }
    }
}


extension LogInViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    func addImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            logInView.imageButton.setImage(image, for: .normal)
            saveImage(image: image)
        }
        dismiss(animated: true)
    }

    func saveImage(image: UIImage) {
        let imageData = image.jpegData(compressionQuality: 1) ?? image.pngData()
        if let data = imageData {
            let filename = getDocumentsDirectory().appendingPathComponent("addProfilePicture.png")
            try? data.write(to: filename)
        }
    }

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    func changePicButton() {
        logInView.imageButton.addAction(UIAction(handler: { _ in
            self.addImage()
        }), for: .touchUpInside)
    }
}
