//
//  ApiRouteTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2020-10-25.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Foundation
import SwiftKit

class ApiRouteTests: QuickSpec {
    
    override func spec() {
        
        describe("url in environment") {
        
            it("appends path to environment url") {
                let env = TestEnvironment()
                let route = TestRoute()
                let url = route.url(in: env).absoluteString
                expect(url).to(equal("http://example.com/1/2/3"))
            }
        }
    }
}

private class TestEnvironment: ApiEnvironment {
    
    var url: URL {
        guard let url = URL(string: "http://example.com") else { fatalError() }
        return url
    }
}

private class TestRoute: ApiRoute {
    
    var path: String { "1/2/3" }
    var queryParams: [String : String] { ["hello": "world"] }
}
