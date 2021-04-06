//
//  StandardCsvParserScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-30.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftKit
import SwiftUI
import SwiftUIKit

struct StandardCsvParserScreen: View {
    
    private let parser: CsvParser = StandardCsvParser()

    @State private var result = [[String]]()
    
    var body: some View {
        DemoList("StandardCsvParser") {
            Section(header: Text("About")) {
                DemoListText("A CsvParser can parse CSV strings. This demo uses StandardCsvParser to parse a demo file.")
            }
            
            ConditionalView(result.hasContent) {
                Section(header: Text("Result")) {
                    ForEach(result, id: \.[0]) { person in
                        Text("\(person[0]) (age \(person[1]))")
                    }
                }
            }
            
            Section(header: Text("Result")) {
                DemoListButton("Parse CSV file", .file, parseFile)
            }
        }
    }
}

private extension StandardCsvParserScreen {
    
    func parseFile() {
        guard
            let path = Bundle.main.path(forResource: "Persons", ofType: "csv"),
            let data = FileManager.default.contents(atPath: path),
            let string = String(data: data, encoding: .utf8)
        else { return }
        result = parser.parseCvsString(string, separator: ";")
    }
}

struct StandardCsvParserScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StandardCsvParserScreen()
        }
    }
}
