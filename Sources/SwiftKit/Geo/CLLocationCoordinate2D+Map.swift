//
//  CLLocationCoordinate2D+Map.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2023-08-17.
//  Copyright © 2023 Daniel Saidi. All rights reserved.
//

import Foundation
import MapKit

public extension CLLocationCoordinate2D {
    
    /// Create a map coordinate region.
    func mapCoordinateRegion(
        withSpanInMeters meters: Double
    ) -> MKCoordinateRegion {
        .init(
            center: self,
            latitudinalMeters: meters,
            longitudinalMeters: meters
        )
    }
    
    /// Create a map item with a certain name.
    func mapItem(
        withName name: String
    ) -> MKMapItem {
        let mapItem = MKMapItem(placemark: mapPlacemark())
        mapItem.name = name
        return mapItem
    }
    
    /// Create a map placemark.
    func mapPlacemark() -> MKPlacemark {
        .init(
            coordinate: self,
            addressDictionary: nil
        )
    }
    
    /// Create launch options for the external Maps app.
    func mapsLaunchOptions(
        withRegionSpanInMeters meters: Double
    ) -> [String: Any] {
        let region = mapCoordinateRegion(withSpanInMeters: meters)
        return [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: region.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: region.span)
        ]
    }
    
    /// Open the coordinate in Maps
    func openInMaps(
        withName name: String,
        regionSpanInMeters meters: Double = 1_000
    ) {
        let item = mapItem(withName: name)
        let options = mapsLaunchOptions(withRegionSpanInMeters: meters)
        item.openInMaps(launchOptions: options)
    }
}
