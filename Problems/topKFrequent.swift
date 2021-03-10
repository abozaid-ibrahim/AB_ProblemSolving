//
//  FreqKNumber.swift
//  Problems
//
//  Created by abuzeid on 19.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class TopKFrequent: XCTestCase {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        if k == 0 || nums.isEmpty { return [] }

        var output = [Int: Int]()
        for i in nums {
            output[i, default: 0] += 1
        }

        return Array(output.sorted { $0.value > $1.value }[0 ..< k]).map { $0.key }
    }

    func testExample() throws {
    }
}
