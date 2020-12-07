//
//  DirectoryServiceScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-12-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct DirectoryServiceScreen: View {
    
    init(service: DirectoryService = StandardDirectoryService(directory: .cachesDirectory)!) {
        self.service = service
        refreshFiles()
    }
    
    private let service: DirectoryService
    
    @State private var files: [String] = []
    @State private var isFilterEnabled = false
    
    var body: some View {
        DemoList("Directory Service") {
            Section(header: Text("About")) {
                DemoListText("SwiftKit has services that lets you handle files within local directoriers. This demo uses a StandardDirectoryService that targets the local cache directory.")
            }
            
            if files.hasContent {
                Section(header: Text("Files")) {
                    ForEach(files, id: \.self) {
                        DemoListText("\($0) (\(service.getSizeOfFile(named: $0) ?? 0) bytes)")
                    }
                }
            }
            
            Section(header: Text("Total")) {
                DemoListText("\(files.count) files (\(service.getSizeOfAllFiles()) bytes)")
            }
            
            Section(header: Text("Actions")) {
                DemoListButton("Create file with random name", .fileAdd, createRandomFile)
                DemoListButton("Delete random file", .trash, deleteRandomFile)
                DemoListButton("Show only files that start with \"1\"", isFilterEnabled ? .circleFilled : .circle, toggleFileFilter)
            }
        }.onAppear(perform: refreshFiles)
    }
}

private extension DirectoryServiceScreen {
    
    func createRandomFile() {
        let fileName = "\(Int.random(in: 1...10_000)).txt"
        let data = "Hello, world!".data(using: .utf8)
        _ = service.createFile(named: fileName, contents: data)
        refreshFiles()
    }
    
    func deleteRandomFile() {
        guard let fileName = files.randomElement() else { return }
        try? service.removeFile(named: fileName)
        refreshFiles()
    }
    
    func toggleFileFilter() {
        isFilterEnabled.toggle()
        refreshFiles()
    }
    
    func refreshFiles() {
        self.files = service.getFileNames()
        guard isFilterEnabled else { return }
        self.files = files.filter { $0.hasPrefix("1") }
    }
}

struct DirectoryServiceScreen_Previews: PreviewProvider {
    static var previews: some View {
        DirectoryServiceScreen()
    }
}
