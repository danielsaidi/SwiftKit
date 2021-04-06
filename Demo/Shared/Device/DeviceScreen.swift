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
        MenuList("Device") {
            Section(header: Text("About")) {
                MenuListText("SwiftKit has device utils for e.g. generating a unique id for the current device.")
            }
            
            Section(header: Text("Services")) {
                MenuListItem(icon: .device, title: "Device Identifier")
                    .navigationLink(to: DeviceIdentifierScreen())
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
