//
//  PrimesCount.swift
//  AB_ProblemSolvingTests
//
//  Created by abuzeid on 15.01.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class PrimesCount: XCTestCase {
    func countPrimes(_ n: Int) -> Int {
        if n <= 0 {
            return 0
        }
        var count = 0
        // 1 2 3 5 7 11  13 17 19  23 27 29 31     37
        for j in 1 ... n {
            count += isPrimary(j, j - 1)
        }
        return count
    }

    // 51 , 50
    func isPrimary(_ j: Int, _ target: Int) -> Int {
        if target < 5 {
            return 1
        }

        if j % 2 == 0 || j % 3 == 0 || (j % target) == 0 {
            return 0
        }
        return isPrimary(j, target - 1)
    }

    func testExample() throws {
    }
}
