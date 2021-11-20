//
//  DeviceScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-12-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct DeviceScreen: View {
    
    var body: some View {
        List {
            Section {
                ListText("SwiftKit has device utils for e.g. generating a unique id for the current device.")
            }
            
            Section(header: Text("Services")) {
                ListNavigationLink(destination: DeviceIdentifierScreen()) {
                    Label("Device Identifier", image: .device)
                }   
            }
        }.navigationTitle("Device")
    }
}

struct DeviceScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DeviceScreen()
        }
    }
}
