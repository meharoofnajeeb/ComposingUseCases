//
//  LoginUseCase.swift
//  ComposingUseCases
//
//  Created by Meharoof Najeeb on 15/12/2024.
//

import Foundation

protocol LoginUseCaseOutput {
    func loginSucceeded()
    func loginFailed()
}

final class LoginUseCase {
    let output: LoginUseCaseOutput
    
    init(output: LoginUseCaseOutput) {
        self.output = output
    }
    
    func login(username: String, password: String) {
        // if success output.loginSucceeded()
        // else output.loginFailed() 
    }
}
