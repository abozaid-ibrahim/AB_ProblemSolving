//
//  SecondMinimuimBinaryTree.swift
//  AB_ProblemSolvingTests
//
//  Created by abuzeid on 24.01.21.
//  Copyright © 2021 ab. All rights reserved.
//

import Foundation
class Solution {
    func findSecondMinimumValue(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return -1
        }
        var second: Int = Int.max
        findMin(root, root.val, &second)
        return second == Int.max ? -1 : second
    }

    func findMin(_ node: TreeNode?, _ mn: Int, _ second: inout Int) {
        guard let node = node else { return }
        if node.val > mn && node.val < second {
            second = node.val
        }
        findMin(node.left, mn, &second)
        findMin(node.right, mn, &second)
    }
}
