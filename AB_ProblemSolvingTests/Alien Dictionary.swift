//
//  Alien Dictionary.swift
//  AB_ProblemSolvingTests
//
//  Created by abuzeid on 28.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class Alien_Dictionary: XCTestCase {
    class Solution {
        func alienOrder(_ words: [String]) -> String {
            var graph = [Character: Set<Character>]()
            var degree = [Character: Int]()
            words.forEach { word in
                word.forEach { char in
                    degree[char] = 0
                }
            }

            // Build graph
            for i in 0 ..< words.count - 1 {
                let word1 = Array(words[i]), word2 = Array(words[i + 1])
                var differenceFound = false
                for j in 0 ..< min(word1.count, word2.count) {
                    let char1 = word1[j], char2 = word2[j]
                    guard char1 != char2 else {
                        continue
                    }
                    differenceFound = true
                    if !graph[char1, default: Set<Character>()].contains(char2) {
                        graph[char1, default: Set<Character>()].insert(char2)
                        degree[char2, default: 0] += 1
                    }
                    break
                }
                if !differenceFound && word1.count > word2.count {
                    return ""
                }
            }

            // BFS
            var queue = [Character]()
            for (key, value) in degree {
                if value == 0 {
                    queue.append(key)
                }
            }

            var res = ""
            while !queue.isEmpty {
                let cur = queue.removeFirst()
                res += String(cur)
                for nei in graph[cur, default: Set<Character>()] {
                    degree[nei, default: 0] -= 1
                    if degree[nei] == 0 {
                        queue.append(nei)
                    }
                }
            }

            return res.count == degree.count ? res : ""
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

class Solution13 {
    func alienOrder(_ words: [String]) -> String {
        if words.isEmpty { return "" }
        let wordsArr = words.map { Array($0) }
        let graph = buildGraph(wordsArr)

        var stack = [Character]()
        var visited = [Character: Bool]()
        for word in wordsArr {
            for char in word {
                guard dfs(char, graph, &stack, &visited) else { // if detect a cycle.
                    return ""
                }
            }
        }

        return String(stack.reversed())
    }

    func dfs(_ char: Character, _ graph: [Character: Set<Character>], _ order: inout [Character], _ visited: inout [Character: Bool]) -> Bool {
        if let hasVisited = visited[char] {
            return hasVisited
        }

        visited[char] = false // we mark it false to detect a sycle

        for edge in graph[char] ?? [] {
            guard dfs(edge, graph, &order, &visited) else {
                return false
            }
        }

        visited[char] = true
        order.append(char)

        return true
    }

    func buildGraph(_ words: [[Character]]) -> [Character: Set<Character>] {
        var graph = [Character: Set<Character>]()

        for i in 0 ..< words.count - 1 {
            let word1 = words[i]
            let word2 = words[i + 1]
            var hasDiff = false

            for j in 0 ..< min(word1.count, word2.count) {
                if word1[j] == word2[j] {
                    continue
                } else {
                    hasDiff = true
                    graph[word1[j], default: []].insert(word2[j])
                    break
                }
            }
            if hasDiff == false && word1.count > word2.count {
                return [:]
            }
        }

        return graph
    }
}

class Solution {
    func maxPathSum(_ root: TreeNode?) -> Int {
        guard let n = root else { return 0 }
        return visit(n)
    }

    func visit(_ node: TreeNode?) -> Int {
        guard let node = node else { return Int.min }

        let left = visit(node.left)
        let right = visit(node.right)
        if right == Int.min || left == Int.min {
            let s = right == Int.min ? left : right
            return max(node.val + s, node.val)
        }
        let childs = max(right + left, right, left)
        return max(node.val + childs, node.val)
    }
}
