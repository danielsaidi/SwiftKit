//
//  CLLocationCoordinate2D+Equatable.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2021-09-08.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import CoreLocation

extension CLLocationCoordinate2D: Equatable {
    
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}
