//
//  BiometricsAuthenticationServiceTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2020-04-28.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Mockery
@testable import SwiftKit

class BiometricsAuthenticationServiceTests: QuickSpec {
    
    override func spec() {
        
        var service: TestClass!
        var asyncTrigger: AsyncTrigger!
        
        beforeEach {
            service = TestClass()
            service.registerResult(for: service.canAuthenticateUser) { _ in true }
            asyncTrigger = AsyncTrigger()
        }
        
        describe("authorizing user") {
            
            afterEach {
                expect(asyncTrigger.hasTriggered).toEventually(beTrue())
            }
            
            it("aborts with unsupportedAction error if service can't authenticate") {
                service.registerResult(for: service.canAuthenticateUser) { _ in false }
                service.authenticateUser(for: .standard, reason: "") { result in
                    expect(result.isFailure).to(beTrue())
                    expect(result.failureError as? AuthenticationServiceError).to(equal(.unsupportedAuthentication))
                    asyncTrigger.trigger()
                }
            }
            
            it("completes with error if operation fails with error") {
                service.authError = TestError.failure
                service.authenticateUser(for: .standard, reason: "") { result in
                    expect(result.isFailure).to(beTrue())
                    expect(result.failureError).toNot(beNil())
                    asyncTrigger.trigger()
                }
                expect(service.hasInvoked(service.performAuthentication, numberOfTimes: 1)).to(beTrue())
            }
            
            it("completes with success if operation successfully authenticates user") {
                service.authenticateUser(for: .standard, reason: "") { result in
                    expect(result.isSuccess).to(beTrue())
                    asyncTrigger.trigger()
                }
                expect(service.hasInvoked(service.performAuthentication, numberOfTimes: 1)).to(beTrue())
            }
        }
        
        describe("can authenticate user") {
            
            it("is properly mocked") {
                service.registerResult(for: service.canAuthenticateUser) { _ in true }
                expect(service.canAuthenticateUser(for: .standard)).to(beTrue())
                service.registerResult(for: service.canAuthenticateUser) { _ in false }
                expect(service.canAuthenticateUser(for: .standard)).to(beFalse())
            }
        }
        
        describe("perform authentication") {
            
            it("completes with mocked error") {
                service.authError = TestError.failure
                service.performAuthentication(for: .standard, reason: "") { result in
                    expect(result.isFailure).to(beTrue())
                    expect(result.failureError).toNot(beNil())
                }
            }
            
            it("completes with mocked success") {
                service.performAuthentication(for: .standard, reason: "") { result in
                    expect(result.isSuccess).to(beTrue())
                }
            }
        }
    }
}

/**
 This test suite needs to bypass biometric authentication to
 be able to test the remaining logic.
 */
private class TestClass: BiometricAuthenticationService, Mockable {
    
    let mock = Mock()
    var authError: Error?
    
    override func canAuthenticateUser(for auth: Authentication) -> Bool {
        invoke(canAuthenticateUser, args: (auth))
    }
    
    override func performAuthentication(for auth: Authentication, reason: String, completion: @escaping BiometricAuthenticationService.AuthCompletion) {
        invoke(performAuthentication, args: (auth, reason, completion))
        if let error = authError { return completion(.failure(error)) }
        completion(.success(()))
    }
}

private enum TestError: Error { case failure }
