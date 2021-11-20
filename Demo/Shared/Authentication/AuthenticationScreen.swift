//
//  AuthenticationScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-29.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(macOS)
import SwiftUI
import SwiftUIKit

struct AuthenticationScreen: View {
 
    var body: some View {
        List {
            Section {
                ListText("SwiftKit has auth services that simplifies using biometric authentication.")
            }
            
            Section(header: Text("Services")) {
                ListNavigationLink(destination: BiometricAuthenticationServiceScreen()) {
                    Label("Biometric Authentication", image: .authentication)
                }
                ListNavigationLink(destination: CachedAuthenticationServiceProxyScreen()) {
                    Label("Cached Authentication", image: .data)
                }
            }
        }.navigationTitle("Authentication")
    }
}

struct AuthenticationScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AuthenticationScreen()
        }
    }
}
#endif
