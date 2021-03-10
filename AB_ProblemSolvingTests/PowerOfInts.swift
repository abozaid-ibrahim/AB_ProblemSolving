//
//  PowerOfInts.swift
//  AB_ProblemSolvingTests
//
//  Created by abuzeid on 05.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class PowerOfInts: XCTestCase {
    func getKth(_ lo: Int, _ hi: Int, _ k: Int) -> Int {
        var start = lo
        var powers: [Int: Int] = [:]
        while start <= hi {
            powers[start] = powerOf(start)
            start += 1
        }
        let req = powers.sorted { $0.value < $1.value }
        
        return req[k-1].key
    }

    func powerOf(_ i: Int) -> Int {
        var x = i
        var cnt = 0
        while x > 1 {
            if x % 2 == 0 {
                x /= 2
            } else {
                x = 3 * x + 1
            }
            cnt += 1
        }
        return cnt
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
