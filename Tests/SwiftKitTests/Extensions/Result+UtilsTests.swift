//
//  Result+UtilsTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2020-06-02.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation
import Quick
import Nimble
import SwiftKit

class Result_UtilsTests: QuickSpec {
    
    override func spec() {
        
        let success = Result<Bool, Error>.success(true)
        let failure = Result<Bool, TestError>.failure(.kaboom)
        
        describe("failureError") {
            
            it("is only set for failure results") {
                expect(success.failureError).to(beNil())
                expect(failure.failureError).to(equal(.kaboom))
            }
        }
        
        describe("is failure") {
            
            it("is only true for failure results") {
                expect(success.isFailure).to(beFalse())
                expect(failure.isFailure).to(beTrue())
            }
        }
        
        describe("is success") {
            
            it("is only true for success results") {
                expect(success.isSuccess).to(beTrue())
                expect(failure.isSuccess).to(beFalse())
            }
        }
        
        describe("successResult") {
            
            it("is only set for success results") {
                expect(success.successResult).to(beTrue())
                expect(failure.successResult).to(beNil())
            }
        }
    }
}

private enum TestError: Error {
    
    case kaboom
}
