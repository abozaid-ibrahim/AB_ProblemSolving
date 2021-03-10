//
//  CountServers.swift
//  AB_ProblemSolvingTests
//
//  Created by abuzeid on 12.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class CountServers: XCTestCase {
    func countServers(_ grid: [[Int]]) -> Int {
        var count = 0
        var cols = [Int](repeating: 0, count: grid[0].count)
        var rows = [Int](repeating: 0, count: grid.count)
        for r in 0 ..< grid.count {
            for c in 0 ..< grid[0].count {
                if grid[r][c] == 1 {
                    rows[r] += 1
                    cols[c] += 1
                }
            }
        }

        for r in 0 ..< grid.count {
            for c in 0 ..< grid[0].count {
                if grid[r][c] == 1 {
                    count += visit(r, c, grid, rows, cols) ? 1 : 0
                }
            }
        }
        return count
    }

    var dx = [0, 1, 0, -1]
    var dy = [1, 0, -1, 0]
    func visit(_ r: Int, _ c: Int, _ a: [[Int]], _ rows: [Int], _ cols: [Int]) -> Bool {
        if r < 0 || c < 0 || r >= a.count || c >= a[0].count {
            return false
        }
        if a[r][c] == 0 { return false }
        // check for neightbors
        if rows[r] > 1 || cols[c] > 1 {
            return true
        }

        for i in 0 ... 3 {
            let rr = dx[i] + i, cc = c + dy[i]
            if visit(rr, cc, a, rows, cols) {
                return true
            }
        }
        return false
    }

//    func countServers(_ grid: [[Int]]) -> Int {
//        var count = 0
//        for r in 0 ..< grid.count {
//            for c in 0 ..< grid[0].count {
//                if grid[r][c] == 1 {
//                    count += visit(r, c, grid) ? 1 : 0
//                }
//            }
//        }
//        return count
//    }
    ///// c : row
//    var rows:[Int:Int] = [:]
//    var cols:[Int:Int] = [:]
//    var dx = [0, 1, 0, -1]
//    var dy = [1, 0, -1, 0]
//    func visit(_ r: Int, _ c: Int, _ a: [[Int]]) -> Bool {
//        if r < 0 || c < 0 || r >= a.count || c >= a[0].count {
//            return false
//        }
//        if a[r][c] == 0 { return false }
//        // check for neightbors
//        if (rows[r] != c) || (cols[c] != r) {
//            rows[r] = Int.max
//            cols[c] = Int.max
//            return true
//        }
//        if rows[r] != Int.max{
//            rows[r] = c
//        }
//        if cols[c] != Int.max{
//            cols[c] = r
//        }
//        for i in 0 ... 3 {
//            let rr = dx[i] + i, cc = c + dy[i]
//            if visit(rr, cc, a) {
//                return true
//            }
//        }
//        return false
//    }

    func testExample() throws {
        XCTAssertEqual(3, countServers([[1, 0], [1, 1]]))
    }
}
