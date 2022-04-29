//
//  BiometricAuthenticationService.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-01-18.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(macOS)
import LocalAuthentication

/**
 This authentication service uses `LocalAuthentication` such
 as `FaceID` or `TouchID` to authenticate the user.
 */
public class BiometricAuthenticationService: LocalAuthenticationService {
    
    /**
     Create a service instance.
     */
    public init() {
        super.init(policy: .deviceOwnerAuthenticationWithBiometrics)
    }
}
#endif
