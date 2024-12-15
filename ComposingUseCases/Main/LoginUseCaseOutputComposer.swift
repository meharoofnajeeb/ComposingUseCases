//
//  LoginUseCaseOutputComposer.swift
//  ComposingUseCases
//
//  Created by Meharoof Najeeb on 15/12/2024.
//

import Foundation

final class LoginUseCaseOutputComposer: LoginUseCaseOutput {
    
    let outputs: [LoginUseCaseOutput]
    
    init(_ outputs: [LoginUseCaseOutput]) {
        self.outputs = outputs
    }
    
    func loginSucceeded() {
        outputs.forEach { $0.loginSucceeded() }
    }
    
    func loginFailed() {
        outputs.forEach { $0.loginFailed() }
    }
}
