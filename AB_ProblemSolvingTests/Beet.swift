//
//  Beet.swift
//  AB_ProblemSolvingTests
//
//  Created by abuzeid on 30.01.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class Beet: XCTestCase {
    var dic: [Int: Int] = [:]
    var c:Int = 0
    func countSum(_ nums: [Int], _ target: Int, _ index: Int, _ sum: Int) -> Int {
        if index == nums.count {
            return sum == target ? 1 : 0
        }
      
        
        let row = index * c + sum
        if let obj = dic[row] {
            return obj
        }
        let add = countSum(nums, target, index + 1, sum + nums[index])
        let sub = countSum(nums, target, index + 1, sum - nums[index])
        dic[row] = add + sub

        return dic[row]!
    }

    public class Node {
        public var val: Int
        public var neighbors: [Node?]
        public init(_ val: Int) {
            self.val = val
            neighbors = []
        }
    }

    var visited: [Int: Node?] = [:]
    func cloneGraph(_ node: Node?) -> Node? {
        guard node != nil else { return nil }
        var root = copy(node)
        return root
    }

    func copy(_ n: Node?) -> Node? {
        if n == nil { return nil }
        if let obj = visited[n!.val] { return obj }

        let node = Node(n!.val)
        visited[n!.val] = node

        for nd in node.neighbors {
            if let clonedNode = visited[node.val],
               let child = copy(nd) {
                clonedNode?.neighbors.append(child)
                visited[node.val] = clonedNode
                visited[child.val] = child
            }
        }

        return node
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
