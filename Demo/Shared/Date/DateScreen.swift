//
//  DateScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-12-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftKit
import SwiftUI
import SwiftUIKit

struct DateScreen: View {
    
    init(formatter: DateFormatter = DateFormatter()) {
        self.formatter = formatter
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
    }
    
    @State private var date = Date()
    
    private let formatter: DateFormatter
    
    var body: some View {
        List {
            Section {
                ListText("SwiftKit contains Date utils and extensions. For now, they're all in this one, single screen.")
            }
            
            Section(header: Text("Date")) {
                DatePicker("Select date", selection: $date)
            }
            
            Section(header: Text("Difference")) {
                ListText("Date is \(date.months(from: Date())) months from now")
                ListText("Date is \(date.weeks(from: Date())) weeks from now")
                ListText("Date is \(date.days(from: Date())) days from now")
                ListText("Date is \(date.hours(from: Date())) hours from now")
            }
            
            Section(header: Text("Adding to selected date")) {
                ListText("1000 seconds: \(formatter.string(from: date.adding(seconds: 1000)))")
                ListText("2000 minutes: \(formatter.string(from: date.adding(minutes: 2000)))")
                ListText("3000 hours: \(formatter.string(from: date.adding(hours: 3000)))")
                ListText("4000 days: \(formatter.string(from: date.adding(days: 4000)))")
            }
            
            Section(header: Text("Removing from selected date")) {
                ListText("1000 seconds: \(formatter.string(from: date.removing(seconds: 1000)))")
                ListText("2000 minutes: \(formatter.string(from: date.removing(minutes: 2000)))")
                ListText("3000 hours: \(formatter.string(from: date.removing(hours: 3000)))")
                ListText("4000 days: \(formatter.string(from: date.removing(days: 4000)))")
            }
        }.navigationTitle("Date")
    }
}

struct DateScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DateScreen()
        }
    }
}
