//
//  Hour.swift
//  Problems
//
//  Created by abuzeid on 15.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class Hour: XCTestCase {
    class Solution {
        // converting the problem into how to find combination without reapting using element problem
        // my solution is beating other Swift submission 100% - 90%
        // two hidden requirement for this problem is:
        // 1. total time should not be added up to be more than or equal to 12 hours
        // 2. minutes LEDs cannot be all on,
        //    because all minutes LEDs should not be added up to be more than 59 minutes
        var res = [String]()
        let lampValuesInMinute = [480, 240, 120, 60, 32, 16, 8, 4, 2, 1]
        func readBinaryWatch(_ num: Int) -> [String] {
            if num == 0 { return ["0:00"] }
            f(0, num, 0)
            return res
        }

        //  // if the ind we start doest have enough number of lights to be turn on we skip
        // also we dont want total minutes to be more than 12:00 ( = 720)
        private func f(_ lampIndex: Int, _ options: Int, _ clock: Int) {
            if lampIndex + options - 1 >= lampValuesInMinute.count || clock >= 60 * 12 || (clock % 60 == 0 ) { return }
            
            if options == 0 {
                let h: Int = clock / 60
                let m: Int = clock % 60
                let hStr = "\(h)"
                let mStr = m < 10 ? "0\(m)" : "\(m)"
                res.append(hStr + ":" + mStr)
                return
            }
            for i in lampIndex ..< lampValuesInMinute.count {
                f(i + 1, options - 1, clock + lampValuesInMinute[i])
            }
        }
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
