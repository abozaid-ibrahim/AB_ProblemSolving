//
//  LongestPalindrome.swift
//  Problems
//
//  Created by abuzeid on 24.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class LongestPalindrome: XCTestCase {
    func longestPalindrome(_ s: String) -> String {
        if s.count < 2 { return s }

        var res = (0, 0)
        let ar = Array(s)
        func maxy(_ r: (Int, Int)) {
            if r.0 - r.1 > res.0 - res.1 {
                res = r
            }
        }
        for i in 1 ... s.count / 2 {
            maxy(isPln(ar, i))
            maxy(isPln(ar, i, 1))
        }

        return s.subString(from: res.0, to: res.1)
    }

    func isPln(_ s: [Character], _ i: Int, _ diff: Int = 0) -> (Int, Int) {
        var left = i - diff
        var right = i
        while left >= 0 && right < i * 2 && s[left] == s[right] {
            left -= 1
            right += 1
        }

        return (left + 1, right - 1)
    }

    func testExample() throws {
        longestPalindrome("aba")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
