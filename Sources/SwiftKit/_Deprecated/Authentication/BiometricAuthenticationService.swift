//
//  BiometricAuthenticationService.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-01-18.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(macOS)
import LocalAuthentication

@available(*, deprecated, message: "This is no longer used. Use LAContext directly instead.")
public class BiometricAuthenticationService: LocalAuthenticationService {
    
    public init() {
        super.init(policy: .deviceOwnerAuthenticationWithBiometrics)
    }
}
#endif
