//
//  ExelSheetColumn.swift
//  AB_ProblemSolvingTests
//
//  Created by abuzeid on 19.01.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class ExelSheetColumn: XCTestCase {
    func convertToTitle(_ n: Int) -> String {
        var num = n
        var res: String = ""
        while num != 0 {
            let uni = (num - 1) % 26
            num = (num - 1) / 26
            let cha = Character(UnicodeScalar(uni + 65)!)
            res = String(cha) + res
        }
        return res
    }

    func testExample() throws {
        XCTAssertEqual(convertToTitle(26), "A")
    }
}
