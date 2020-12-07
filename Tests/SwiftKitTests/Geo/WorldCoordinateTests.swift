//
//  WorldCoordinateTests.swift
//  iExtraTests
//
//  Created by Daniel Saidi on 2018-10-19.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import CoreLocation
import SwiftKit

class WorldCoordinateTests: QuickSpec {
    
    override func spec() {
        
        describe("world coordinate") {
            
            func validate(_ coordinate: WorldCoordinate, _ lat: CLLocationDegrees, _ long: CLLocationDegrees) -> Bool {
                let coord = coordinate.coordinate
                return coord.latitude == lat && coord.longitude == long
            }
            
            it("has valid coordinate") {
                expect(validate(.manhattan, 40.7590615, -73.969231)).to(beTrue())
                expect(validate(.newYork, 40.7033127, -73.979681)).to(beTrue())
                expect(validate(.sanFrancisco, 37.7796828, -122.4000062)).to(beTrue())
                expect(validate(.tokyo, 35.673, 139.710)).to(beTrue())
            }
        }
    }
}
