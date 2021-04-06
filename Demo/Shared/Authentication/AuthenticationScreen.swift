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
        MenuList("Authentication") {
            Section(header: Text("About")) {
                MenuListText("SwiftKit has auth services that simplifies using biometric authentication.")
            }
            
            Section(header: Text("Services")) {
                MenuListItem(icon: .authentication, title: "Biometric Authentication")
                    .navigationLink(to: BiometricAuthenticationServiceScreen())
                MenuListItem(icon: .data, title: "Cached Authentication")
                    .navigationLink(to: CachedAuthenticationServiceProxyScreen())
            }
        }
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
