//
//  AllThePinsTests.swift
//  AllThePinsTests
//
//  Created by Kai Cherry on 4/10/19.
//  Copyright © 2019 RnSKSoft. All rights reserved.
//

import XCTest
@testable import AllThePins

class AllThePinsTests: XCTestCase {
    
    var VPinTableTest: VPinTable!
    let jsonTable  = """
    {"id":"164","tableName":"Big Indian (Gottlieb 1974)","features":{"hasFastFlips":"","hasSSF":"","isPROC":"","usesUltraDMD":"","hasPupPack":"","isMOD":"","notes":""},"ipdbInfo":{"manufacturer":"Gottlieb","year":"1974","tableTheme":"American West - Native Americans","numberOfPlayers":"4","url":"http://www.ipdb.org/machine.cgi?id=http://www.ipdb.org/machine.cgi?id=257","manufacturerURL":"https://en.wikipedia.org/wiki/Gottlieb","tableType":"EM"},"ipdbinfo":{"mpu":"None","authors":"Ed Krynski"},"cabinet":{"backglass":{"url":"http://www.vpforums.org/index.php?app=downloads&showfile=11222","authors":"HauntFreaks","version":"1","date":"07.30.15"},"rom":{"url":"Not needed","name":"","authors":"","version":"","date":"","color":{"url":"","name":"","authors":"","version":"","date":""}},"table":{"url":"http://www.vpforums.org/index.php?app=downloads&showfile=11223#","pov":{"url":"","authors":"","version":"","date":""}}},"media":{"audio":{"pinsound":{"url":"","authors":"","version":"","date":""}},"pinup":{"name":"","PuPURL":"","authors":"","version":"","date":""}}}
    """
    var testURL: String!
    
    override func setUp() {
        super.setUp()
        VPinTableTest = VPinTable()
        VPinTableTest.id = "TESTID"
        VPinTableTest.tableName = "Test Table"
        VPinTableTest.features.hasFastFlips = "no"
        VPinTableTest.features.hasPupPack = "yes"
        VPinTableTest.features.hasSSF = "yes"
        VPinTableTest.features.isMod = "no"
        VPinTableTest.features.isPROC = "no"
        VPinTableTest.features.usesUltraDMD = "hell no"
        VPinTableTest.features.notes = "features notes"
        testURL = "http://www.vpforums.org/index.php?app=downloads&showfile=11223#"
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        VPinTableTest = nil
        testURL = nil
    }

    func testFeatures() {
        
        XCTAssertTrue(VPinTableTest.id == "TESTID")
        XCTAssertTrue(VPinTableTest.tableName == "Test Table")
        XCTAssertNotNil(VPinTableTest.features.hasFastFlips)
        XCTAssertFalse(VPinTableTest.features.hasFastFlips == "yes")
        XCTAssertTrue(VPinTableTest.features.hasPupPack == "yes")
        XCTAssertTrue(VPinTableTest.features.hasSSF == "yes")
        XCTAssertTrue(VPinTableTest.features.isMod == "no")
    }
    
   
    func testVPinTableFromJSON() {
        var testTableObject:VPinTable
        let decoder = JSONDecoder()
   
        do {
            guard let jsonData = jsonTable.data(using: .utf8) else {
                XCTFail("JSONData was is nil")
                return
            }
            testTableObject = try decoder.decode(VPinTable.self, from: jsonData)
            XCTAssert(testTableObject.id == "164", "ID Match.")
            XCTAssert(testTableObject.tableName == "Big Indian (Gottlieb 1974)", "TableName Match.")
            XCTAssertNotNil(testTableObject.cabinet.table.url, "URL String missing for table")
            XCTAssertNotNil(URL.init(string: testTableObject.cabinet.table.url ?? ""), "URL String didn't convert to URL object")
            XCTAssert(URL.init(string: testTableObject.cabinet.table.url ?? "")?.absoluteString == testURL, "Converted URL did not match expected value of \(String(describing: testURL))")

        } catch {
            XCTFail("JSONData couldn't be decoded")
        }
        
        
       

    }

   
}
