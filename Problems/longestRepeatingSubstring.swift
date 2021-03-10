//
//  RepeatedString.swift
//  Problems
//
//  Created by abuzeid on 21.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class RepeatedString: XCTestCase {
    func longestRepeatingSubstring(_ S: String) -> Int {
        var left = 1
        var right = S.count / 2
        var last = 0
        while left < right {
            let mid = left + (right - left) / 2
            if hasRepeatedSubString(mid, S) {
                last = left
                left = mid + 1
            } else {
                right = mid
            }
        }
        return last
    }

    func hasRepeatedSubString(_ size: Int, _ s: String) -> Bool {
        for i in 0 ... s.count - size {
            let target = s.subString(from: i, to: i + size)
            let right = s.index(s.endIndex, offsetBy: -i)
            let left = s.index(s.startIndex, offsetBy: i)
            print(target, size)
            print(right, left)
            if s.range(of: target, options: .backwards, range: .init(uncheckedBounds: (lower: right, upper: s.endIndex)), locale: nil) != nil && s.range(of: target, options: .backwards, range: .init(uncheckedBounds: (lower: s.startIndex, upper: left)), locale: nil) != nil {
                return true
            }
        }
        return false
    }

    func testExample() throws {
        XCTAssertEqual(hasRepeatedSubString(3, "anabana"), true)
    }
}
