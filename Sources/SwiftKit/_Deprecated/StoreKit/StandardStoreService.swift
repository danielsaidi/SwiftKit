//
//  StandardStoreService.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2021-11-08.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import StoreKit

@available(*, deprecated, message: "StandardStoreService has been moved to StoreKitPlus - https://github.com/danielsaidi/StoreKitPlus")
@available(iOS 15.0, macOS 12.0, watchOS 8.0, tvOS 15.0, *)
public class StandardStoreService: StoreService {
    
    public init(
        productIds: [String],
        context: StoreContext = StoreContext()) {
        self.productIds = productIds
        self.storeContext = context
        self.transactionTask = nil
        self.transactionTask = getTransactionListenerTask()
    }
    
    deinit {
        self.transactionTask = nil
    }
    
    private let productIds: [String]
    private let storeContext: StoreContext
    private var transactionTask: Task<Void, Error>?
    
    public func getProducts() async throws -> [Product] {
        try await Product.products(for: productIds)
    }
    
    public func purchase(_ product: Product) async throws -> Product.PurchaseResult {
        let result = try await product.purchase()
        switch result {
        case .success(let result): try await handleTransaction(result)
        case .pending: break
        case .userCancelled: break
        @unknown default: break
        }
        return result
    }
    
    public func restorePurchases() async throws {
        try await syncTransactions()
    }

    public func syncStoreData() async throws {
        let products = try await getProducts()
        await updateContext(with: products)
        try await restorePurchases()
    }
}

@available(*, deprecated, message: "StandardStoreService has been moved to StoreKitPlus - https://github.com/danielsaidi/StoreKitPlus")
@available(iOS 15.0, macOS 12.0, watchOS 8.0, tvOS 15.0, *)
private extension StandardStoreService {
    
    func getTransactionListenerTask() -> Task<Void, Error> {
        Task.detached {
            for await result in Transaction.updates {
                do {
                    try await self.handleTransaction(result)
                } catch {
                    print("Transaction listener error: \(error)")
                }
            }
        }
    }
    
    func getValidTransaction(for productId: String) async throws -> Transaction? {
        guard let latest = await Transaction.latest(for: productId) else { return nil }
        let result = try verifyTransaction(latest)
        return result.isValid ? result : nil
    }
    
    func handleTransaction(_ result: VerificationResult<Transaction>) async throws {
        let transaction = try verifyTransaction(result)
        await updateContext(with: transaction)
        await transaction.finish()
    }
    
    func syncTransactions() async throws {
        var transactions: [Transaction] = []
        for id in productIds {
            if let transaction = try await getValidTransaction(for: id) {
                transactions.append(transaction)
            }
        }
        await updateContext(with: transactions)
    }
    
    func verifyTransaction(_ result: VerificationResult<Transaction>) throws -> Transaction {
        switch result {
        case .unverified(let transaction, let error): throw StoreServiceError.invalidTransaction(transaction, error)
        case .verified(let transaction): return transaction
        }
    }
}

@MainActor
@available(*, deprecated, message: "StandardStoreService has been moved to StoreKitPlus - https://github.com/danielsaidi/StoreKitPlus")
@available(iOS 15.0, macOS 12.0, watchOS 8.0, tvOS 15.0, *)
private extension StandardStoreService {
    
    func updateContext(with products: [Product]) {
        storeContext.products = products
    }
    
    func updateContext(with transaction: Transaction) {
        var transactions = storeContext.transactions
            .filter { $0.productID != transaction.productID }
        transactions.append(transaction)
        storeContext.transactions = transactions
    }
    
    func updateContext(with transactions: [Transaction]) {
        storeContext.transactions = transactions
    }
}
