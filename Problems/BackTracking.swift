//
//  BackTracking.swift
//  Problems
//
//  Created by abuzeid on 02.03.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class BackTracking: XCTestCase {
    func maxLength(_ arr: [String]) -> Int {
        if arr.count <= 1 { return arr.first?.count ?? 0 }
        let input:[Set<Character>] = arr.compactMap {
            let set = Set($0)
            return $0.count == set.count ? set : nil
        }
        
        return pick(0, input, Set())
    }

    var dic = [Set<Character>: Int]()
    func pick(_ i: Int, _ a: [Set<Character>], _ sum: Set<Character>) -> Int {
        guard i < a.count else { return sum.count }
        if let v = dic[sum] {
            return v
        }
        let output = sum.union(a[i])
        var big = 0
        if output.count == sum.count + a[i].count {
            big = pick(i + 1, a, output)
        }
        big = max(big, pick(i + 1, a, a[i]), pick(i + 1, a, sum))
        dic[sum] = big
        
        return big
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
