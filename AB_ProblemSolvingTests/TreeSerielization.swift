//
//  TreeSerielization.swift
//  AB_ProblemSolvingTests
//
//  Created by abuzeid on 14.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class TreeSerielization: XCTestCase {
    class Codec {
        var arr: [Int: Int?] = [:]
        func serialize(_ root: TreeNode?) -> String {
            guard let n = root else { return "" }
            // arr = Array()
            dfs(n, 0)

            let out = arr.sorted { $0.key < $1.key }.map { $0.value == nil ? "N" : "\($0.value!)" }.joined(separator: ",")
            print(out)
            return out
        }

        func dfs(_ n: TreeNode?, _ i: Int) {
            arr[i] = n?.val
            if let lft = n?.left {
                dfs(lft, l(i))
            } else {
                arr[l(i)] = nil
            }
            if let right = n?.right {
                dfs(right, r(i))
            } else {
                arr[r(i)] = nil
            }
        }

        func p(_ i: Int) -> Int {
            return (i - 1) / 2
        }

        func l(_ i: Int) -> Int {
            return (i / 2) + 1
        }

        func r(_ i: Int) -> Int {
            return (i / 2) + 2
        }

        func deserialize(_ data: String) -> TreeNode? {
            let resu = data.split(separator: ",").map { Int($0) }
            print(resu)
            return build(0, resu)
        }

        func build(_ i: Int, _ arr: [Int?]) -> TreeNode? {
            guard i < arr.count else { return nil }
            guard let val = arr[i] else { return nil }
            let node = TreeNode(val)
            node.left = build(l(i), arr)
            node.right = build(r(i), arr)
            return node
        }
    }

    func testExample() throws {
        XCTAssertEqual(nil, Codec().deserialize("[1,2,3,nil,nil,4,5]"))
    }
}
