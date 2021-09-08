//
//  HttpMethodTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2020-10-25.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import SwiftKit

class HttpMethodTests: QuickSpec {
    
    override func spec() {
        
        describe("method") {
            
            func result(for method: HttpMethod) -> String {
                method.method
            }
            
            it("is correct for all cases") {
                expect(result(for: .connect)).to(equal("CONNECT"))
                expect(result(for: .delete)).to(equal("DELETE"))
                expect(result(for: .get)).to(equal("GET"))
                expect(result(for: .head)).to(equal("HEAD"))
                expect(result(for: .options)).to(equal("OPTIONS"))
                expect(result(for: .post)).to(equal("POST"))
                expect(result(for: .put)).to(equal("PUT"))
                expect(result(for: .trace)).to(equal("TRACE"))
            }
        }
    }
}
