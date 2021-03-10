//
//  FlipTree.swift
//  AB_ProblemSolvingTests
//
//  Created by abuzeid on 10.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest


func minimumEffortPathDijkstra(_ heights: [[Int]]) -> Int {
    let n = heights.count
    guard let m = heights.first?.count else { return -1 }
    var efforts = Array(repeating: Array(repeating: Int.max, count: m), count: n)
    efforts[0][0] = 0
    var queue = [(0, 0)]
    let dx = [0, 1, 0, -1]
    let dy = [1, 0, -1, 0]
    while !queue.isEmpty {
        let (x, y) = queue.removeFirst()
        for index in 0 ..< dx.count { // move in the 4 directions
            let xx = x + dx[index]
            let yy = y + dy[index]
            guard xx >= 0, xx < n, yy >= 0, yy < m else { continue }
            /// compare effort to reach current cell with the effort of parent to keep track with the Max effort in this path.
            let newEffort = max(efforts[x][y], abs(heights[xx][yy] - heights[x][y]))
            if newEffort >= efforts[xx][yy] { continue } /// get shortest path for every singl cell
            efforts[xx][yy] = newEffort
            queue.append((xx, yy))
        }
    }
    // O(MNLog(M*N))
    return efforts[n - 1][m - 1]
}

func minimumEffortPathUnionFind(_ heights: [[Int]]) -> Int {
    let ncols = heights[0].count
    let nrows = heights.count
    guard ncols > 1 || nrows > 1 else { return 0 }
    var parent = Array(0 ..< ncols * nrows)

    // Find with Path compression
    func find(_ x: Int) -> Int {
        if parent[x] != x {
            parent[x] = find(parent[x])
        }
        return parent[x]
    }

    func union(_ x: Int, _ y: Int) {
        let pX = find(x)
        let pY = find(y)

        if pX != pY {
            parent[pX] = pY
        }
    }

    var edges = [[Int]]()
    for i in 0 ..< nrows {
        for j in 0 ..< ncols {
            for (r, c) in [(0, 1), (1, 0)] {
                let nr = i + r
                let nc = j + c
                if nr < nrows && nc < ncols {
                    edges.append([i * ncols + j, nr * ncols + nc, abs(heights[i][j] - heights[nr][nc])])
                }
            }
        }
    }

    edges.sort { $0[2] > $1[2] }

    while let edge = edges.popLast() {
        union(edge[0], edge[1])

        if find(0) == find(nrows * ncols - 1) {
            return edge[2]
        }
    }

    return 0
}

class Bin: XCTestCase {
    func testB() {
        Solution1().minimumEffortPath([[1, 10, 6, 7, 9, 10, 4, 9]])
    }
}
class Solution1 {
    func minimumEffortPath(_ heights: [[Int]]) -> Int {
        var start = 0
        var end = 1000000
        while start < end {
            let mid = start + (end - start) / 2
                    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: heights[0].count), count: heights.count)

            if hasPath(0, 0, heights, &visited, mid) {
                end = mid
            } else {
                start = mid + 1
            }
        }
        return start
    }

    var dr = [[1,0], [-1,0],[0,1], [0,-1]]

    func hasPath(_ y: Int, _ x: Int, _ heights: [[Int]], _ visited: inout [[Bool]], _ power: Int) -> Bool {
    
        if x == heights[0].count - 1 && y == heights.count - 1 {
            return true
        }
        visited[y][x] = true
        for d in dr {
            let yy = y + d[1]
            let xx = x + d[0]
               if yy < 0 || xx < 0 || xx >= heights[0].count || yy >= heights.count  { continue}
        
            if visited[yy][xx] || abs(heights[y][x] - heights[yy][xx] ) > power { continue }
        
            
            if hasPath(yy, xx, heights, &visited, power) {
                return true
            }
        }

        return false
    }
}
