//
//  LeetCodeBank.swift
//  AB_ProblemSolvingTests
//
//  Created by abuzeid on 16.01.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class LeetCodeBank: XCTestCase {
    class Solution {
        func totalMoney(_ n: Int) -> Int {
            if n < 1 || n > 1000 {
                return 0
            }
            var sum = 0
            var base = 0
            for i in 1 ... n {
                let day = i % 7
                if day == 0 {
                    sum += base + 7
                    base += 1
                } else {
                    sum += base + day
                }
            }
            return sum
        }
    }

    func testExample() throws {
        XCTAssertEqual(Solution().totalMoney(10), 37)
        XCTAssertEqual(Solution().totalMoney(4), 10)
    }
}
