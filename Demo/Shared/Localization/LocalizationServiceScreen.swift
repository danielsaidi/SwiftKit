//
//  LocalizationServiceScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-12-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftKit
import SwiftUI
import SwiftUIKit

struct LocalizationServiceScreen: View {
    
    init(service: LocalizationService = StandardLocalizationService()) {
        self.service = service
    }
    
    class ViewModel: ObservableObject {
        
        @Published var locale = Locale(identifier: "en")
    }
    
    private let service: LocalizationService
    private let english = Locale(identifier: "en")
    private let swedish = Locale(identifier: "sv")
    
    @State private var title = ""
    @State private var text = ""
    @StateObject private var state = ViewModel()
    
    var body: some View {
        MenuList("Localization Service") {
            Section {
                MenuListText("SwiftKit has services for working with localized content and changing locale without restarting the app. This demo uses a StandardLocalizationService.")
            }
            
            Section(header: Text("Locales")) {
                Picker("Select locale", selection: $state.locale) {
                    Text("English").tag(english)
                    Text("Swedish").tag(swedish)
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Translations")) {
                MenuListText(title).font(.headline)
                MenuListText(text)
            }
        }
        .onAppear(perform: refresh)
        .onReceive(state.$locale, perform: { _ in refreshAsync() })
    }
}

extension LocalizationServiceScreen {
    
    func refresh() {
        try? service.setLocale(state.locale)
        title = service.translate("localization_service_title")
        text = service.translate("localization_service_text")
    }
    
    func refreshAsync() {
        DispatchQueue.main.async(execute: refresh)
    }
}

struct LocalizationServiceScreen_Previews: PreviewProvider {
    static var previews: some View {
        LocalizationServiceScreen()
    }
}
