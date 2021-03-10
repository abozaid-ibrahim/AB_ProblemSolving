//
//  CityRank.swift
//  AB_ProblemSolvingTests
//
//  Created by abuzeid on 12.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class CityRank: XCTestCase {
    func maximalNetworkRank(_ n: Int, _ roads: [[Int]]) -> Int {
        var mx = [Int](repeating: 0, count: n + 1)
        var conn = [[Bool]](repeating: Array(repeating: false, count: n), count: n)
        for (i, road) in roads.enumerated() {
            mx[road[0]] += 1
            mx[road[1]] += 1
            conn[road[0]][road[1]] = true
            conn[road[1]][road[0]] = true
        }
        // get biggest two connected

        var res = Int.min
        for i in 0 ..< n {
            for j in 0 ..< n {
                if i == j { continue }
                if conn[i][j] || conn[i][j] { // are connected {  //max sum }
                    let sum = mx[i] + mx[j]
                    res = max(sum, res)
                }
            }
        }
        return res - 1
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}
