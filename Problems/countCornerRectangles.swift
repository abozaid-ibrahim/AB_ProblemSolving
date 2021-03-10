//
//  countCornerRectangles.swift
//  Problems
//
//  Created by abuzeid on 09.03.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class countCornerRectangles: XCTestCase {
    class Solution {
        func countCornerRectangles(_ grid: [[Int]]) -> Int {
            var count = 0
            print(">>>>", grid.indices, grid[0].indices)
            for i in 0 ..< grid.count {
                for j in (i + 1) ..< grid.count {
                    var counter = 0
                    for k in 0 ..< grid[0].count {
                        if grid[i][k] == 1 && grid[j][k] == 1 { counter += 1 }
                    }
                    if counter > 0 { count += counter * (counter - 1) / 2 }
                }
            }
            return count
        }
    }

    func matrixBlockSum(_ mat: [[Int]], _ K: Int) -> [[Int]] {
        let nRows = mat.count, nCols = mat[0].count

        // Integeral Image//{\displaystyle I(x,y)=i(x,y)+I(x,y-1)+I(x-1,y)-I(x-1,y-1)\,}
        var sum = Array(repeating: Array(repeating: 0, count: nCols + 1), count: nRows + 1)
        for i in 1 ..< nRows {
            for j in 1 ..< nCols {
                sum[i][j] = mat[i][j] + sum[i - 1][j] + sum[i][j - 1] - sum[i - 1][j - 1]
            }
        }
        print(sum)
        var res = Array(repeating: Array(repeating: 0, count: nCols), count: nRows)
        for i in 0 ..< nRows {
            for j in 0 ..< nCols {
                let minR = max(0, i - K), maxR = min(i + K, nRows - 1), minC = max(0, j - K), maxC = min(j + K, nCols - 1)
                res[i][j] = sum[maxR + 1][maxC + 1] + sum[minR][minC] - sum[maxR + 1][minC] - sum[minR][maxC + 1]
            }
        }
        return res
    }

    func testExample() throws {
        Solution().countCornerRectangles([[1, 2, 3], [2, 3, 4]])
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}
