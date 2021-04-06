//
//  ExternalMapServicesScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-12-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftKit
import SwiftUI
import SwiftUIKit

struct ExternalMapServicesScreen: View {
    
    @State private var coordinate = WorldCoordinate.manhattan
    
    private let appleMaps = AppleMapsService()
    private let googleMaps = GoogleMapsService()
    
    private var coordinates: [WorldCoordinate] {
        [.manhattan,.newYork, .sanFrancisco, .tokyo]
    }
    
    var body: some View {
        MenuList("External Maps") {
            Section(header: Text("About")) {
                MenuListText("SwiftKit has external maps services that let you show a coordinate or trigger a navigation in an external map app.")
            }
            
            Section(header: Text("Coordinate")) {
                Picker("Pick Coordinate", selection: $coordinate) {
                    ForEach(coordinates) {
                        Text($0.name).tag($0)
                    }
                }
            }
            
            Section(header: Text("Actions")) {
                MenuListItem(icon: .pin, title: "Open in Apple Maps")
                    .button(action: showInAppleMaps)
                MenuListItem(icon: .pin, title: "Open in Google Maps")
                    .button(action: showInGoogleMaps)
            }
        }
    }
}

private extension ExternalMapServicesScreen {
    
    func showInAppleMaps() {
        open(appleMaps.getUrl(for: coordinate.coordinate))
    }
    
    func showInGoogleMaps() {
        open(googleMaps.getUrl(for: coordinate.coordinate))
    }
    
    func open(_ url: URL?) {
        guard let url = url else { return }
        #if os(iOS) || os(tvOS)
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        #elseif os(macOS)
        NSWorkspace.shared.open(url)
        #endif
    }
}

struct ExternalMapServicesScreen_Previews: PreviewProvider {
    static var previews: some View {
        ExternalMapServicesScreen()
    }
}
