//
//  AuthenticationTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2020-04-29.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import MockingKit
@testable import SwiftKit

class AuthenticationTests: QuickSpec {
    
    override func spec() {
        
        describe("standard authentication") {
            
            it("is correctly configured") {
                let auth = Authentication.standard
                expect(auth.id).to(equal("com.swiftkit.auth.any"))
            }
        }
    }
}
