//
//  ConcatenationMaximuimSum.swift
//  AB_ProblemSolvingTests
//
//  Created by abuzeid on 11.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class ConcatenationMaximuimSum: XCTestCase {
 

    class Solution {
        func kConcatenationMaxSum(_ arr: [Int], _ k: Int) -> Int {
            /// do changes
            var big: [Int] = []
            big.reserveCapacity(k * arr.count)
            var i = 0
            while i < (k * arr.count) {
                big.append(arr[i % arr.count])
                i += 1
            }

            // max of sum
            return sum(big, 0, big.count) % ((10 * 9) + 7)
        }

        var memo: [String: Int] = [:]
        func sum(_ arr: [Int], _ s: Int, _ e: Int) -> Int {
            if s >= e {
                return 0
            }
            let key = "\(s)_\(e)"
            if let output = memo[key] {
                return output
            }
            var i = s
            var res = 0
            while i < e {
                res += arr[i]
                i += 1
            }
            memo[key] = res
            return max(res, max(sum(arr, s + 1, e), sum(arr, s, e - 1)))
        }
    }

//    func testExample() throws {
//        XCTAssertEqual(2, Solution().kConcatenationMaxSum([10000, 10000, 10000, 10000, 10000, 10000, 10000, 10000, 10000, 10000]
//                                                          , 100000))
//    }
}
