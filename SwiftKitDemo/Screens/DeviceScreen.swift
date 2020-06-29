//
//  DeviceScreen.swift
//  SwiftKitDemo
//
//  Created by Daniel Saidi on 2020-06-04.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftKit
import SwiftUI

struct DeviceScreen: View {
    
    @State private var resultText = ""
    
    private let keychainIdentifier = KeychainBasedDeviceIdentifier(keychainService: StandardKeychainService())
    private let defaultsIdentifier = UserDefaultsBasedDeviceIdentifier()
    
    var body: some View {
        List {
            ResultText(resultText)
            ListButton(
                text: "Get device id from keychain",
                description: "This value should remain unchanged even if you uninstall the app.",
                action: getDeviceIdentifierFromKeychain)
            ListButton(
                text: "Get device id from user defaults",
                description: "This value should change every time you uninstall the app.",
                action: getDeviceIdentifierFromUserDefaults)
        }.navigationBarTitle("Device")
    }
}

struct DeviceScreen_Previews: PreviewProvider {
    static var previews: some View {
        DeviceScreen()
    }
}

private extension DeviceScreen {
    
    func getDeviceIdentifierFromKeychain() {
        resultText = keychainIdentifier.getDeviceIdentifier()
    }
    
    func getDeviceIdentifierFromUserDefaults() {
        resultText = defaultsIdentifier.getDeviceIdentifier()
    }
}
