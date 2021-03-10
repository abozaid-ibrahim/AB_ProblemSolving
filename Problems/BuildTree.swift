//
//  BuildTree.swift
//  Problems
//
//  Created by abuzeid on 20.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class BuildTree: XCTestCase {
    class Solution {
        func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
            return build(preorder, inorder)
        }

        var i = 0
        func build(_ a: [Int], _ n: [Int]) -> TreeNode? {
            if n.isEmpty { return nil }
            guard i < a.count else { return nil }
            let root = TreeNode(a[i])
            i += 1
            guard let first = a.firstIndex(of: a[i]) else { return nil }
            
            root.left = build(a, Array(n[..<first]))
            root.right = build(a, Array(n[first...]))
            return root
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
