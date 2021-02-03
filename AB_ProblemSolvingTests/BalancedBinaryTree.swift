//
//  BalancedBinaryTree.swift
//  AB_ProblemSolvingTests
//
//  Created by abuzeid on 26.01.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class BalancedBinaryTree: XCTestCase {
    var dic: [Int: Int] = [:]
    var mx = Int.min
    func findMode(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        let newV = (dic[root!.val] ?? 0) + 1
        dic[root!.val] = newV
        mx = max(mx, newV)
        findMode(root?.left)
        findMode(root?.right)

        return dic.compactMap { $0.value == mx ? $0.key : nil }
    
    }

    class Solution {
        func isBalanced(_ root: TreeNode?) -> Bool {
            if root == nil {
                return true
            }
            let allowedDiff = abs(depth(root?.left) - depth(root?.right)) <= 1
            return allowedDiff && isBalanced(root?.left) && isBalanced(root?.right)
        }

        func depth(_ node: TreeNode?) -> Int {
            if node == nil { return 0 }
            return max(depth(node?.left), depth(node?.right)) + 1
        }
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
