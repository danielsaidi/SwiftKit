//
//  GeoScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-12-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct GeoScreen: View {
    
    var body: some View {
        List {
            Section {
                ListText("SwiftKit has geo utils that simplifies working with maps and coordinates.")
            }
            
            Section(header: Text("Utils")) {
                ListNavigationLink(destination: ExternalMapServicesScreen()) {
                    Label("External Map Services", image: .map)
                }
                ListNavigationLink(destination: WorldCoordinateScreen()) {
                    Label("World Coordinates", image: .pin)
                }
            }
        }.navigationTitle("Geo")
    }
}

struct GeoScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GeoScreen()
        }
    }
}
