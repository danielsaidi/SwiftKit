//
//  IoCScreen.swift
//  SwiftKitDemo
//
//  Created by Daniel Saidi on 2020-04-29.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftKit

struct IoCScreen: View {
    
    init() {
        container = TestContainer()
        container.result = Base64StringCoder()
        IoC.register(container)
    }
    
    @State private var resultText = ""
    
    private let container: TestContainer
    
    var body: some View {
        List {
            if resultText.count > 0 {
                Text(resultText).font(.title)
            }
            
            ListButton(
                text: "Resolve with container",
                description: "Resolve a dependency with the container.",
                action: resolveWithIoC)
            
            ListButton(
                text: "Resolve with IoC",
                description: "Resolve a dependency with the IoC class.",
                action: resolveWithContainer)
        }.navigationBarTitle("Extensions")
    }
}

struct IoCScreen_Previews: PreviewProvider {
    static var previews: some View {
        IoCScreen()
    }
}

extension IoCScreen {
    
    func resolveWithContainer() {
        handleResult(container.resolve())
    }
    
    func resolveWithIoC() {
        handleResult(IoC.resolve())
    }
    
    func handleResult(_ result: StringCoder) {
        let className = String(describing: result)
        resultText = "The StringCoder protocol was resolved to an instance of \(className)"
    }
}

private class TestContainer: IoCContainer {
    
    var result: Any?
    
    func resolve<T>() -> T {
        result as! T
    }
    
    func resolve<T, A>(arguments arg1: A) -> T {
        result as! T
    }
    
    func resolve<T, A, B>(arguments arg1: A, _ arg2: B) -> T {
        result as! T
    }
    
    func resolve<T, A, B, C>(arguments arg1: A, _ arg2: B, _ arg3: C) -> T {
        result as! T
    }
    
    func resolve<T, A, B, C, D>(arguments arg1: A, _ arg2: B, _ arg3: C, _ arg4: D) -> T {
        result as! T
    }
    
    func resolve<T, A, B, C, D, E>(arguments arg1: A, _ arg2: B, _ arg3: C, _ arg4: D, _ arg5: E) -> T {
        result as! T
    }
}
