//
//  KeychainScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-12-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct KeychainScreen: View {
 
    var body: some View {
        DemoList("Keychain") {
            Section(header: Text("About")) {
                DemoListText("SwiftKit has utils that simplify working with the device keychain.")
            }
            
            Section(header: Text("Services")) {
                DemoListLink("Keychain Service", .key, KeychainServiceScreen())
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
