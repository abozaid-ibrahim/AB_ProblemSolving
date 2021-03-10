//
//  FlowerBed.swift
//  Problems
//
//  Created by abuzeid on 18.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class FlowerBed: XCTestCase {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var x = n
        var visited = Set<Int>()
        for i in 0 ..< flowerbed.count {
            guard flowerbed[i] == 0 else { continue }
            if i == 0 {
                if flowerbed.count == 1 {
                    visited.insert(i)
                    x -= 1
                } else if flowerbed[i + 1] == 0 {
                    visited.insert(i)
                    x -= 1
                }
            } else if i == flowerbed.count - 1 {
                if flowerbed[i - 1] == 0 && !visited.contains(i - 1) {
                    visited.insert(i)
                    x -= 1
                }

            } else if flowerbed[i - 1] == 0 && flowerbed[i + 1] == 0 && !visited.contains(i - 1) {
                visited.insert(i)
                x -= 1
            }

            if x <= 0 {
                break
            }
        }
        return x <= 0
    }

    func testExample() throws {
        XCTAssertEqual(true, canPlaceFlowers([0], 1))
    }
}
