//
//  KeychainScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-12-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct KeychainScreen: View {
 
    var body: some View {
        List {
            Section {
                ListText("SwiftKit has utils that simplify working with the device keychain.")
            }
            
            Section(header: Text("Services")) {
                ListNavigationLink(destination: KeychainServiceScreen()) {
                    Label("Keychain Service", image: .key)
                }
            }
        }.navigationTitle("Keychain")
    }
}

struct KeychainScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            KeychainScreen()
        }
    }
}
