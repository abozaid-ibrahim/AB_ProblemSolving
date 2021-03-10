//
//  Sya.swift
//  Problems
//
//  Created by abuzeid on 25.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class Sya: XCTestCase {
    class Solution {
        func numberToWords(_ num: Int) -> String {
            if num <= 9 { return s1d[num] }
            // 2^31-1 = 2,147,483,648
            let unitAry = ["", " Thousand", " Million", " Billion"]
            var numAry: [Int] = [Int]()
            var current = num
            while current > 0 {
                numAry.append(current % 1000)
                current = current / 1000
            }
            var res = ""
            for i in 0 ..< numAry.count {
                if numAry[i] == 0 { continue }
                res = s3d(numAry[i]) + unitAry[i] + res
            }

            if Array(res).first == Character(" ") {
                res.remove(at: res.startIndex)
            }

            return res
        }

        // convert 3-digit num to string
        private func s3d(_ num: Int) -> String {
            var res = ""
            var digit = num / 100 // get number for hundred
            res += s1d[digit] + (digit == 0 ? "" : " Hundred")
            digit = num % 100 // get two digit
            res += s2d(digit)
            return res
        }

        // convert 2-digit num to string
        private func s2d(_ num: Int) -> String {
            let d2 = num / 10
            let d1 = num % 10
            if d2 == 0 { return s1d[d1] }
            var res = ""
            if d2 > 1 {
                switch d2 {
                case 2: res = " Twenty"
                case 3: res = " Thirty"
                case 4: res = " Forty"
                case 5: res = " Fifty"
                case 6: res = " Sixty"
                case 7: res = " Seventy"
                case 8: res = " Eighty"
                case 9: res = " Ninety"
                default: res = ""
                }
                return res + s1d[d1]
            }
            switch num {
            case 10: return " Ten"
            case 11: return " Eleven"
            case 12: return " Twelve"
            case 13: return " Thirteen"
            case 14: return " Fourteen"
            case 15: return " Fifteen"
            case 16: return " Sixteen"
            case 17: return " Seventeen"
            case 18: return " Eighteen"
            case 19: return " Nineteen"
            default: return ""
            }
        }

        // convert 1-digit num to string
        private var s1d = ["Zero",
                           " One",
                           " Two",
                           " Three",
                           " Four",
                           " Five",
                           " Six",
                           " Seven",
                           " Eight",
                           " Nine"]
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
