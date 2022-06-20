//
//  DipContainer.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2017-09-06.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//
//  Get Dip: https://github.com/AliSoftware/Dip
//

/*
import Dip

/**
 This class implements the `IoCContainer` protocol, using an
 external library called `Dip`.
 
 Since `SwiftKit` doesn't depend on `Dip`, this code must be
 commented out.
 
 You can add this class to apps that have a `Dip` dependency,
 then uncomment the code to get a complete `IoCContainer`.
 */
class DipContainer: IoCContainer {
    
    init(container: DependencyContainer) {
        self.container = container
    }
    
    private var container: DependencyContainer
    
    func resolve<T>() -> T {
        do {
            return try container.resolve()
        } catch {
            fatalError("\(#function) failed")
        }
    }
    
    func resolve<T, A>(arguments arg1: A) -> T {
        do {
            return try container.resolve(arguments: arg1)
        } catch {
            fatalError("\(#function) failed")
        }
    }
    
    func resolve<T, A, B>(arguments arg1: A, _ arg2: B) -> T {
        do {
            return try container.resolve(arguments: arg1, arg2)
        } catch {
            fatalError("\(#function) failed")
        }
    }
    
    func resolve<T, A, B, C>(arguments arg1: A, _ arg2: B, _ arg3: C) -> T {
        do {
            return try container.resolve(arguments: arg1, arg2, arg3)
        } catch {
            fatalError("\(#function) failed")
        }
    }
    
    func resolve<T, A, B, C, D>(arguments arg1: A, _ arg2: B, _ arg3: C, _ arg4: D) -> T {
        do {
            return try container.resolve(arguments: arg1, arg2, arg3, arg4)
        } catch {
            fatalError("\(#function) failed")
        }
    }
    
    func resolve<T, A, B, C, D, E>(arguments arg1: A, _ arg2: B, _ arg3: C, _ arg4: D, _ arg5: E) -> T {
        do {
            return try container.resolve(arguments: arg1, arg2, arg3, arg4, arg5)
        } catch {
            fatalError("\(#function) failed")
        }
    }
}
*/
