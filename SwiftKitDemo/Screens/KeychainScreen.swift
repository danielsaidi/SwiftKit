//
//  KeychainScreen.swift
//  SwiftKitDemo
//
//  Created by Daniel Saidi on 2020-06-04.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftKit
import SwiftUI

struct KeychainScreen: View {
    
    @State private var resultText = ""
    
    private let key = "com.swiftkit.demo.keychain.int"
    private let keychainService = StandardKeychainService()
    
    var body: some View {
        List {
            ResultText(resultText)
            ListButton(
                text: "Get random value from keychain",
                description: "This value should be nil if you haven't persisted a random value.",
                action: getValueFromKeychain)
            ListButton(
                text: "Persist a new random value in keychain",
                description: "This value should remain unchanged even if you uninstall the app.",
                action: writeValueToKeychain)
        }.navigationBarTitle("Keychain")
    }
}

struct KeychainScreen_Previews: PreviewProvider {
    static var previews: some View {
        KeychainScreen()
    }
}

extension KeychainScreen {
    
    func getValueFromKeychain() {
        let value = keychainService.integer(for: key, with: nil)
        resultText = String(describing: value)
    }
    
    func writeValueToKeychain() {
        keychainService.set(Int.random(in: 0...1_000_000), for: key, with: nil)
        getValueFromKeychain()
    }
}
