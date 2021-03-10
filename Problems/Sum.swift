//
//  Sum.swift
//  Problems
//
//  Created by abuzeid on 24.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class Sum: XCTestCase {
    func maxProduct(_ nums: [Int]) -> Int {
        var maxSoFar = nums[0]
        var minSoFar = nums[0]
        var result = maxSoFar
        for i in 1 ..< nums.count {
            let curr = nums[i]
            let tempMax = max(curr, maxSoFar * curr, minSoFar * curr)
            minSoFar = min(curr, maxSoFar * curr, minSoFar * curr)
            maxSoFar = tempMax
            result = max(maxSoFar, result)
        }

        return result
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}
