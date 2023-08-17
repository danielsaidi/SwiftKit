//
//  ExternalMapService.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2015-02-18.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import CoreLocation

@available(*, deprecated, message: "Use MKMapItem openInMaps instead")
public protocol ExternalMapService {
    
    func getUrl(for coordinate: CLLocationCoordinate2D) -> URL?
    func getUrl(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D) -> URL?
}
