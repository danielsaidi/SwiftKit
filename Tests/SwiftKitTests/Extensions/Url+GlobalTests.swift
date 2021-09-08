//
//  Url+GlobalTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2012-08-31.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation
import Quick
import Nimble
import SwiftKit

class Url_GlobalTests: QuickSpec {
    
    override func spec() {
        
        describe("global urls") {
            
            describe("app store url") {
                
                it("is valid") {
                    let url = URL.appStoreUrl(forAppId: 123)
                    expect(url?.absoluteString).to(equal("https://itunes.apple.com/app/id\(123)"))
                }
            }
            
            describe("user subscriptions url") {
                
                it("is valid") {
                    let url = URL.userSubscriptions
                    expect(url?.absoluteString).to(equal("https://apps.apple.com/account/subscriptions"))
                }
            }
        }
    }
}
