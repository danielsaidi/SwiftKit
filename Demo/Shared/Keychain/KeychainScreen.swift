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
        MenuList("Keychain") {
            Section(header: Text("About")) {
                MenuListText("SwiftKit has utils that simplify working with the device keychain.")
            }
            
            Section(header: Text("Services")) {
                MenuListItem(icon: .key, title: "Keychain Service")
                    .navigationLink(to: KeychainServiceScreen())
            }
        }
    }
}

struct KeychainScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            KeychainScreen()
        }
    }
}
