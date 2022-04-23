//
//  Bundle+BundleInformationTests.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2020-08-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import SwiftKit
import Foundation

class Bundle_BundleInformationTests: QuickSpec {
    
    override func spec() {
        
        describe("bundle") {
            
            it("implements BundleInformation (empty due to SPM") {
                let bundle = Bundle.main
                expect(Int(bundle.buildNumber)).to(beGreaterThan(17501))
                expect(bundle.versionNumber).to(equal("13.3"))
            }
        }
    }
}
