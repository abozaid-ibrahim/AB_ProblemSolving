//
//  ISSubSequence.swift
//  AB_ProblemSolvingTests
//
//  Created by abuzeid on 27.01.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class ISSubSequence: XCTestCase {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        if s == t || s.isEmpty {
            return true
        }
        let a = Array(s)
        var j = 0
        for i in t {
            if i == a[j] {
                j += 1
                if j == a.count {
                    return true
                }
            }
        }
        return false
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
