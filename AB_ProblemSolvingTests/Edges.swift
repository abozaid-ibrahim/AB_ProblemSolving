//
//  Edges.swift
//  AB_ProblemSolvingTests
//
//  Created by abuzeid on 08.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class Edges: XCTestCase {
    // [[0,1,3],[1,2,1],   [1,3,4],    [2,3,1]]
    //
    func findTheCity(_ n: Int, _ edges: [[Int]], _ distanceThreshold: Int) -> Int {
        var neighbors = Array(repeating: [Int](), count: n + 1)

        for vIndex in 0 ..< edges.count {
            let edge = edges[vIndex]
            if edge[2] <= distanceThreshold {
                neighbors[edge[0]].append(edge[2])
                neighbors[edge[1]].append(edge[2])
            }
        }
        var mn = Int.max
        for v in neighbors {
            var sum = v.reduce(0,+)
            mn = min(sum, mn)
        }
        return mn
    }

    func testExample() throws {
        XCTAssertEqual(findTheCity(4, [[0, 1, 3], [1, 2, 1], [1, 3, 4], [2, 3, 1]], 4), 4)
    }

   
}
