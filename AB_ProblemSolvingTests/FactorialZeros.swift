//
//  FactorialZeros.swift
//  AB_ProblemSolvingTests
//
//  Created by abuzeid on 20.01.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class FactorialZeros: XCTestCase {
    func trailingZeroes(_ n: Int) -> Int {
        var ret = 0

        var inputValue = n
        while inputValue > 0 {
            inputValue /= 5
            ret += inputValue
        }

        return ret
    }

    func validMountainArray(_ arr: [Int]) -> Bool {
        var inc = false
        var dec = false
        for i in 1 ..< arr.count {
            if arr[i] > arr[i - 1] && !dec {
                inc = true
            } else if arr[i] < arr[i - 1] && inc {
                dec = true
            } else {
                return false
            }
        }
        return dec && inc
    }

    func testExample() throws {
        trailingZeroes(5)
    }
}
