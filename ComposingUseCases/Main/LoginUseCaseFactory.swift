//
//  LoginUseCaseFactory.swift
//  ComposingUseCases
//
//  Created by Meharoof Najeeb on 16/12/2024.
//

import Foundation

class LoginUseCaseFactory {
  
    func makeUseCase() -> LoginUseCase {
        return  LoginUseCase(output: LoginUseCaseOutputComposer([
            LoginPresenter(),
            CrashlyticsLoginTracker(),
            FirebaseAnalyticsLoginTracker()
        ]))
    }
}
