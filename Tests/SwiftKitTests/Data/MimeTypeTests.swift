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
                
                func result(for type: MimeType.Application) -> String {
                    MimeType.application(type).id
                }
                
                it("is valid for all types") {
                    expect(result(for: .ai)).to(equal("application/postscript"))
                    expect(result(for: .doc)).to(equal("application/msword"))
                    expect(result(for: .pdf)).to(equal("application/pdf"))
                    expect(result(for: .ps)).to(equal("application/postscript"))
                    expect(result(for: .eot)).to(equal("application/vnd.ms-fontobject"))
                    expect(result(for: .eps)).to(equal("application/postscript"))
                    expect(result(for: .atom)).to(equal("application/atom+xml"))
                    expect(result(for: .bin)).to(equal("application/octet-stream"))
                    expect(result(for: .cco)).to(equal("application/x-cocoa"))
                    expect(result(for: .crt)).to(equal("application/x-x509-ca-cert"))
                    expect(result(for: .deb)).to(equal("application/octet-stream"))
                    expect(result(for: .der)).to(equal("application/x-x509-ca-cert"))
                    expect(result(for: .dll)).to(equal("application/octet-stream"))
                    expect(result(for: .dmg)).to(equal("application/octet-stream"))
                    expect(result(for: .doc)).to(equal("application/msword"))
                    expect(result(for: .docx)).to(equal("application/vnd.openxmlformats-officedocument.wordprocessingml.document"))
                    expect(result(for: .ear)).to(equal("application/java-archive"))
                    expect(result(for: .exe)).to(equal("application/octet-stream"))
                    expect(result(for: .hqx)).to(equal("application/mac-binhex40"))
                    expect(result(for: .img)).to(equal("application/octet-stream"))
                    expect(result(for: .iso)).to(equal("application/octet-stream"))
                    expect(result(for: .jar)).to(equal("application/java-archive"))
                    expect(result(for: .jardiff)).to(equal("application/x-java-archive-diff"))
                    expect(result(for: .jnlp)).to(equal("application/x-java-jnlp-file"))
                    expect(result(for: .js)).to(equal("application/javascript"))
                    expect(result(for: .json)).to(equal("application/json"))
                    expect(result(for: .kml)).to(equal("application/vnd.google-earth.kml+xml"))
                    expect(result(for: .kmz)).to(equal("application/vnd.google-earth.kmz"))
                    expect(result(for: .m3u8)).to(equal("application/vnd.apple.mpegurl"))
                    expect(result(for: .msi)).to(equal("application/octet-stream"))
                    expect(result(for: .msm)).to(equal("application/octet-stream"))
                    expect(result(for: .msp)).to(equal("application/octet-stream"))
                    expect(result(for: .pdb)).to(equal("application/x-pilot"))
                    expect(result(for: .pem)).to(equal("application/x-x509-ca-cert"))
                    expect(result(for: .pl)).to(equal("application/x-perl"))
                    expect(result(for: .pm)).to(equal("application/x-perl"))
                    expect(result(for: .ppt)).to(equal("application/vnd.ms-powerpoint"))
                    expect(result(for: .pptx)).to(equal("application/vnd.openxmlformats-officedocument.presentationml.presentation"))
                    expect(result(for: .prc)).to(equal("application/x-pilot"))
                    expect(result(for: .rar)).to(equal("application/x-rar-compressed"))
                    expect(result(for: .rpm)).to(equal("application/x-redhat-package-manager"))
                    expect(result(for: .rss)).to(equal("application/rss+xml"))
                    expect(result(for: .rtf)).to(equal("application/rtf"))
                    expect(result(for: .run)).to(equal("application/x-makeself"))
                    expect(result(for: .sea)).to(equal("application/x-sea"))
                    expect(result(for: .sit)).to(equal("application/x-stuffit"))
                    expect(result(for: .swf)).to(equal("application/x-shockwave-flash"))
                    expect(result(for: .tcl)).to(equal("application/x-tcl"))
                    expect(result(for: .tk)).to(equal("application/x-tcl"))
                    expect(result(for: .war)).to(equal("application/java-archive"))
                    expect(result(for: .wmlc)).to(equal("application/vnd.wap.wmlc"))
                    expect(result(for: .woff)).to(equal("application/font-woff"))
                    expect(result(for: .x7z)).to(equal("application/x-7z-compressed"))
                    expect(result(for: .xhtml)).to(equal("application/xhtml+xml"))
                    expect(result(for: .xls)).to(equal("application/vnd.ms-excel"))
                    expect(result(for: .xlsx)).to(equal("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"))
                    expect(result(for: .xpi)).to(equal("application/x-xpinstall"))
                    expect(result(for: .xspf)).to(equal("application/xspf+xml"))
                    expect(result(for: .zip)).to(equal("application/zip"))
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
