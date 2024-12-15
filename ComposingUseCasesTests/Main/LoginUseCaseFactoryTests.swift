//
//  LoginUseCaseFactoryTests.swift
//  ComposingUseCasesTests
//
//  Created by Meharoof Najeeb on 16/12/2024.
//

import XCTest
@testable import ComposingUseCases

final class LoginUseCaseFactoryTests: XCTestCase {

    func test_createdUseCase_hasComposedOutputs() {
        let sut = LoginUseCaseFactory()
        let useCase = sut.makeUseCase()
        let composer = useCase.output as? LoginUseCaseOutputComposer
        
        XCTAssertNotNil(composer)
        XCTAssertEqual(composer?.outputs.count, 3)
        XCTAssertEqual(composer?.count(ofType: LoginPresenter.self), 1)
        XCTAssertEqual(composer?.count(ofType: CrashlyticsLoginTracker.self), 1)
        XCTAssertEqual(composer?.count(ofType:  FirebaseAnalyticsLoginTracker.self), 1)
    }
}

private extension LoginUseCaseOutputComposer {
    func count<T>(ofType: T.Type) -> Int { 
        return outputs.filter { $0 is T }.count
    }
}
