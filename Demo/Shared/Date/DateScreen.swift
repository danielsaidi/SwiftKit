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
        MenuList("Date") {
            Section {
                MenuListText("SwiftKit contains Date utils and extensions. For now, they're all in this one, single screen.")
            }
            
            Section(header: Text("Date")) {
                DatePicker("Select date", selection: $date)
            }
            
            Section(header: Text("Difference")) {
                MenuListText("Date is \(date.months(from: Date())) months from now")
                MenuListText("Date is \(date.weeks(from: Date())) weeks from now")
                MenuListText("Date is \(date.days(from: Date())) days from now")
                MenuListText("Date is \(date.hours(from: Date())) hours from now")
            }
            
            Section(header: Text("Adding to selected date")) {
                MenuListText("1000 seconds: \(formatter.string(from: date.adding(seconds: 1000)))")
                MenuListText("2000 minutes: \(formatter.string(from: date.adding(minutes: 2000)))")
                MenuListText("3000 hours: \(formatter.string(from: date.adding(hours: 3000)))")
                MenuListText("4000 days: \(formatter.string(from: date.adding(days: 4000)))")
            }
            
            Section(header: Text("Removing from selected date")) {
                MenuListText("1000 seconds: \(formatter.string(from: date.removing(seconds: 1000)))")
                MenuListText("2000 minutes: \(formatter.string(from: date.removing(minutes: 2000)))")
                MenuListText("3000 hours: \(formatter.string(from: date.removing(hours: 3000)))")
                MenuListText("4000 days: \(formatter.string(from: date.removing(days: 4000)))")
            }
        }
    }
}

struct DateScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DateScreen()
        }
    }
}
