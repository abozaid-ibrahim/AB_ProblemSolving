//
//  WordSearch.swift
//  Problems
//
//  Created by abuzeid on 24.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class WordSearch: XCTestCase {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        guard !word.isEmpty && !board.isEmpty else { return false }
        for r in 0 ..< board.count {
            for c in 0 ..< board[0].count {
                guard board[r][c] == word.first else { continue }
                var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
                if dfs(r, c, board, word, &visited) {
                    return true
                }
            }
        }
       
        return false
    }

    func dfs(_ i: Int, _ j: Int, _ b: [[Character]], _ target: String, _ visit: inout [[Bool]]) -> Bool {
        if target.isEmpty {
            return true
        }
        guard i >= 0, j >= 0, i < b.count, j < b[0].count, !visit[i][j] else { return false }
        guard b[i][j] == target.first else { return false }
        for d in [[1, 0], [-1, 0], [0, 1], [0, -1]] {
            if dfs(i + d[0], j + d[1], b, String(target.suffix(target.count - 1)), &visit) {
                return true
            }
        }
        visit[i][j] = true

        return false
    }

    func testExample() throws {
        XCTAssertEqual(exist([["a", "b"], ["c", "d"]], "cdba"), true)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
