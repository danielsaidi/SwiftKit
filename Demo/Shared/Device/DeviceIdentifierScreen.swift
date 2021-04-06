//
//  DeviceIdentifierScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-12-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftKit
import SwiftUI
import SwiftUIKit

struct DeviceIdentifierScreen: View {
    
    enum IdentifierType: String, Identifiable {
        case keychain, userDefaults
        
        var id: String { rawValue }
    }
    
    private var identifier: DeviceIdentifier {
        switch identifierType {
        case .keychain: return KeychainBasedDeviceIdentifier(
            keychainService: StandardKeychainService(),
            backupIdentifier: UserDefaultsBasedDeviceIdentifier())
        case .userDefaults: return UserDefaultsBasedDeviceIdentifier()
        }
    }
    
    @State private var identifierType = IdentifierType.keychain
    
    var body: some View {
        MenuList("DeviceIdentifier") {
            Section(header: Text("About")) {
                MenuListText("SwiftKit contains device identifiers. The keychain-based one remembers the unique id even if you delete the app, while the user defaults-based one does not. Here, the two identifiers are kept in sync.")
            }
            
            Section(header: Text("identifier")) {
                Picker("Select identifier", selection: $identifierType) {
                    Text("Keychain").tag(IdentifierType.keychain)
                    Text("User Defaults").tag(IdentifierType.userDefaults)
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Device identifier")) {
                MenuListText(identifier.getDeviceIdentifier())
            }
        }
    }
}

struct DeviceIdentifierScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DeviceIdentifierScreen()
        }
    }
}
