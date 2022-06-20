//
//  StoreService.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2021-11-08.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import StoreKit

@available(*, deprecated, message: "StoreService has been moved to StoreKitPlus - https://github.com/danielsaidi/StoreKitPlus")
@available(iOS 15.0, macOS 12.0, watchOS 8.0, tvOS 15.0, *)
public protocol StoreService {
    
    func getProducts() async throws -> [Product]
    func purchase(_ product: Product) async throws -> Product.PurchaseResult
    func restorePurchases() async throws
    func syncStoreData() async throws
}
