//
//  DataScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-29.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct DataScreen: View {
    
    var body: some View {
        List {
            Section {
                ListText("SwiftKit has data utils for encoding and decoding strings, parse csv files etc.")
            }
            
            Section(header: Text("Services")) {
                ListNavigationLink(destination: Base64StringCoderScreen()) {
                    Label("Base64 String Coder", image: .base64)
                }
                ListNavigationLink(destination: StandardCsvParserScreen()) {
                    Label("CSV Parser", image: .file)
                }
            }
        }.navigationTitle("Data")
    }
}

struct DataScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DataScreen()
        }
    }
}
