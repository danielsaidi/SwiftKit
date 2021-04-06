//
//  MimeTypeTests.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2021-03-29.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import SwiftKit

class MimeTypeTests: QuickSpec {
    
    override func spec() {
        
        describe("mime type") {
            
            func result(for type: MimeType) -> String {
                type.identifier
            }
            
            describe("application") {
                
                it("is valid for all types") {
                    MimeType.Application.allCases.forEach {
                        let result = MimeType.application($0).id
                        let hasValidPrefix = result.hasPrefix("application/")
                        expect(hasValidPrefix).to(beTrue())
                    }
                }
            }
            
            describe("audio") {
                
                func result(for type: MimeType.Audio) -> String {
                    MimeType.audio(type).id
                }
                
                it("is valid for all types") {
                    expect(result(for: .kar)).to(equal("audio/midi"))
                    expect(result(for: .m4a)).to(equal("audio/x-m4a"))
                    expect(result(for: .midi)).to(equal("audio/midi"))
                    expect(result(for: .mp3)).to(equal("audio/mpeg"))
                    expect(result(for: .ogg)).to(equal("audio/ogg"))
                    expect(result(for: .ra)).to(equal("audio/x-realaudio"))
                }
            }
            
            describe("image") {
                
                func result(for type: MimeType.Image) -> String {
                    MimeType.image(type).id
                }
                
                it("is valid for all types") {
                    expect(result(for: .bmp)).to(equal("image/x-ms-bmp"))
                    expect(result(for: .gif)).to(equal("image/gif"))
                    expect(result(for: .ico)).to(equal("image/x-icon"))
                    expect(result(for: .jpeg)).to(equal("image/jpeg"))
                    expect(result(for: .jng)).to(equal("image/x-jng"))
                    expect(result(for: .png)).to(equal("image/png"))
                    expect(result(for: .svg)).to(equal("image/svg+xml"))
                    expect(result(for: .tiff)).to(equal("image/tiff"))
                    expect(result(for: .webp)).to(equal("image/webp"))
                    expect(result(for: .wbmp)).to(equal("image/vnd.wap.wbmp"))
                }
            }
            
            describe("text") {
                
                func result(for type: MimeType.Text) -> String {
                    MimeType.text(type).id
                }
                
                it("is valid for all types") {
                    expect(result(for: .plain)).to(equal("text/plain"))
                    expect(result(for: .css)).to(equal("text/css"))
                    expect(result(for: .html)).to(equal("text/html"))
                    expect(result(for: .mathml)).to(equal("text/mathml"))
                    expect(result(for: .xml)).to(equal("text/xml"))
                    
                    expect(result(for: .jad)).to(equal("text/vnd.sun.j2me.app-descriptor"))
                    expect(result(for: .wml)).to(equal("text/vnd.wap.wml"))
                    expect(result(for: .htc)).to(equal("text/x-component"))
                    
                }
            }
            
            describe("video") {
                
                func result(for type: MimeType.Video) -> String {
                    MimeType.video(type).id
                }
                
                it("is valid for all types") {
                    expect(result(for: .asf)).to(equal("video/x-ms-asf"))
                    expect(result(for: .asx)).to(equal("video/x-ms-asf"))
                    expect(result(for: .avi)).to(equal("video/x-msvideo"))
                    expect(result(for: .flv)).to(equal("video/x-flv"))
                    expect(result(for: .m4v)).to(equal("video/x-m4v"))
                    expect(result(for: .mng)).to(equal("video/x-mng"))
                    expect(result(for: .mp4)).to(equal("video/mp4"))
                    expect(result(for: .mpeg)).to(equal("video/mpeg"))
                    expect(result(for: .mov)).to(equal("video/quicktime"))
                    expect(result(for: .ts)).to(equal("video/mp2t"))
                    expect(result(for: .video3gpp)).to(equal("video/3gpp"))
                    expect(result(for: .webm)).to(equal("video/webm"))
                    expect(result(for: .wmv)).to(equal("video/x-ms-wmv"))
                }
            }
        }
    }
}
