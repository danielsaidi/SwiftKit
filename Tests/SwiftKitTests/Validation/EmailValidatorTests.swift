//
//  PerformAsyncTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2020-06-09.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import SwiftKit

class EmailValidatorTests: QuickSpec {
    
    override func spec() {
        
        describe("email validator") {
            
            let validate = EmailValidator().validate
            
            context("when validating validating valid addresses") {
                
                it("validates valid email addresses") {
                    expect(validate("foobar@baz.com")).to(beTrue())
                    expect(validate("foo1.bar2@baz.com")).to(beTrue())
                    expect(validate("foo.bar@gmail.com")).to(beTrue())
                }
                
                it("validates long top domains") {
                    expect(validate("foobar@baz.co")).to(beTrue())
                    expect(validate("foobar@baz.com")).to(beTrue())
                    expect(validate("foo1.bar2@baz.comm")).to(beTrue())
                    expect(validate("foo.bar@gmail.commmmmmmmmmmmmmmm")).to(beTrue())
                }
            }
            
            context("when validating invalid addresses") {
                
                it("does not validate invalid email addresses") {
                    expect(validate("foobar")).to(beFalse())
                    expect(validate("foo1.bar2@")).to(beFalse())
                    expect(validate("foo.bar@gmail")).to(beFalse())
                }
                
                it("does not validate too short top domains") {
                    expect(validate("foobar@baz.c")).to(beFalse())
                }
            }
        }
    }
}
