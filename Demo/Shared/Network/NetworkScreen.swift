//
//  NetworkScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-12-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct NetworkScreen: View {
 
    var body: some View {
        DemoList("Network") {
            Section(header: Text("About")) {
                DemoListText("""
SwiftKit contains a bunch of utils for working with network and api-related operations, like requesting and parsing data from an external api.
                    
This namespace is currently not available as a demo. Instead, checkout the source code.
""")
            }
        }
    }
}

struct NetworkScreen_Previews: PreviewProvider {
    static var previews: some View {
        NetworkScreen()
    }
}
