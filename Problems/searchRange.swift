//
//  s.swift
//  Problems
//
//  Created by abuzeid on 23.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class searchRange: XCTestCase {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        let fail = [-1, -1]
        if nums.isEmpty { return fail }
        let first = find(nums, target, true)
        if first == nums.count {
            return fail
        } else if nums[first] != target {
            return fail
        }

        let last = find(nums, target, false) - 1
        return [first, last]
    }

    func find(_ n: [Int], _ target: Int, _ left: Bool) -> Int {
        var start = 0
        var end = n.count
        while start < end {
            let mid = start + (end - start) / 2
            print(mid)
            print(start, end, n.count)
            if (n[mid] == target && left) || n[mid] > target {
                end = mid
            } else {
                start = mid + 1
            }
        }
        return start
    }

    func testExample() throws {
        XCTAssertEqual([0, 1], searchRange([2, 2], 2))
    }
}
