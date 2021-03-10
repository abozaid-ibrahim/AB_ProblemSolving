//
//  DistanceFromK.swift
//  AB_ProblemSolvingTests
//
//  Created by abuzeid on 13.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest
extension TreeNode: Hashable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.val == rhs.val
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
    }
}

class DistanceFromK: XCTestCase {
    var par = [TreeNode: TreeNode]()
    func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ K: Int) -> [Int] {
        guard let node = root,
              let tar = target else { return [] }
        dfs(node)

        var dist = 0
        var queue: [TreeNode] = [tar]
        var visited = Set<TreeNode>()
        while !queue.isEmpty && dist != K {
            for i in 0 ..< queue.count {
                let node = queue.removeFirst()

                if let left = node.left, !visited.contains(left) {
                    visited.insert(left)
                    queue.append(left)
                }
                if let right = node.right,!visited.contains(right) {
                    visited.insert(right)
                    queue.append(right)
                }
                if let p = par[node],!visited.contains(p) {
                    visited.insert(p)
                    queue.append(p)
                }
            }
            dist += 1
        }

        return queue.compactMap { $0.val }
    }

    func dfs(_ n: TreeNode) {
        if let left = n.left {
            par[left] = n
            dfs(left)
        }
        if let right = n.right {
            par[right] = n
            dfs(right)
        }
    }

    func testExample() throws {
        distanceK(nil, nil, 1)
    }
}
