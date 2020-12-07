//
//  IoC.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2016-03-10.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This class can be used to remove coupling to your preferred
 IoC library, e.g. Dip or Swinject.
 
 You can either implement your own `IoCContainer` or comment
 out the code of any `IocContainer` class in this folder and
 add it to your app. You can then register it globally using
 `IoC.register(...)` and use it with `IoC.resolve(...)`.
 
 If you don't want to use an IoC container, you can just use
 the `IoC` class as a container for static properties.
*/
public final class IoC {
    
    public private(set) static var container: IoCContainer!
    
    public static func register(_ container: IoCContainer) {
        IoC.container = container
    }
    
    public static func resolve<T>() -> T {
        container.resolve()
    }
    
    public static func resolve<T, A>(arguments arg1: A) -> T {
        container.resolve(arguments: arg1)
    }
    
    public static func resolve<T, A, B>(arguments arg1: A, _ arg2: B) -> T {
        container.resolve(arguments: arg1, arg2)
    }
    
    public static func resolve<T, A, B, C>(arguments arg1: A, _ arg2: B, _ arg3: C) -> T {
        container.resolve(arguments: arg1, arg2, arg3)
    }
    
    public static func resolve<T, A, B, C, D>(arguments arg1: A, _ arg2: B, _ arg3: C, _ arg4: D) -> T {
        container.resolve(arguments: arg1, arg2, arg3, arg4)
    }
    
    public static func resolve<T, A, B, C, D, E>(arguments arg1: A, _ arg2: B, _ arg3: C, _ arg4: D, _ arg5: E) -> T {
        container.resolve(arguments: arg1, arg2, arg3, arg4, arg5)
    }
}
