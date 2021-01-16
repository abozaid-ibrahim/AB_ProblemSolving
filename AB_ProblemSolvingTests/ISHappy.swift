//
//  ISHappy.swift
//  AB_ProblemSolvingTests
//
//  Created by abuzeid on 15.01.21.
//  Copyright © 2021 ab. All rights reserved.
//

import Foundation
import XCTest

class ISHappy: XCTestCase {
    class Solution {
        var dic: [Int: Int] = [:]
        func isHappy(_ n: Int) -> Bool {
            if n == 1 {
                return true
            }
            guard dic[n] == nil else {
                return false
            }
            dic[n] = 1
            var sum: Double = 0
            for i in String(n) {
                guard let val = Int("\(i)") else {
                    break
                }
                let pwl = val > 0 ? pow(Double(val), 2) : 0
                sum += pwl
            }

            if sum == 1 {
                return true
            }
            return isHappy(Int(sum))
        }
    }

    func test() {
        Solution().isHappy(19)
    }
}
