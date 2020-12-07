//
//  DeviceScreen.swift
//  Demo (iOS)
//
//  Created by Daniel Saidi on 2020-12-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct DeviceScreen: View {
    
    var body: some View {
        DemoList("Device") {
            Section(header: Text("About")) {
                DemoListText("SwiftKit has device utils for e.g. generating a unique id for the current device.")
            }
            
            Section(header: Text("Services")) {
                DemoListLink("Device Identifier", .device, DeviceIdentifierScreen())
            }
        }
    }
}

struct DeviceScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DeviceScreen()
        }
    }
}
