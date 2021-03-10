//
//  DetectCycle.swift
//  AB_ProblemSolvingTests
//
//  Created by abuzeid on 13.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class DetectCycle: XCTestCase {
    var visited = Set<Int>()
    func eventualSafeNodes(_ graph: [[Int]]) -> [Int] {
        var output: [Int] = []
        var nodes: [[Int]] = Array(repeating: [Int](), count: graph.count)
        for edge in 0 ..< graph.count {
            for out in graph[edge] {
                nodes[edge].append(out)
            }
        }
        print(nodes)
        for i in 0 ..< nodes.count {
            visited = Set<Int>()
            if !visit(i, i, nodes) {
                output.append(i)
            }
        }
        return output
    }

    func visit(_ c: Int, _ source: Int, _ graph: [[Int]]) -> Bool {
        if visited.contains(c) {
            return false
        }
        visited.insert(c)

        for n in graph[c] {
            if n == source {
                return true
            }
            if visit(n, source, graph) {
                return true
            }
        }
        return false
    }

    func testExample() throws {
        XCTAssertEqual([2, 4, 5, 6], eventualSafeNodes([[1, 2], [2, 3], [5], [0], [5], [], []]))
    }

    func gardenNoAdj(_ N: Int, _ paths: [[Int]]) -> [Int] {
        if paths.count == 0 { return Array(repeating: 1, count: N) }
        var outPaths: [[Int]] = Array(repeating: [Int](), count: N)

        for path in paths {
            outPaths[path[0]].append(path[1])
            outPaths[path[1]].append(path[0])
        }

        var colors = Array(repeating: 0, count: N)
        for i in 1 ... N {
            var choices = Set(Range(1 ... 4))
            for neighbor in outPaths[i] {
                // remove my neighbors choices
                choices.remove(colors[neighbor - 1])
            }
            colors[i - 1] = choices.popFirst()!
        }
        return colors
    }
}
