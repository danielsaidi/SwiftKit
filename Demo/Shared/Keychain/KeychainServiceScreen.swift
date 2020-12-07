//
//  KeychainServiceScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-12-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct KeychainServiceScreen: View {
    
    @State private var boolText = ""
    @State private var doubleText = ""
    @State private var intText = ""
    @State private var stringText = ""
    
    private let key = "com.swiftkit.demo.keychain.int"
    private let service = StandardKeychainService()
 
    var body: some View {
        DemoList("Keychain Services") {
            Section(header: Text("About")) {
                DemoListText("SwiftKit has services that let you use the keychain like UserDefaults, but where the data is still around if the user deletes the app.")
            }
            
            Section(header: Text("Persisted Data")) {
                DemoListText("Bool: \(boolText)")
                DemoListText("Double: \(doubleText)")
                DemoListText("Int: \(intText)")
                DemoListText("String: \(stringText)")
            }
            
            Section(header: Text("Actions")) {
                DemoListButton("Store Random Bool", .data, storeRandomBool)
                DemoListButton("Store Random Double", .data, storeRandomDouble)
                DemoListButton("Store Random Int", .data, storeRandomInt)
                DemoListButton("Store Random String", .data, storeRandomString)
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
