//
//  LocalizationScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-12-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct LocalizationScreen: View {
 
    var body: some View {
        MenuList("Keychain") {
            Section {
                MenuListText("SwiftKit has utils for working with localized content.")
            }
            
            Section(header: Text("Services")) {
                MenuListItem(icon: .service, title: "Localization Service")
                    .navigationLink(to: LocalizationServiceScreen())
                MenuListItem(icon: .flag, title: "Translator")
                    .navigationLink(to: TranslatorScreen())
            }
        }
    }
}

struct LocalizationScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LocalizationScreen()
        }
    }
}
