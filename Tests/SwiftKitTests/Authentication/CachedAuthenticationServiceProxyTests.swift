//
//  CachedAuthenticationServiceProxyTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2020-04-28.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import MockingKit
@testable import SwiftKit

class CachedAuthenticationServiceProxyTests: QuickSpec {
    
    override func spec() {
        
        var service: CachedAuthenticationServiceProxy!
        var mock: MockAuthenticationService!
        var asyncTrigger: AsyncTrigger!
        
        beforeEach {
            mock = MockAuthenticationService()
            service = CachedAuthenticationServiceProxy(baseService: mock)
            mock.registerResult(for: mock.canAuthenticateUserRef) { _ in true }
            asyncTrigger = AsyncTrigger()
        }
        
        describe("authorizing user") {
            
            afterEach {
                expect(asyncTrigger.hasTriggered).toEventually(beTrue())
                expect(mock.hasInvoked(mock.authenticateUserRef, numberOfTimes: 1)).to(beTrue())
            }
            
            it("aborts with success if service is already authenticated") {
                service.authenticateUser(for: .standard, reason: "") { _ in
                    service.authenticateUser(for: .standard, reason: "") { result in
                        expect(result.isSuccess).to(beTrue())
                        asyncTrigger.trigger()
                    }
                }
            }
            
            it("aborts with mocked error") {
                mock.authError = TestError.failure
                service.authenticateUser(for: .standard, reason: "") { result in
                    expect(result.isFailure).to(beTrue())
                    expect(result.failureError as? TestError).to(equal(.failure))
                    asyncTrigger.trigger()
                }
            }
            
            it("completes with mocked success") {
                service.authenticateUser(for: .standard, reason: "") { result in
                    expect(result.isSuccess).to(beTrue())
                    asyncTrigger.trigger()
                }
            }
        }
        
        describe("can authenticate user") {
            
            it("returns mocked result") {
                mock.registerResult(for: mock.canAuthenticateUserRef) { _ in true }
                expect(service.canAuthenticateUser(for: .standard)).to(beTrue())
                mock.registerResult(for: mock.canAuthenticateUserRef) { _ in false }
                expect(service.canAuthenticateUser(for: .standard)).to(beFalse())
            }
        }
        
        describe("checking if user is authenticated") {
            
            afterEach {
                expect(asyncTrigger.hasTriggered).toEventually(beTrue())
            }
            
            it("is false before an authentication attempt") {
                expect(service.isUserAuthenticated(for: .standard)).to(beFalse())
                service.authenticateUser(for: .standard, reason: "") { _ in
                    asyncTrigger.trigger()
                }
            }
            
            it("is false after a failed authentication") {
                mock.authError = TestError.failure
                service.authenticateUser(for: .standard, reason: "") { _ in
                    expect(service.isUserAuthenticated(for: .standard)).to(beFalse())
                    asyncTrigger.trigger()
                }
            }
            
            it("is true after a successful authentication") {
                service.authenticateUser(for: .standard, reason: "") { _ in
                    expect(service.isUserAuthenticated(for: .standard)).to(beTrue())
                    asyncTrigger.trigger()
                }
            }
            
            it("becomes false when authentication cache is reset") {
                service.authenticateUser(for: .standard, reason: "") { _ in
                    expect(service.isUserAuthenticated(for: .standard)).to(beTrue())
                    service.resetUserAuthentication(for: .standard)
                    expect(service.isUserAuthenticated(for: .standard)).to(beFalse())
                    asyncTrigger.trigger()
                }
            }
        }
        
        describe("resetting user authentication") {
            
            it("resets all state") {
                let auth = Authentication(id: "another-auth")
                service.authenticateUser(for: .standard, reason: "") { _ in
                    service.authenticateUser(for: auth, reason: "") { _ in
                        expect(service.isUserAuthenticated(for: .standard)).to(beTrue())
                        expect(service.isUserAuthenticated(for: auth)).to(beTrue())
                        service.resetUserAuthentication()
                        expect(service.isUserAuthenticated(for: .standard)).to(beFalse())
                        expect(service.isUserAuthenticated(for: auth)).to(beFalse())
                        asyncTrigger.trigger()
                    }
                }
                expect(asyncTrigger.hasTriggered).toEventually(beTrue())
            }
        }
        
        describe("resetting user authentication for a single auth type") {
            
            it("resets a single state") {
                let auth = Authentication(id: "another-auth")
                service.authenticateUser(for: .standard, reason: "") { _ in
                    service.authenticateUser(for: auth, reason: "") { _ in
                        expect(service.isUserAuthenticated(for: .standard)).to(beTrue())
                        expect(service.isUserAuthenticated(for: auth)).to(beTrue())
                        service.resetUserAuthentication(for: .standard)
                        expect(service.isUserAuthenticated(for: .standard)).to(beFalse())
                        expect(service.isUserAuthenticated(for: auth)).to(beTrue())
                        asyncTrigger.trigger()
                    }
                }
                expect(asyncTrigger.hasTriggered).toEventually(beTrue())
            }
        }
    }
}

private enum TestError: Error, Equatable { case failure }
