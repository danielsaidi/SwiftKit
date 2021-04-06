//
//  IoCScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-12-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct IoCScreen: View {
 
    var body: some View {
        MenuList("IoC") {
            Section(header: Text("About")) {
                MenuListText("""
SwiftKit has utils that simplifies implementing IoC (inversion of control) and DI (dependency injection) in your apps.
                    
These utils are not in the demo, though, so have a look att the source code.
""")
            }
        }
    }
}

struct IoCScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            IoCScreen()
        }
    }
}
