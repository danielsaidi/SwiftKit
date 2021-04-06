//
//  KeychainServiceScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-12-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftKit
import SwiftUI
import SwiftUIKit

struct KeychainServiceScreen: View {
    
    init(service: KeychainService = StandardKeychainService()) {
        self.service = service
    }
    
    private let service: KeychainService
    
    @State private var boolText = ""
    @State private var doubleText = ""
    @State private var intText = ""
    @State private var stringText = ""
 
    var body: some View {
        MenuList("Keychain Services") {
            Section(header: Text("About")) {
                MenuListText("SwiftKit has services that let you use the keychain like UserDefaults, but where the data is still around if the user deletes the app.")
            }
            
            Section(header: Text("Persisted Data")) {
                MenuListText("Bool: \(boolText)")
                MenuListText("Double: \(doubleText)")
                MenuListText("Int: \(intText)")
                MenuListText("String: \(stringText)")
            }
            
            Section(header: Text("Actions")) {
                MenuListItem(icon: .data, title: "Store Random Bool")
                    .button(action: storeRandomBool)
                MenuListItem(icon: .data, title: "Store Random Double")
                    .button(action: storeRandomDouble)
                MenuListItem(icon: .data, title: "Store Random Int")
                    .button(action: storeRandomInt)
                MenuListItem(icon: .data, title: "Store Random String")
                    .button(action: storeRandomString)
            }
        }.onAppear(perform: refresh)
    }
}

private extension KeychainServiceScreen {
    
    func key(for type: String) -> String {
        "com.swiftkit.demo.keychain.\(type)"
    }
    
    func storeRandomBool() {
        service.set(Bool.random(), for: key(for: "bool"), with: nil)
        refresh()
    }
    
    func storeRandomDouble() {
        service.set(Double.random(in: 0...10_000), for: key(for: "double"), with: nil)
        refresh()
    }
    
    func storeRandomInt() {
        service.set(Int.random(in: 0...10_000), for: key(for: "int"), with: nil)
        refresh()
    }
    
    func storeRandomString() {
        service.set("\(Int.random(in: 0...10_000))", for: key(for: "string"), with: nil)
        refresh()
    }
    
    func refresh() {
        refreshBool()
        refreshDouble()
        refreshInteger()
        refreshString()
    }
    
    func refreshBool() {
        if let bool = service.bool(for: key(for: "bool"), with: nil) {
            boolText = "\(bool)"
        } else {
            boolText = "-"
        }
    }
    
    func refreshDouble() {
        if let double = service.double(for: key(for: "double"), with: nil) {
            doubleText = "\(double)"
        } else {
            doubleText = "-"
        }
    }
    
    func refreshInteger() {
        if let int = service.integer(for: key(for: "int"), with: nil) {
            intText = "\(int)"
        } else {
            intText = "-"
        }
    }
    
    func refreshString() {
        if let string = service.string(for: key(for: "string"), with: nil) {
            stringText = "\(string)"
        } else {
            stringText = "-"
        }
    }
}

struct KeychainServiceScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            KeychainServiceScreen()
        }
    }
}
