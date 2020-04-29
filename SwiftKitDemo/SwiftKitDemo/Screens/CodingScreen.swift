//
//  CodingScreen.swift
//  SwiftKitDemo
//
//  Created by Daniel Saidi on 2020-04-29.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftKit

struct CodingScreen: View {
    
    init() {
        coder = Base64StringCoder()
    }
    
    @State private var resultText = ""
    
    private let coder: StringCoder
    
    var body: some View {
        List {
            if resultText.count > 0 {
                Text(resultText).font(.title)
            }
            
            ListButton(
                text: "Base64 encode",
                description: "Encode a string to base64.",
                action: base64Encode)
            
            ListButton(
                text: "Base64 decode",
                description: "Decode a base64 encoded string.",
                action: base64Decode)
        }.navigationBarTitle("Extensions")
    }
}

struct CodingScreen_Previews: PreviewProvider {
    static var previews: some View {
        CodingScreen()
    }
}

extension CodingScreen {
    
    func base64Decode() {
        let string = coder.encode(string: "This is a string")!
        let result = coder.decode(string)!
        resultText = "\"\(string)\" was decoded to \"\(result)\""
    }
    
    func base64Encode() {
        let string = "This is a string"
        let result = coder.encode(string)!
        resultText = "\"\(string)\" was encoded to \"\(result)\""
    }
}
