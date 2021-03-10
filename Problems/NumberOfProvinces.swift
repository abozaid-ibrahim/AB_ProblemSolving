//
//  NumberOfProvinces.swift
//  Problems
//
//  Created by abuzeid on 04.03.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class NumberOfProvinces: XCTestCase {
    class Solution {
        func findCircleNum(_ isConnected: [[Int]]) -> Int {
            var tree = Array(repeating: [Int](), count: isConnected.count)
            for i in 0 ..< isConnected.count {
                for j in 0 ..< isConnected.count {
                    guard j != i, isConnected[i][j] == 1 else { continue }
                    tree[i].append(j)
                }
            }
            var visited = Set<Int>()
            var queue = [Int]()
            var count = 0

            for node in tree {
                guard let root = node.first, !visited.contains(root) else{ continue }
                count += 1
                queue.append(root)
                while !queue.isEmpty {
                    let parent = queue.removeLast()
                    visited.insert(parent)
                    for child in tree[parent] {
                        if !visited.contains(child) {
                            queue.append(child)
                        }
                    }
                }
            }

            return count
        }
    }

    func testExample() throws {
       XCTAssertEqual( Solution().findCircleNum([[1,1,0],[1,1,0],[0,0,1]]), 2)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
