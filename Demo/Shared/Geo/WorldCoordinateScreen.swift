//
//  WorldCoordinateScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-12-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import MapKit
import SwiftUI

struct WorldCoordinateScreen: View {
    
    @State private var coordinate = WorldCoordinate.manhattan
    
    private var mapRegion: MKCoordinateRegion {
        MKCoordinateRegion(center: coordinate.coordinate, latitudinalMeters: 10_000, longitudinalMeters: 10_000)
    }
    
    private var coordinates: [WorldCoordinate] {
        [.manhattan,.newYork, .sanFrancisco, .tokyo]
    }
    
    var body: some View {
        DemoList("World Coordinates") {
            Section(header: Text("About")) {
                DemoListText("SwiftKit has a world coordinate struct with static coordinate properties.")
            }
            
            Section(header: Text("Coordinate")) {
                Picker("Pick Coordinate", selection: $coordinate) {
                    ForEach(coordinates) {
                        Text($0.name).tag($0)
                    }
                }
            }
            
            Section(header: Text("Result")) {
                Map(coordinateRegion: .constant(mapRegion))
                    .frame(height: 250)
            }
        }
    }
}

struct WorldCoordinateScreen_Previews: PreviewProvider {
    static var previews: some View {
        WorldCoordinateScreen()
    }
}
