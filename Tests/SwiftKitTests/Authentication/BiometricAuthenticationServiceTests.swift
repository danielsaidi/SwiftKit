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
        let auth = Authentication(id: "test-auth")
        var asyncTrigger: AsyncTrigger!
        
        beforeEach {
            service = TestClass()
            service.registerResult(for: service.canAuthenticate) { _ in true }
            asyncTrigger = AsyncTrigger()
        }
        
        describe("authorizing auth") {
            
            afterEach {
                expect(asyncTrigger.hasTriggered).toEventually(beTrue())
            }
            
            it("aborts with unsupportedAction error if service can't authenticate") {
                service.registerResult(for: service.canAuthenticate) { _ in false }
                service.authenticate(auth, reason: "") { result in
                    expect(result.isFailure).to(beTrue())
                    expect(result.failureError as? AuthenticationServiceError).to(equal(.unsupportedAuthentication))
                    asyncTrigger.trigger()
                }
            }
            
            it("completes with error if operation fails with error") {
                service.authError = TestError.failure
                service.authenticate(auth, reason: "") { result in
                    expect(result.isFailure).to(beTrue())
                    expect(result.failureError).toNot(beNil())
                    asyncTrigger.trigger()
                }
                expect(service.hasInvoked(service.performAuthentication, numberOfTimes: 1)).to(beTrue())
            }
            
            it("completes with error if operation fail to authenticate user") {
                service.authResult = false
                service.authenticate(auth, reason: "") { result in
                    expect(result.isSuccess).to(beTrue())
                    expect(result.successResult).to(beFalse())
                    asyncTrigger.trigger()
                }
                expect(service.hasInvoked(service.performAuthentication, numberOfTimes: 1)).to(beTrue())
            }
            
            it("completes with success if operation successfully authenticates user") {
                service.authResult = true
                service.authenticate(auth, reason: "") { result in
                    expect(result.isSuccess).to(beTrue())
                    expect(result.successResult).to(beTrue())
                    asyncTrigger.trigger()
                }
                expect(service.hasInvoked(service.performAuthentication, numberOfTimes: 1)).to(beTrue())
            }
        }
        
        describe("can authenticate auth") {
            
            it("is properly mocked") {
                service.registerResult(for: service.canAuthenticate) { _ in true }
                expect(service.canAuthenticate(auth)).to(beTrue())
                service.registerResult(for: service.canAuthenticate) { _ in false }
                expect(service.canAuthenticate(auth)).to(beFalse())
            }
        }
        
        describe("perform authentication") {
            
            it("completes with mocked error") {
                service.authError = TestError.failure
                service.performAuthentication(for: auth, reason: "") { result in
                    expect(result.isFailure).to(beTrue())
                    expect(result.failureError).toNot(beNil())
                }
            }
            
            it("completes with mocked success") {
                service.authResult = true
                service.performAuthentication(for: auth, reason: "") { result in
                    expect(result.isSuccess).to(beTrue())
                    expect(result.successResult).to(beTrue())
                }
            }
        
            it("completes with mocked failure") {
                service.authResult = false
                service.performAuthentication(for: auth, reason: "") { result in
                    expect(result.isSuccess).to(beTrue())
                    expect(result.successResult).to(beFalse())
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
    var authResult = false
    
    override func canAuthenticate(_ auth: Authentication) -> Bool {
        invoke(canAuthenticate, args: (auth))
    }
    
    override func performAuthentication(for auth: Authentication, reason: String, completion: @escaping BiometricAuthenticationService.AuthCompletion) {
        invoke(performAuthentication, args: (auth, reason, completion))
        if let error = authError { return completion(.failure(error)) }
        completion(.success(authResult))
    }
}

private enum TestError: Error { case failure }
