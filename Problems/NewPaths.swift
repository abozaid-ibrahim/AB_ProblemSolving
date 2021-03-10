//
//  NewPaths.swift
//  Problems
//
//  Created by abuzeid on 19.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class NewPaths: XCTestCase {
    var c = 0
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        move(1, 1, m, n)
        return c
    }

    func move(_ i: Int, _ j: Int, _ m: Int, _ n: Int) {
        if i == m && j == n {
            c += 1
            return
        }
        // for d in [[1, 0], [-1, 0], [0, 1], [0, -1]] {
        if i < m { move(i + 1, j, m, n) }

        if i > 1 { move(i - 1, j, m, n) }
        if j < n { move(i, j + 1, m, n) }
        if j > 1 { move(i, j - 1, m, n) }
    }

    func testExample() throws {
        //uniquePaths(7, 3)
    }
}
