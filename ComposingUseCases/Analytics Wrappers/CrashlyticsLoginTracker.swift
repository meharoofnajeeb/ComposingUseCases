//
//  CrashlyticsLoginTracker.swift
//  ComposingUseCases
//
//  Created by Meharoof Najeeb on 15/12/2024.
//

import Foundation

final class CrashlyticsLoginTracker: LoginUseCaseOutput {
    func loginSucceeded() {
        // send login event to crashlytics
    }
    
    func loginFailed() {
        // send error to crashlytics
    }
}
