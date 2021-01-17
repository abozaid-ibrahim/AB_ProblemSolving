//
//  PrimesCount.swift
//  AB_ProblemSolvingTests
//
//  Created by abuzeid on 15.01.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class PrimesCount: XCTestCase {
    func countPrimes(_ n: Int) -> Int {
        var count = 0
        for i in 2 ..< n {
            count += isPrimary(i)
        }
        return count
    }

    func isPrimary(_ j: Int) -> Int {
        if j % 2 == 0 {
            return 0
        }
        if j == 2 {
            return 1
        }

        var i = 3
        while i * i < j {
            if j % i == 0 {
                return 0
            }
            i += 2
        }
        return 1
    }

    class Solution {
        func countPrimes(_ n: Int) -> Int {
            if n <= 2 {
                return 0
            }
            if n <= 3 {
                return 1
            }
            var p: [Int: Int] = [:] //

            var i = 2
            while i * i <= n {
                if isPrime(i) > 0 { // delete
                    for i in stride(from: i, to: n, by: i) {
                        p[i] = 0
                    }
                    p[i] = 1
                }

                i += 1
            }

            return p.filter { $0.value == 1 }.count
        }

        func isPrime(_ j: Int) -> Int {
            if j % 2 == 0 {
                return 0
            }
            if j == 2 {
                return 1
            }

            var i = 3
            while i * i < j {
                if j % i == 0 {
                    return 0
                }
                i += 2
            }
            return 1
        }
    }

    func testExample() throws {
        XCTAssertEqual(4, countPrimes(10))
        XCTAssertEqual(27, countPrimes(100))
    }
}
