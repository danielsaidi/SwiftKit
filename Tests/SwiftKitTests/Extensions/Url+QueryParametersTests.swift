//
//  Url+QueryParametersTests.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-12-12.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation
import Quick
import Nimble
import SwiftKit

class Url_QueryParametersTests: QuickSpec {
    
    override func spec() {
        
        describe("url") {
            
            describe("query parameters property") {
                
                it("handles zero query parameter") {
                    let url = URL(string: "http://foo.bar/home")!
                    let result = url.queryParameters
                    expect(result.count).to(equal(0))
                }
                
                it("handles single query parameter") {
                    let url = URL(string: "http://foo.bar/home?p1=v1")!
                    let result = url.queryParameters
                    expect(result.count).to(equal(1))
                    expect(result.first!.name).to(equal("p1"))
                    expect(result.first!.value).to(equal("v1"))
                }
                
                it("handles multi query parameters") {
                    let url = URL(string: "http://foo.bar/home?p1=v1&p2=v2")!
                    let result = url.queryParameters
                    expect(result.count).to(equal(2))
                    expect(result[0].name).to(equal("p1"))
                    expect(result[0].value).to(equal("v1"))
                    expect(result[1].name).to(equal("p2"))
                    expect(result[1].value).to(equal("v2"))
                }
                
                it("handles encoded query parameters") {
                    let url = URL(string: "http://foo.bar/home?p1=me%20%26%20you&p2=%C3%A5%C3%A4%C3%B6%C3%85%C3%84%C3%96")!
                    let result = url.queryParameters
                    expect(result.count).to(equal(2))
                    expect(result[0].name).to(equal("p1"))
                    expect(result[0].value).to(equal("me & you"))
                    expect(result[1].name).to(equal("p2"))
                    expect(result[1].value).to(equal("åäöÅÄÖ"))
                }
            }
            
            
            
            describe("query parameters dictionary") {
                
                it("handles zero query parameter") {
                    let url = URL(string: "http://foo.bar/home")!
                    let result = url.queryParametersDictionary
                    expect(result.count).to(equal(0))
                }
                
                it("handles single query parameter") {
                    let url = URL(string: "http://foo.bar/home?p1=v1")!
                    let result = url.queryParametersDictionary
                    expect(result.count).to(equal(1))
                    expect(result["p1"]).to(equal("v1"))
                }
                
                it("handles multi query parameters") {
                    let url = URL(string: "http://foo.bar/home?p1=v1&p2=v2")!
                    let result = url.queryParametersDictionary
                    expect(result.count).to(equal(2))
                    expect(result["p1"]).to(equal("v1"))
                    expect(result["p2"]).to(equal("v2"))
                }
                
                it("handles encoded query parameters") {
                    let url = URL(string: "http://foo.bar/home?p1=me%20%26%20you&p2=%C3%A5%C3%A4%C3%B6%C3%85%C3%84%C3%96")!
                    let result = url.queryParametersDictionary
                    expect(result.count).to(equal(2))
                    expect(result["p1"]).to(equal("me & you"))
                    expect(result["p2"]).to(equal("åäöÅÄÖ"))
                }
            }
            
            
            
            describe("getting single query parameter") {
                
                it("returns nil for no query parameters in url") {
                    let url = URL(string: "http://foo.bar/home")!
                    let result = url.queryParameter(named: "foo")
                    expect(result).to(beNil())
                }
                
                it("returns nil for no matching query parameter") {
                    let url = URL(string: "http://foo.bar/home?foo=bar")!
                    let result = url.queryParameter(named: "bar")
                    expect(result).to(beNil())
                }
                
                it("return query parameter with case-insensitive mathcing name") {
                    let url = URL(string: "http://foo.bar/home?fOO=bar")!
                    let result = url.queryParameter(named: "foo")
                    expect(result?.name).to(equal("fOO"))
                    expect(result?.value).to(equal("bar"))
                }
            }
            
            
            
            describe("setting single query parameter") {
                
                it("adds first parameter") {
                    let url = URL(string: "http://foo.bar/home")!
                    let result = url.setQueryParameter(name: "foo", value: "bar")!.absoluteString
                    expect(result).to(equal("http://foo.bar/home?foo=bar"))
                }
                
                it("adds new parameter") {
                    let url = URL(string: "http://foo.bar/home?foo=bar")!
                    let result = url.setQueryParameter(name: "baz", value: "123")!.absoluteString
                    expect(result).to(contain("http://foo.bar/home?", "foo=bar", "baz=123"))
                }
                
                it("overwrites existing parameter") {
                    let url = URL(string: "http://foo.bar/home?foo=bar")!
                    let result = url.setQueryParameter(name: "foo", value: "baz")!.absoluteString
                    expect(result).to(equal("http://foo.bar/home?foo=baz"))
                }
                
                it("overwrites existing parameter with different casing") {
                    let url = URL(string: "http://foo.bar/home?fOO=bar")!
                    let result = url.setQueryParameter(name: "FOO", value: "baz")!.absoluteString
                    expect(result).to(equal("http://foo.bar/home?fOO=baz"))
                }
                
                it("encodes parameter value") {
                    let url = URL(string: "http://foo.bar/home?foo=bar")!
                    let result = url.setQueryParameter(name: "p1", value: "me & you")!.absoluteString
                    expect(result).to(contain("http://foo.bar/home?", "foo=bar", "p1=me%20%26%20you"))
                }
            }
            
            
            
            describe("setting multiple query parameters") {
                
                it("adds first parameters") {
                    let url = URL(string: "http://foo.bar/home")!
                    let result = url.setQueryParameters(["p1": "v1"])!.absoluteString
                    expect(result).to(equal("http://foo.bar/home?p1=v1"))
                }
                
                it("adds new parameters") {
                    let url = URL(string: "http://foo.bar/home?foo=bar")!
                    let result = url.setQueryParameters(["p1": "v1"])!.absoluteString
                    expect(result).to(contain("http://foo.bar/home?", "foo=bar", "p1=v1"))
                }
                
                it("overwrites existing parameter") {
                    let url = URL(string: "http://foo.bar/home?foo=bar")!
                    let result = url.setQueryParameters(["foo": "v1"])!.absoluteString
                    expect(result).to(equal("http://foo.bar/home?foo=v1"))
                }
                
                it("overwrites existing parameters") {
                    let url = URL(string: "http://foo.bar/home?p1=v1&p2=v2")!
                    let result = url.setQueryParameters(["p1": "v3", "p2": "v4"])!.absoluteString
                    expect(result).to(contain("http://foo.bar/home?", "p1=v3", "p2=v4"))
                }
                
                it("encodes parameter values") {
                    let url = URL(string: "http://foo.bar/home?foo=bar")!
                    let result = url.setQueryParameters(["foo": "åä& ö"])!.absoluteString
                    expect(result).to(equal("http://foo.bar/home?foo=%C3%A5%C3%A4%26%20%C3%B6"))
                }
            }
        }
    }
}
