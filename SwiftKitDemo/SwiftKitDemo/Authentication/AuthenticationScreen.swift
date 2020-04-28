//
//  AuthenticationScreen.swift
//  SwiftKitDemo
//
//  Created by Daniel Saidi on 2020-04-28.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftKit

struct AuthenticationScreen: View {
    
    init() {
        auth = Authentication(id: "demo-auth")
        biometricService = BiometricAuthenticationService()
        cachedService = CachedAuthenticationServiceProxy(baseService: biometricService)
    }
    
    @State private var resultText = ""
    
    private let auth: Authentication
    private let biometricService: BiometricAuthenticationService
    private let cachedService: CachedAuthenticationServiceProxy
    
    var body: some View {
        List {
            if resultText.count > 0 {
                Text(resultText).font(.title)
            }
            
            ListButton(
                text: "Perform biometric authentication",
                description: "This authentication will be performed every time you tap the button.",
                action: performBiometricAuthentication)
            
            ListButton(
                text: "Perform cached authentication",
                description: "This authentication will cache any successful authentication operation and not ask you again until you reset the authentication cache.",
                action: performCachedAuthentication)
            
            ListButton(
                text: "Reset authentication cached",
                description: "Resetting the authentication cache will make the cached service perform an actual authentication the next time you tap the button.",
                action: clearAuthenticationCache)
        }.navigationBarTitle("Extensions")
    }
}

struct AuthenticationScreen_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationScreen()
    }
}

extension AuthenticationScreen {
    
    func clearAuthenticationCache() {
        cachedService.resetAuthenticationCache(for: auth)
    }
    
    func performCachedAuthentication() {
        cachedService.authenticate(
            auth,
            reason: "The SwiftKit demo app will not use this information in any way") { result in
                switch result {
                case .failure: self.
                }
        }
    }
    
    func performBiometricAuthentication() {}
    
    func handleAuthenticationResult(_ result: 
}
