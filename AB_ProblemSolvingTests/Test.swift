//
//  Test.swift
//  AB_ProblemSolvingTests
//
//  Created by abuzeid on 23.01.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class Test: XCTestCase {
    func minDepth(_ root: TreeNode?) -> Int {
        var arr: [TreeNode] = []
        var ch: [TreeNode] = []
        guard let node = root else { return 0 }
        var level = 1
        arr.append(node)
        while !arr.isEmpty || !ch.isEmpty {
            let item = arr.popLast()
            if item?.left == nil && item?.right == nil {
                return level
            }
            if let right = item?.right {
                ch.append(right)
            }
            if let left = item?.left {
                ch.append(left)
            }
            if arr.isEmpty {
                level += 1
                arr = ch
                ch = []
            }
        }

        return 0
    }

    func dfs(_ node: TreeNode?, _ steps: Int) -> Int {
        if node == nil {
            return steps
        }
        if node?.left == nil && node?.right == nil {
            return steps + 1
        }
        if node?.right == nil {
            return dfs(node?.left, steps + 1)
        }
        if node?.left == nil {
            return dfs(node?.right, steps + 1)
        }
        return min(dfs(node?.left, steps + 1), dfs(node?.right, steps + 1))
    }
}
