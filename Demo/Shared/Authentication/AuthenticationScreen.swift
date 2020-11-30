//
//  AuthenticationScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-29.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(macOS)
import SwiftUI

struct AuthenticationScreen: View {
 
    var body: some View {
        DemoList("Authentication") {
            Section(header: Text("About")) {
                DemoListText("SwiftKit has auth services that simplifies using biometric authentication.")
            }
            
            Section(header: Text("Services")) {
                DemoListLink("Biometric Authentication", .authentication, BiometricAuthenticationServiceScreen())
                DemoListLink("Cached Authentication", .data, CachedAuthenticationServiceProxyScreen())
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
