//
//  BiometricAuthenticationServiceScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-29.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(macOS)
import SwiftKit
import SwiftUI
import SwiftUIKit

struct BiometricAuthenticationServiceScreen: View {
    
    private let service: AuthenticationService = BiometricAuthenticationService()
    
    @StateObject private var alertContext = AlertContext()
    
    var body: some View {
        MenuList {
            Section {
                MenuListText("BiometricAuthenticationService can be used to identify the user with FaceID or TouchID.")
            }
            
            Section(header: Text("Actions")) {
                MenuListItem(icon: .authentication, title: "Perform authentication")
                    .button(action: performAuthentication)
            }
        }.alert(context: alertContext)
    }
}

private extension BiometricAuthenticationServiceScreen {
    
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
}

struct BiometricAuthenticationServiceScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BiometricAuthenticationServiceScreen()
        }
    }
}
#endif
