//
//  KeychainServiceTestClass.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-11-24.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation
import Mockery

class MockUserDefaults: UserDefaults, Mockable {
    
    typealias SetAnyValue = (Any?, String) -> Void
    typealias SetBoolValue = (Bool, String) -> Void
    typealias SetDoubleValue = (Double, String) -> Void
    typealias SetIntValue = (Int, String) -> Void

    let mock = Mock()
    
    override func bool(forKey defaultName: String) -> Bool {
        mock.invoke(bool, args: defaultName)
    }
    
    override func data(forKey defaultName: String) -> Data? {
        mock.invoke(data, args: defaultName)
    }
    
    override func double(forKey defaultName: String) -> Double {
        mock.invoke(double, args: defaultName)
    }

    override func integer(forKey defaultName: String) -> Int {
        mock.invoke(integer, args: defaultName)
    }
    
    override func object(forKey defaultName: String) -> Any? {
        mock.invoke(object, args: defaultName)
    }
    
    override func string(forKey defaultName: String) -> String? {
        mock.invoke(string, args: defaultName)
    }
    
    override func set(_ value: Any?, forKey defaultName: String) {
        mock.registerResult(for: data) { _ in value }
        mock.invoke(set, args: (value, defaultName))
    }
    
    override func set(_ value: Int, forKey defaultName: String) {
        mock.registerResult(for: integer) { _ in value }
        mock.invoke(set, args: (value, defaultName))
    }
    
    override func set(_ value: Bool, forKey defaultName: String) {
        mock.registerResult(for: bool) { _ in value }
        mock.invoke(set, args: (value, defaultName))
    }
    
    override func set(_ value: Double, forKey defaultName: String) {
        mock.registerResult(for: double) { _ in value }
        mock.invoke(set, args: (value, defaultName))
    }
    
    override func synchronize() -> Bool {
        mock.registerResult(for: synchronize) { _ in true }
        return mock.invoke(synchronize, args: ())
    }
}
