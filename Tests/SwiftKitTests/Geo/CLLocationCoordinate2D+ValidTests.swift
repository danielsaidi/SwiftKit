//
//  CLLocationCoordinate2D+ValidTests.swift
//  SwiftKitTests
//
//  Created by Daniel Saidi on 2018-10-19.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import SwiftKit
import CoreLocation

class CLLocationCoordinate2D_ValidTests: QuickSpec {
    
    override func spec() {
        
        describe("Coordinate validation") {
            
            func result(for lat: CLLocationDegrees, _ long: CLLocationDegrees) -> Bool {
                CLLocationCoordinate2D(latitude: lat, longitude: long).isValid
            }
            
            it("is invalid if latitude is invalid") {
                expect(result(for: 0, 120)).to(beFalse())
                expect(result(for: 180, 120)).to(beFalse())
                expect(result(for: -180, 120)).to(beFalse())
            }
            
            it("is invalid if longitude is invalid") {
                expect(result(for: 120, 0)).to(beFalse())
                expect(result(for: 120, 180)).to(beFalse())
                expect(result(for: 120, -180)).to(beFalse())
            }
            
            it("is valid if both components are valid") {
                expect(result(for: 120, 120)).to(beTrue())
            }
        }
    }
}
