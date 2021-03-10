//
//  LongestEncreasingSeq.swift
//  Problems
//
//  Created by abuzeid on 20.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class LongestEncreasingSeq: XCTestCase {
    class Solution {
        var dic: [[Int]] = []
        func lengthOfLIS(_ nums: [Int]) -> Int {
            dic = Array(repeating: Array(repeating: -1, count: nums.count), count: nums.count + 1)
            return visit(0, -1, 0, nums)
        }

        func visit(_ sum: Int, _ prev: Int, _ i: Int, _ nums: [Int]) -> Int {
            guard i < nums.count else { return sum }
            if prev >= 0 {
                if dic[prev][i] >= 0 {
                    return dic[prev][i]
                }
            }

            var x = 0
            var y = 0
            let old  = prev >= 0 ? nums[prev ] : 0
            if nums[i] > old {
                let pick = visit(sum + 1, i, i + 1, nums)
                let leave = visit(sum, prev, i + 1, nums)
                x = max(pick, leave)
            } else {
                y = visit(sum, prev, i + 1, nums)
            }
            if prev >= 0 {
                dic[prev + 1][i] = max(x, y)
            }
            return max(x, y)
        }
    }

    func testExample() throws {
        XCTAssertEqual(Solution().lengthOfLIS([10, 9, 2, 5, 3, 7, 101, 18]), 4)
    }
}
