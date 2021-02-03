//
//  Binary.swift
//  AB_ProblemSolvingTests
//
//  Created by abuzeid on 03.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class Binary: XCTestCase {
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        var num = nums
        return construct(&num, 0, nums.count - 1)
    }

    func construct(_ nums: inout [Int], _ left: Int, _ right: Int) -> TreeNode? {
        if left > right {
            return nil
        }
        let (i, mx) = maxy(&nums, left, right)
        let node = TreeNode(mx)

        node.left = construct(&nums, left, i - 1)
        node.right = construct(&nums, i + 1, right)
        return node
    }

    func maxy(_ nums: inout [Int], _ left: Int, _ right: Int) -> (i: Int, x: Int) {
        var mx = Int.min
        var i = -1
        for x in left ... right {
            if nums[x] > mx {
                mx = nums[x]
                i = x
            }
        }
        return (i, mx)
    }

    func testExample() throws {
    }
}
