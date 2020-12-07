//
//  GeoScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-12-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct GeoScreen: View {
 
    var body: some View {
        DemoList("Geo") {
            Section(header: Text("About")) {
                DemoListText("SwiftKit has geo utils that simplifies working with maps and coordinates.")
            }
            
            Section(header: Text("Utils")) {
                DemoListLink("External Map Services", .map, ExternalMapServicesScreen())
                DemoListLink("World Coordinates", .pin, WorldCoordinateScreen())
            }
        }
    }
}

struct GeoScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GeoScreen()
        }
    }
}
