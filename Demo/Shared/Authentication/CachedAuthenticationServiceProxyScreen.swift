//
//  CachedAuthenticationServiceProxyScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-29.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(macOS)
import SwiftKit
import SwiftUI
import SwiftUIKit

struct CachedAuthenticationServiceProxyScreen: View {
    
    private let service: CachedAuthenticationService = CachedAuthenticationServiceProxy(
        baseService: BiometricAuthenticationService())
    
    @StateObject private var alertContext = AlertContext()
    
    var body: some View {
        MenuList("Cached Auth") {
            Section {
                MenuListText("CachedAuthenticationServiceProxy wraps another service and stores its latest result.")
            }
            
            Section(header: Text("Actions")) {
                MenuListItem(icon: .authentication, title: "Perform authentication")
                    .button(action: performAuthentication)
                MenuListItem(icon: .clear, title: "Clear authentication")
                    .button(action: resetAuthentication)
            }
        }.alert(context: alertContext)
    }
}

private extension CachedAuthenticationServiceProxyScreen {
    
    func alert(_ text: String) {
        let alert = Alert(title: Text(text))
        DispatchQueue.main.asyncAfter(1.0) {
            alertContext.present(alert)
        }
    }
    
    func handleAuthResult(_ result: AuthenticationService.AuthResult) {
        switch result {
        case .failure(let error): alert("Authentication failed with error .\(error)!")
        case .success: alert("Authentication succeeded!")
        }
    }
    
    func performAuthentication() {
        service.authenticateUser(for: .standard, reason: "Test purposes", completion: handleAuthResult)
    }
    
    func resetAuthentication() {
        service.resetUserAuthentication()
        alert("Authentication has been reset. You now have to perform a new authentication.")
    }
}

struct CachedAuthenticationServiceProxyScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CachedAuthenticationServiceProxyScreen()
        }
    }
}
#endif
