//
//  ThirdMax.swift
//  AB_ProblemSolvingTests
//
//  Created by abuzeid on 18.01.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class ThirdMax: XCTestCase {
    func thirdMax(_ nums: [Int]) -> Int {
        var buffer: [Int: Int] = [:] /// [1,2,2,5,3,5]  235
        let set = Set(nums)
        for i in set {
            if buffer.count < 3 {
                buffer[i] = i
            } else {
                let item = buffer.minn
                let x = max(item, i)
                buffer.removeValue(forKey: item)
                buffer[x] = x
            }
        }
        let maxx = buffer.values.compactMap { $0 }.sorted()
        return maxx.count == 3 ? maxx.first! : maxx.last!
    }
}

extension Dictionary where Value == Int {
    var minn: Int {
        return values.min()!
    }
}
