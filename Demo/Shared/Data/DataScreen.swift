//
//  DataScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-29.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct DataScreen: View {
 
    var body: some View {
        DemoList("Data") {
            Section(header: Text("About")) {
                DemoListText("SwiftKit has data utils for encoding and decoding strings, parse csv files etc.")
            }
            
            Section(header: Text("Services")) {
                DemoListLink("Base64 String Coder", .base64, Base64StringCoderScreen())
                DemoListLink("CSV Parser", .file, StandardCsvParserScreen())
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
