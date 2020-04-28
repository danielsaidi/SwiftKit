//
//  CachedAuthenticationServiceProxyTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2020-04-28.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Mockery
@testable import SwiftKit

class CachedAuthenticationServiceProxyTests: QuickSpec {
    
    override func spec() {
        
        var service: CachedAuthenticationServiceProxy!
        var mock: MockAuthenticationService!
        let auth = Authentication(id: "test-auth")
        var asyncTrigger: AsyncTrigger!
        
        beforeEach {
            mock = MockAuthenticationService()
            service = CachedAuthenticationServiceProxy(baseService: mock)
            mock.registerResult(for: service.canAuthenticate) { _ in true }
            asyncTrigger = AsyncTrigger()
        }
        
        describe("authorizing auth") {
            
            afterEach {
                expect(asyncTrigger.hasTriggered).toEventually(beTrue())
                expect(mock.hasInvoked(mock.authenticate, numberOfTimes: 1)).to(beTrue())
            }
            
            it("aborts with success if service is already authenticated") {
                mock.authResult = true
                service.authenticate(auth, reason: "") { _ in
                    service.authenticate(auth, reason: "") { result in
                        expect(result.isSuccess).to(beTrue())
                        expect(result.successResult).to(beTrue())
                        asyncTrigger.trigger()
                    }
                }
            }
            
            it("aborts with mocked error") {
                mock.authError = TestError.failure
                service.authenticate(auth, reason: "") { result in
                    expect(result.isFailure).to(beTrue())
                    expect(result.failureError as? TestError).to(equal(.failure))
                    asyncTrigger.trigger()
                }
            }
            
            it("completes with mocked failure") {
                mock.authResult = false
                service.authenticate(auth, reason: "") { result in
                    expect(result.isSuccess).to(beTrue())
                    expect(result.successResult).to(beFalse())
                    asyncTrigger.trigger()
                }
            }
            
            it("completes with operation success") {
                mock.authResult = true
                service.authenticate(auth, reason: "") { result in
                    expect(result.isSuccess).to(beTrue())
                    expect(result.successResult).to(beTrue())
                    asyncTrigger.trigger()
                }
            }
        }
        
        describe("can authenticate auth") {
            
            it("returns mocked result") {
                mock.registerResult(for: mock.canAuthenticate) { _ in true }
                expect(service.canAuthenticate(auth)).to(beTrue())
                mock.registerResult(for: mock.canAuthenticate) { _ in false }
                expect(service.canAuthenticate(auth)).to(beFalse())
            }
        }
        
        describe("is already authenticated") {
            
            afterEach {
                expect(asyncTrigger.hasTriggered).toEventually(beTrue())
            }
            
            it("is false before an authentication attempt") {
                expect(service.isAlreadyAuthenticated(for: auth)).to(beFalse())
                service.authenticate(auth, reason: "") { _ in
                    asyncTrigger.trigger()
                }
            }
            
            it("is false after a failed authentication") {
                mock.authResult = false
                service.authenticate(auth, reason: "") { result in
                    expect(service.isAlreadyAuthenticated(for: auth)).to(beFalse())
                    asyncTrigger.trigger()
                }
            }
            
            it("is true after a successful authentication") {
                mock.authResult = true
                service.authenticate(auth, reason: "") { result in
                    expect(service.isAlreadyAuthenticated(for: auth)).to(beTrue())
                    asyncTrigger.trigger()
                }
            }
            
            it("becomes false when authentication cache is reset") {
                mock.authResult = true
                service.authenticate(auth, reason: "") { result in
                    expect(service.isAlreadyAuthenticated(for: auth)).to(beTrue())
                    service.resetAuthenticationCache(for: auth)
                    expect(service.isAlreadyAuthenticated(for: auth)).to(beFalse())
                    asyncTrigger.trigger()
                }
            }
        }
        
        describe("resetting authentication cache") {
            
            it("resets an active authentication") {
                mock.authResult = true
                service.authenticate(auth, reason: "") { result in
                    expect(service.isAlreadyAuthenticated(for: auth)).to(beTrue())
                    service.resetAuthenticationCache(for: auth)
                    expect(service.isAlreadyAuthenticated(for: auth)).to(beFalse())
                    asyncTrigger.trigger()
                }
                expect(asyncTrigger.hasTriggered).toEventually(beTrue())
            }
        }
    }
}

private enum TestError: Error, Equatable { case failure }
