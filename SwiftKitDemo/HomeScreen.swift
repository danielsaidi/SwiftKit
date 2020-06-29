//
//  ContentView.swift
//  SwiftKitDemo
//
//  Created by Daniel Saidi on 2020-04-28.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct HomeScreen: View {
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Authentication", destination: AuthenticationScreen())
                NavigationLink("Coding", destination: CodingScreen())
                NavigationLink("Device", destination: DeviceScreen())
                NavigationLink("Extensions", destination: ExtensionsScreen())
                NavigationLink("IoC", destination: IoCScreen())
                NavigationLink("Keychain", destination: KeychainScreen())
            }.navigationBarTitle("SwiftKit")
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeScreen()
    }
}
