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
        MenuList("Data") {
            Section(header: Text("About")) {
                MenuListText("SwiftKit has data utils for encoding and decoding strings, parse csv files etc.")
            }
            
            Section(header: Text("Services")) {
                MenuListItem(icon: .base64, title: "Base64 String Coder")
                    .navigationLink(to: Base64StringCoderScreen())
                MenuListItem(icon: .file, title: "CSV Parser")
                    .navigationLink(to: StandardCsvParserScreen())
            }
        }
    }
}

struct DataScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DataScreen()
        }
    }
}
