//
//  RotatedArray.swift
//  Problems
//
//  Created by abuzeid on 24.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class RotatedArray: XCTestCase {
    class Solution {
        func search(_ nums: [Int], _ target: Int) -> Int {
            if nums.isEmpty { return -1 }
            var pivot = -1
            func findPivot() {
                var start = 0
                var end = nums.count - 1
                while start <= end {
                    let mid = start + (end - start) / 2
                    if nums[start] < nums[mid] {
                        start = mid
                    } else if start == mid && nums[mid] > nums[end] {
                        pivot = end
                        break
                    } else {
                        end = mid
                    }
                }
            }
            if nums.first! > nums.last! {
                findPivot()
            }

            if pivot >= 0 {
                let i = find(Array(nums[0 ..< pivot]), target)
                let j = find(Array(nums[pivot ..< nums.count]), target)
                return max(i, j + pivot)
            } else {
                return find(nums, target)
            }
        }

        func find(_ nums: [Int], _ target: Int) -> Int {
            print(nums)
            if nums.isEmpty { return -1 }
            var start = 0
            var end = nums.count - 1
         
            while start <= end {
                let mid = start + (end - start) / 2
                if nums[mid] == target {
                    return mid
                } else if nums[mid] < target {
                    start = mid + 1
                } else {
                    end = mid - 1
                }
            }
            print(start,end)
            return -1
        }
    }

    func testExample() throws {
       // XCTAssertEqual(4, Solution().search([4, 5, 6, 7, 0, 1, 2], 0))
        XCTAssertEqual(1, Solution().find([1,2], 2))
        XCTAssertEqual(-1, Solution().find([0, 1, 2], 3))
        

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
