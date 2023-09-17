//
//  CLLocationCoordinate2D+Valid.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2015-09-18.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import CoreLocation

public extension CLLocationCoordinate2D {
    
    /**
     Check if the coordinate is valid. This is a best effort
     check that both lat and long are not or any extremes.
     */
    var isValid: Bool {
        isValid(latitude) && isValid(longitude)
    }
}

private extension CLLocationCoordinate2D {

    func isValid(_ degrees: CLLocationDegrees) -> Bool {
        degrees != 0 && degrees != 180 && degrees != -180
    }
}
