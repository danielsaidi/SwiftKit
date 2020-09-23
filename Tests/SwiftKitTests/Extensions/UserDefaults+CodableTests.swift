//
//  UserDefaults+CodableTests.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-09-23.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation
import Quick
import Nimble
import SwiftKit

class UserDefaults_CodableTets: QuickSpec {
    
    override func spec() {
        
        var defaults: UserDefaults!
        let key = "user"
        
        beforeEach {
            defaults = UserDefaults.standard
        }
        
        afterEach {
            defaults.removeObject(forKey: key)
        }
        
        describe("getting codable") {
            
            it("returns nil if no data is persisted") {
                let result: User? = defaults.codable(forKey: key)
                expect(result).to(beNil())
            }
            
            it("returns nil if invalid data is persisted") {
                defaults.set("HEJ", forKey: key)
                let result: User? = defaults.codable(forKey: key)
                expect(result).to(beNil())
            }
            
            it("returns correctly persisted data") {
                let user = User(name: "Daniel", age: 40)
                defaults.setCodable(user, forKey: key)
                let result: User = defaults.codable(forKey: key)!
                expect(result).to(equal(user))
            }
        }
    }
}

private struct User: Codable, Equatable {
    
    let name: String
    let age: Int
}
