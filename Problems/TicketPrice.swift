//
//  TicketPrice.swift
//  Problems
//
//  Created by abuzeid on 23.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class TicketPrice: XCTestCase {
    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        guard let last = days.last else { return 0 }

        var minCosts = Array(repeating: 0, count: last + 1)
        for day in days {
            if minCosts[day] == 0 {
                minCosts[day] = minCosts[day - 1]
            }

            let oneDayCost = costs[0] + minCosts[day - 1]
            let sevenDaysCost = costs[1] + (day - 7 >= 0 ? minCosts[day - 7] : 0)
            let thirtyDaysCost = costs[2] + (day - 30 >= 0 ? minCosts[day - 30] : 0)
            minCosts[day] = min(oneDayCost, sevenDaysCost, thirtyDaysCost)
        }

        return minCosts.last!
    }

    func testExample() throws {
        mincostTickets([1, 2, 3, 4, 6, 9, 22, 231], [2, 7, 7])
    }
}

extension Sequence {
    func sum<T: AdditiveArithmetic>(_ predicate: (Element) -> T) -> T { reduce(.zero) { $0 + predicate($1) } }
}

extension Sequence where Element == Float {
    func sum() -> Float {
        var sum: Float = 0
        for i in self {
            sum += i
        }
        return sum
    }
}
