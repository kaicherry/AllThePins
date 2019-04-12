//
//  VPinTable.swift
//  AllThePins
//
//  Created by Kai Cherry on 3/19/19.
//  Copyright © 2019 RnSKSoft. All rights reserved.
//

import UIKit

class VPinTable: NSObject, Codable {
    var id = "0"
    var tableName = "MrKai's WakyLyfe"
    var features = Features()
    var ipdbInfo = IPDBInfo()
    var cabinet = Cabinet()
    
     struct Features :  Codable {
        var hasFastFlips:String? = ""
        var hasSSF:String? = ""
        var isPROC:String? = ""
        var usesUltraDMD:String? = ""
        var hasPupPack:String? = ""
        var isMod:String? = ""
        var notes:String? = "Super Fun!"
    }
    struct IPDBInfo: Codable {
        var manufacturer:String? = ""
        var year:String? = ""
        var mpu:String? = ""
        var tableTheme:String? = ""
        var numberOfPlayers:String? = "0"
        var url:String? = nil
        var manufacturerURL: String? = nil
        var tableType:String? = ""
        var tableDesigners:[String]? = []
    }
    struct Cabinet: Codable {
        var rom:Rom? = Rom()
        var table = Table()
        var backglass = Backglass()
        struct Rom: Codable {
            var name:String? = "romity"
            var url: String? = "https://snitchesgetstitch.es/romity.zip"
            var date:String? = "2018"
            var version:String? = "1.23"
            var authors:String? = "M. Kai, Silent Bob, Joe"
            var colorRom:ColorRom? = ColorRom()
            struct ColorRom: Codable {
                var type:String? = ""
                var url: String? = "https://snitchesgetstitch.es/romityc.zip"
                var notes:String? = ""
                var authors:String? = "M. Kai, Silent Bob, Joe"
            }
        }
        struct Backglass: Codable {
            var date:String? = "2018"
            var url: String? = "https://snitchesgetstitch.es/MKLyfeBG.zip"
            var version:String? = "1.1"
            var authors:String? = "M. Kai, Silent Bob, Joe"
        }
        struct Table: Codable {
            var date:String? = "2018"
            var url: String? = "https://snitchesgetstitch.es/MKLyfe.vpx.zip"
            var version:String? = "1.2"
            var authors:String? = "M. Kai, Silent Bob, Joe"
        }
    }
    struct Media: Codable {
        struct Audio: Codable {
            struct Pinsound: Codable {
                var date:String? = ""
                var url: URL? = nil
                var version:String? = ""
                var authors:String? = ""
            }
            struct FrontEnd: Codable {
                var date = ""
                var url: URL? = nil
                var version = ""
                var authors:String? = ""
            }
        }
        }
        struct Pinup: Codable {
            var name = ""
            var date = ""
            var url: URL? = nil
            var version = ""
            var authors:String? = ""
        }
        struct Wheel: Codable {
            struct Transparent: Codable {
                var date = ""
                var url: URL? = nil
                var version = ""
                var authors:String? = ""
            }
            struct Round: Codable {
                var date = ""
                var url: URL? = nil
                var version = ""
                var authors:String? = ""
            }
        }
        struct Topper: Codable {
            var date = ""
            var url: URL? = nil
            var version = ""
            var authors:String? = ""
        }
        struct Pack: Codable {
            var date = ""
            var url: URL? = nil
            var version = ""
            var authors:String? = ""
        }

}
