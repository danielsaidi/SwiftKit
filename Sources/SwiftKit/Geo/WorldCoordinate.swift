//
//  WorldCoordinate.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2015-10-04.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import CoreLocation

/**
 This struct can be used to represent world coordinates, but
 without bloating `CLLocationCoordinate2D` with static props.
 
 The reason to why this is a struct and not an enum, is that
 it simplifies extending it with new coordinates in any apps
 that use custom coordinates.
 */
public struct WorldCoordinate: Identifiable, Hashable {
    
    public var id: String { name }
    
    /**
     The name of the coordinate.
     */
    public let name: String
    
    /**
     The coordinate value.
     */
    public let coordinate: CLLocationCoordinate2D
    
    public static func == (lhs: WorldCoordinate, rhs: WorldCoordinate) -> Bool {
        lhs.name == rhs.name
            && lhs.coordinate.latitude == rhs.coordinate.latitude
            && lhs.coordinate.longitude == rhs.coordinate.longitude
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

public extension WorldCoordinate {
    
    static var manhattan: WorldCoordinate = .init(name: "Manhattan", coordinate: CLLocationCoordinate2D(latitude: 40.7590615, longitude: -73.969231))
    static var newYork: WorldCoordinate = .init(name: "New York", coordinate: CLLocationCoordinate2D(latitude: 40.7033127, longitude: -73.979681))
    static var sanFrancisco: WorldCoordinate = .init(name: "San Francisco", coordinate: CLLocationCoordinate2D(latitude: 37.7796828, longitude: -122.4000062))
    static var tokyo: WorldCoordinate = .init(name: "Tokyo", coordinate: CLLocationCoordinate2D(latitude: 35.673, longitude: 139.710))
}
