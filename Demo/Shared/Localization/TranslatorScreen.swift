//
//  TranslatorScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-12-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftKit
import SwiftUI
import SwiftUIKit

struct TranslatorScreen: View {
    
    init(service: Translator = StandardTranslator()) {
        self.service = service
    }
    
    private let service: Translator
    
    @State private var title = ""
    @State private var text = ""
    
    var body: some View {
        MenuList("Translator") {
            Section(header: Text("About")) {
                MenuListText("SwiftKit has translators that can be used to abstract how localized strings are translated. This demo uses a StandardTranslator, which uses the latest locale set for this app.")
            }
            
            Section(header: Text("Translations")) {
                MenuListText(title).font(.headline)
                MenuListText(text)
            }
        }
        .onAppear(perform: refresh)
    }
}

extension TranslatorScreen {
    
    func refresh() {
        title = service.translate("localization_service_title")
        text = service.translate("localization_service_text")
    }
}

struct TranslatorScreen_Previews: PreviewProvider {
    static var previews: some View {
        TranslatorScreen()
    }
}
