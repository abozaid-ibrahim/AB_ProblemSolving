//
//  Next.swift
//  Problems
//
//  Created by abuzeid on 07.03.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class Next: XCTestCase {
    class MovingAverage {
        // 12445678
        /** Initialize your data structure here. */
        let w: Int
        var cache = [Int]()
        init(_ size: Int) {
            w = size
        }

        func next(_ val: Int) -> Double {
            cache.append(val)
           
            var c = w
            var sum = 0
            for i in stride(from: cache.count - 1, through: 0, by: -1) {
                sum += cache[i]
                c -= 1
                if c == 0 { break }
            }
            return Double(sum) / Double(w)
        }
    }

    func testExample() throws {
        let x = MovingAverage(3)
        x.next(2)
        x.next(1)
        x.next(5)
    }
}
