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
        
        let env = TestEnvironment()
        let route = TestRoute()
        
        describe("form data string") {
        
            it("is correctly configured") {
                let str = route.formDataString
                expect(str).to(equal("anyone?=there?&hello=world"))
            }
        }
        
        describe("query items") {
        
            it("are mapped query params") {
                let items = route.queryItems.sorted { $0.name < $1.name }
                expect(items.count).to(equal(2))
                expect(items[0].name).to(equal("anyone?"))
                expect(items[0].value).to(equal("there?"))
                expect(items[1].name).to(equal("hello"))
                expect(items[1].value).to(equal("world"))
            }
        }
        
        describe("form data request") {
        
            it("is correctly configured") {
                let req = route.formDataRequest(for: env)
                let expectedData = "anyone?=there?&hello=world".data(using: .utf8)
                expect(req.url?.absoluteString).to(equal("http://example.com/1/2/3?anyone?=there?&hello=world"))
                expect(req.allHTTPHeaderFields?["Content-Type"]).to(equal("application/x-www-form-urlencoded"))
                expect(req.httpBody).to(equal(expectedData))
            }
        }
        
        describe("data request") {
        
            it("is correctly configured") {
                let req = route.request(for: env)
                expect(req.url?.absoluteString).to(equal("http://example.com/1/2/3?anyone?=there?&hello=world"))
                expect(req.allHTTPHeaderFields?["Content-Type"]).to(equal("application/json"))
            }
        }
        
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
    var queryParams: [String: String] { ["hello": "world", "anyone?": "there?"] }
}
