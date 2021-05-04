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
        
        describe("post params string") {
            
            it("url encodes values") {
                let str = route.postParamsString
                expect(str).to(equal("baz?=BAM%3F&foo&=bar%26"))
            }
        }
        
        describe("form data request") {
        
            it("is correctly configured") {
                let req = route.formDataRequest(for: env)
                let expectedData = "baz?=BAM%3F&foo&=bar%26".data(using: .utf8)
                expect(req.url?.absoluteString).to(equal("http://example.com/1/2/3?anyone?=there?&hello%26=world%26"))
                expect(req.allHTTPHeaderFields?["Content-Type"]).to(equal("application/x-www-form-urlencoded"))
                expect(req.httpBody).to(equal(expectedData))
            }
        }
        
        describe("query items") {
        
            it("are mapped query params without url encoding") {
                let items = route.queryItems.sorted { $0.name < $1.name }
                expect(items.count).to(equal(2))
                expect(items[0].name).to(equal("anyone?"))
                expect(items[0].value).to(equal("there?"))
                expect(items[1].name).to(equal("hello&"))
                expect(items[1].value).to(equal("world&"))
            }
        }
        
        describe("data request") {
        
            it("is correctly configured") {
                let req = route.request(for: env)
                expect(req.url?.absoluteString).to(equal("http://example.com/1/2/3?anyone?=there?&hello%26=world%26"))
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

private struct TestEnvironment: ApiEnvironment {
    
    var url: URL {
        guard let url = URL(string: "http://example.com") else { fatalError() }
        return url
    }
}

private struct TestRoute: ApiRoute {
    
    var path: String { "1/2/3" }
    var postData: Data? { nil }
    var postParams: [String: String] { ["foo&": "bar&", "baz?": "BAM?"] }
    var queryParams: [String: String] { ["hello&": "world&", "anyone?": "there?"] }
    var urlEncodeParams: Bool { true }
}
