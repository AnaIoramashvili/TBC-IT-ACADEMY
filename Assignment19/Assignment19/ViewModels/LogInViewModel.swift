//
//  LogInViewModel.swift
//  Assignment19
//
//  Created by Ana on 4/27/24.
//

import Foundation


protocol LogInViewModelDelegate: AnyObject {
    func didSaveCredentials(success: Bool)
}

class LogInViewModel {
    weak var delegate: LogInViewModelDelegate?
    
    func saveCredentials(username: String, password: String) {
        let usernameSaved = KeychainService.save(username, forKey: "username")
        let passwordSaved = KeychainService.save(password, forKey: "password")
        
        if usernameSaved && passwordSaved {
            delegate?.didSaveCredentials(success: true)
        } else {
            delegate?.didSaveCredentials(success: false)
        }
    }
}
