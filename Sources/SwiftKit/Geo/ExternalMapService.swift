//
//  ExternalMapService.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2015-02-18.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import CoreLocation

/**
 This protocol can be implemented by services that provide a
 set of urls to coordinates or navigation paths, that can be
 opened in an external map application.
 */
public protocol ExternalMapService {
    
    /**
     Get the external url of a certain coordinate.
     */
    func getUrl(for coordinate: CLLocationCoordinate2D) -> URL?
    
    /**
     Get the external url of a certain navigation.
     */
    func getUrl(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D) -> URL?
}
