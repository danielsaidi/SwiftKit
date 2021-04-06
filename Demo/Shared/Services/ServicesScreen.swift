//
//  ServicesScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-12-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct ServicesScreen: View {
 
    var body: some View {
        MenuList("Services") {
            Section {
                MenuListText("""
SwiftKit contains a bunch of service base classes, which helps you implement service decorators, proxies etc.
                    
This namespace is currently not available as a demo. Instead, checkout the source code.
""")
            }
        }
    }
}

struct ServicesScreen_Previews: PreviewProvider {
    static var previews: some View {
        ServicesScreen()
    }
}
