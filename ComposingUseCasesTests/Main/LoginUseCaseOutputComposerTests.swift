//
//  LoginUseCaseOutputComposerTests.swift
//  ComposingUseCasesTests
//
//  Created by Meharoof Najeeb on 15/12/2024.
//

import XCTest
@testable import ComposingUseCases

class LoginUseCaseOutputComposerTests: XCTestCase {
    
    func test_composingZeroOutputs_doesNotCrash() {
        let sut = LoginUseCaseOutputComposer([])
        
        sut.loginSucceeded()
        sut.loginFailed()
    }
    
    func test_composingMultipleOutputs_delegatesSucceededMessage() {
        let output1 = LoginUseCaseOutputSpy()
        let output2 = LoginUseCaseOutputSpy()
        
        let sut = LoginUseCaseOutputComposer([output1, output2])
        
        sut.loginSucceeded()
        
        XCTAssertEqual(output1.loginSucceededCount, 1)
        XCTAssertEqual(output1.loginFailedCount, 0)
        
        XCTAssertEqual(output2.loginSucceededCount, 1)
        XCTAssertEqual(output2.loginFailedCount, 0)
    }
    
    func test_composingMultipleOutputs_delegatesFailedMessage() {
        let output1 = LoginUseCaseOutputSpy()
        let output2 = LoginUseCaseOutputSpy()
        
        let sut = LoginUseCaseOutputComposer([output1, output2])
        
        sut.loginFailed()
        
        XCTAssertEqual(output1.loginSucceededCount, 0)
        XCTAssertEqual(output1.loginFailedCount, 1)
        
        XCTAssertEqual(output2.loginSucceededCount, 0)
        XCTAssertEqual(output2.loginFailedCount, 1)
    }
    
    // MARK: Helpers
    private class LoginUseCaseOutputSpy: LoginUseCaseOutput {
        var loginSucceededCount = 0
        var loginFailedCount = 0
        
        func loginSucceeded() {
            loginSucceededCount += 1
        }
        
        func loginFailed() {
            loginFailedCount += 1
        }
        
        
    }
}
