//
//  B.swift
//  AB_ProblemSolvingTests
//
//  Created by abuzeid on 22.01.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class FoundTownJudge: XCTestCase {
    func findJudge(_ N: Int, _ trust: [[Int]]) -> Int {
        var x: Set<Int> = Set()
        x.insert(5)
        let y = x
        
        

        if trust.isEmpty {
            if N < 2 {
                return 1
            } else {
                return -1
            }
        }
        var trCount = Int.min
        var judge = 0
        var dic: [Int: Int] = [:]
        for x in trust {
            let j = x[1]
            let v = (dic[j] ?? 0) + 1
            dic[j] = v
            if v > trCount {
                trCount = v
                judge = j
            }
        }

        guard trCount + 1 != N else { return -1 }
        for x in trust {
            if x[0] == judge {
                return -1
            }
        }
        return judge
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
