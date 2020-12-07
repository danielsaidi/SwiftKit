//
//  ExtensionsScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-12-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct ExtensionsScreen: View {
 
    var body: some View {
        DemoList("Extensions") {
            Section(header: Text("About")) {
                DemoListText("""
SwiftUIKit contains a bunch of extensions that aims at making it easier to work wirh SwiftUI.
                    
Since this namespace contains a lot will grow over time, extensions are not demonstrated. Instead, checkout the library source code.
""")
            }
        }
    }
}

struct ExtensionsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ExtensionsScreen()
    }
}
