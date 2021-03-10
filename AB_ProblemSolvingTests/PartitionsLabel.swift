//
//  PartitionsLabel.swift
//  AB_ProblemSolvingTests
//
//  Created by abuzeid on 12.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class PartitionsLabel: XCTestCase {
    class Solution {
        func permute(_ nums: [Int]) -> [[Int]] {
            var res: [[Int]] = []
            for i in 0 ..< nums.count {
                res += dfs([], i, 0, nums)
            }
            return res
        }

        func dfs(_ sum: [Int], _ i: Int, _ level: Int, _ nums: [Int]) -> [[Int]] {
            if level == nums.count - 1 {
                return [sum + [nums[i]]]
            }
            var newS = sum
            newS.append(nums[i])
            var res: [[Int]] = []

            for n in 0 ..< nums.count {
                if n == i || newS.contains(nums[n]) { continue }
                res += dfs(newS, n, level + 1, nums)
            }
            return res
        }
    }

    func partitionLabels(_ S: String) -> [Int] {
        var dic: [String.Element: Int] = [:]
        for c in S {
            dic[c, default: 0] += 1
        }
        var stack: [String.Element: Bool] = [:]
        var parts: [Int] = []
        var prev = -1

        for (i, v) in S.enumerated() {
            if stack[v] != nil {
                stack[v] = true
            }
            dic[v, default: 0] -= 1
            if dic[v] == 0 {
                stack[v] = false
            }
            if stack.values.allSatisfy({ $0 == false }) {
                stack = [:]
                parts.append(i - prev)
                prev = i
            }
        }

        return parts
    }

    func partitionLabels1(_ S: String) -> [Int] {
        var dic: [String.Element: Int] = [:]
        for c in S {
            dic[c, default: 0] += 1
        }
        var stack: Set<String.Element> = Set()
        var parts: [Int] = []
        var prev = 0

        for (i, v) in S.enumerated() {
            if !stack.contains(v) {
                stack.insert(v)
            }
            dic[v, default: 0] -= 1
            if dic[v] == 0 {
                stack.remove(v)
            }
            if stack.isEmpty {
                parts.append(i - prev + 1)
                prev = i
            }
        }

        return parts
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
