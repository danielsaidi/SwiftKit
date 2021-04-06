//
//  Base64StringCoderScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-30.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftKit
import SwiftUI

struct Base64StringCoderScreen: View {
    
    private let service: StringCoder = Base64StringCoder()

    @State private var text = ""
    
    private var encoded: String { service.encode(text) ?? "-" }
    private var decoded: String { service.decode(encoded) ?? "-" }
    
    var body: some View {
        DemoList("Base64StringCoder") {
            Section(header: Text("About")) {
                DemoListText("Base64StringCoder can encode and decode base64. Type text below to encode it.")
            }
            
            Section(header: Text("Text")) {
                TextField("Enter text", text: $text)
            }
            
            Section(header: Text("Result")) {
                Text("Encoded: \(encoded)")
                Text("Decoded: \(decoded)")
            }
        }
    }
}

struct Base64StringCoderScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Base64StringCoderScreen()
        }
    }
}
