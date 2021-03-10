//
//  pathSum.swift
//  Problems
//
//  Created by abuzeid on 22.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class pathSum: XCTestCase {
    func pathSum(_ nums: [Int]) -> Int {
        var output = Array(repeating: [Int](), count: 5)
        output[0] = [0]
        for n in nums {
            output[n / 100].append((n % 100) % 10)
        }
        print(output)
        for i in stride(from: output.count - 1, to: 0, by: -1) {
            if output[i].isEmpty { continue }
            var newVal: [Int] = Array(repeating: 0, count: output[i - 1].count)
            for j in 0 ..< output[i].count {
                let pCount = (output[i].count / output[i - 1].count)
                newVal[j / pCount] += output[i - 1][j / pCount] + output[i][j]
            }
            output[i - 1] = newVal
        }
        print(output)
        return output[0][0]
    }

    func testExample() throws {
       XCTAssertEqual(8,pow(2, 3))
        //pathSum([111, 217, 221, 315, 415])
    }
}
