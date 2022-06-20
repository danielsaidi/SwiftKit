//
//  SwinjectIoCContainer.swift
//  Pinny
//
//  Created by Daniel Saidi on 2017-09-06.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//
//  Get Swinject: https://github.com/Swinject/Swinject
//

/*
import Swinject

/**
 This class implements the `IoCContainer` protocol, using an
 external library called `Swinject`.
 
 Since `SwiftKit` doesn't depend on `Swinject` the code must
 be commented out.
 
 You can add this conainer to apps that use `Swinject`, then
 uncomment the code to get a complete `IoCContainer`.
 */
class SwinjectIoCContainer: IoCContainer {
    
    init(container: Container) {
        self.container = container
    }
    
    private var container: Container
    
    func resolve<T>() -> T {
        container.resolve(T.self)!
    }
    
    func resolve<T, A>(arguments arg1: A) -> T {
        container.resolve(T.self, argument: arg1)!
    }
    
    func resolve<T, A, B>(arguments arg1: A, _ arg2: B) -> T {
        container.resolve(T.self, arguments: arg1, arg2)!
    }
    
    func resolve<T, A, B, C>(arguments arg1: A, _ arg2: B, _ arg3: C) -> T {
        container.resolve(T.self, arguments: arg1, arg2, arg3)!
    }
    
    func resolve<T, A, B, C, D>(arguments arg1: A, _ arg2: B, _ arg3: C, _ arg4: D) -> T {
        container.resolve(T.self, arguments: arg1, arg2, arg3, arg4)!
    }
    
    func resolve<T, A, B, C, D, E>(arguments arg1: A, _ arg2: B, _ arg3: C, _ arg4: D, _ arg5: E) -> T {
        container.resolve(T.self, arguments: arg1, arg2, arg3, arg4, arg5)!
    }
}
*/
