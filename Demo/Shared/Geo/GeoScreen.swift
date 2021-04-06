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
        MenuList("Geo") {
            Section(header: Text("About")) {
                MenuListText("SwiftKit has geo utils that simplifies working with maps and coordinates.")
            }
            
            Section(header: Text("Utils")) {
                MenuListItem(icon: .map, title: "External Map Services")
                    .navigationLink(to: ExternalMapServicesScreen())
                MenuListItem(icon: .pin, title: "World Coordinates")
                    .navigationLink(to: WorldCoordinateScreen())
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
