//
//  ContentView.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-27.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
 
    var body: some View {
        NavigationView {
            DemoList("SwiftKit") {
                Section(header: Text("Sections")) {
                    list1
                    list2
                }
            }
        }.withPlatformSpecificNavigationStyle()
    }
}

private extension ContentView {
    
    var list1: some View {
        Group {
            #if os(iOS) || os(macOS)
            DemoListLink("Authentication", .authentication, AuthenticationScreen())
            #endif
            DemoListLink("Data", .data, DataScreen())
            DemoListLink("Date", .date, DateScreen())
            DemoListLink("Device", .device, DeviceScreen())
            DemoListLink("Extensions", .extensions, ExtensionsScreen())
            DemoListLink("Files (TBD)", .files, Text("TBD"))
            DemoListLink("Geo (TBD)", .globe, Text("TBD"))
            DemoListLink("IoC (TBD)", .ioc, Text("TBD"))
            DemoListLink("Keychain (TBD)", .key, Text("TBD"))
            DemoListLink("Localization (TBD)", .flag, Text("TBD"))
        }
    }
    
    var list2: some View {
        Group {
            DemoListLink("Network (TBD)", .cloud, Text("TBD"))
            DemoListLink("Services (TBD)", .services, Text("TBD"))
        }
    }
}

private extension View {
    
    func withPlatformSpecificNavigationStyle() -> some View {
        #if os(iOS)
        return self.navigationViewStyle(StackNavigationViewStyle())
        #else
        return self
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
