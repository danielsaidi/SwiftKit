//
//  BiometricAuthenticationServiceTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2020-04-28.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(macOS)
import Quick
import Nimble
import MockingKit
@testable import SwiftKit

@available(iOS 11.0, OSX 10.12.2, *)
class BiometricAuthenticationServiceTests: QuickSpec {
    
    override func spec() {
        
        var service: TestClass!
        var asyncTrigger: AsyncTrigger!
        
        beforeEach {
            service = TestClass()
            service.registerResult(for: service.canAuthenticateUserRef) { _ in true }
            asyncTrigger = AsyncTrigger()
        }
        
        describe("authorizing user") {
            
            afterEach {
                expect(asyncTrigger.hasTriggered).toEventually(beTrue())
            }
            
            it("aborts with unsupportedAction error if service can't authenticate") {
                service.registerResult(for: service.canAuthenticateUserRef) { _ in false }
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
                expect(service.hasInvoked(service.performAuthenticationRef, numberOfTimes: 1)).to(beTrue())
            }
            
            it("completes with success if operation successfully authenticates user") {
                service.authenticateUser(for: .standard, reason: "") { result in
                    expect(result.isSuccess).to(beTrue())
                    asyncTrigger.trigger()
                }
                expect(service.hasInvoked(service.performAuthenticationRef, numberOfTimes: 1)).to(beTrue())
            }
        }
        
        describe("can authenticate user") {
            
            it("is properly mocked") {
                service.registerResult(for: service.canAuthenticateUserRef) { _ in true }
                expect(service.canAuthenticateUser(for: .standard)).to(beTrue())
                service.registerResult(for: service.canAuthenticateUserRef) { _ in false }
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
    
    lazy var canAuthenticateUserRef = MockReference(canAuthenticateUser)
    lazy var performAuthenticationRef = MockReference(performAuthentication)
    
    let mock = Mock()
    var authError: Error?
    
    override func canAuthenticateUser(for auth: Authentication) -> Bool {
        invoke(canAuthenticateUserRef, args: (auth))
    }
    
    override func performAuthentication(
        for auth: Authentication,
        reason: String,
        completion: @escaping AuthCompletion) {
        invoke(performAuthenticationRef, args: (auth, reason, completion))
        if let error = authError { return completion(.failure(error)) }
        completion(.success(()))
    }
}

private enum TestError: Error { case failure }
#endif
