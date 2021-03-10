//
//  LargestIsland.swift
//  Problems
//
//  Created by abuzeid on 06.03.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class LargestIsland: XCTestCase {
    class Solution {
        func largestIsland(_ grid: [[Int]]) -> Int {
            var mx = 0
            for i in 0 ..< grid.count {
                for j in 0 ..< grid[0].count {
                    if grid[i][j] == 0 {
                        var copy = grid
                        copy[i][j] = 1

                        mx = max(mx, dfs(i, j, &copy))
                    }
                }
            }

            return mx
        }

        func dfs(_ r: Int, _ c: Int, _ g: inout [[Int]]) -> Int {
            guard r < g.count,
                  r >= 0,
                  c < g[0].count,
                  c >= 0 else { return 0 }
            guard g[r][c] == 1 else { return 0 }
            g[r][c] = 0
            return 1 + dfs(r + 1, c, &g) + dfs(r - 1, c, &g) + dfs(r, c + 1, &g) + dfs(r, c - 1, &g)
        }
    }

    func testExample() throws {
        Solution().largestIsland([[1, 0], [0, 1]])
    }
}
