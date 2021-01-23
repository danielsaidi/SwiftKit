//
//  AppleMapsService.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2015-02-18.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import CoreLocation

public class AppleMapsService: ExternalMapService {
    
    public init() {}
    
    public func getUrl(for coordinate: CLLocationCoordinate2D) -> URL? {
        let string = "http://maps.apple.com/maps?ll=\(coordinate.latitude),\(coordinate.longitude)"
        return URL(string: string)
    }
    
    public func getUrl(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D) -> URL? {
        let string = "http://maps.apple.com/maps?saddr=\(from.latitude),\(from.longitude)&daddr=\(to.latitude),\(to.longitude)"
        return URL(string: string)
    }
}
