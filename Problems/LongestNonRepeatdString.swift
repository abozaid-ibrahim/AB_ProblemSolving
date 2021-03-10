//
//  LongestNonRepeatdString.swift
//  Problems
//
//  Created by abuzeid on 24.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class LongestNonRepeatdString: XCTestCase {
//    func lengthOfLongestSubstring(_ s: String) -> Int {
//        var stack = Set<Character>()
//        var mx = 0
//        for c in s {
//            if stack.contains(c) {
//                let x = stack.firstIndex(of: c)!
//                stack = Set(stack[x...])
//            }
//            stack.insert(c)
//            mx = max(mx, stack.count)
//        }
//
//        return mx
//    }
    func lengthOfLongestSubstring1(_ s: String) -> Int {
        var stack: [Character: Int] = [:]
        var mx = 0
        for (i, c) in s.enumerated() {
            if let ind = stack[c] {
                stack = stack.filter { $0.value > ind }
            }
            stack[c] = i
            mx = max(mx, stack.count)
        }
        return mx
    }

    func lengthOfLongestSubstring(_ s: String) -> Int {
        var ans = 0, left = 0
        var index = [Character: Int]()
        for (right, ch) in s.enumerated() {
            left = max(index[ch, default: 0], left)
            ans = max(ans, right - left + 1)
            index[ch] = right + 1
        }
        return ans
    }

    func testExample() throws {
        // XCTAssertEqual(4, lengthOfLongestSubstring("abacdefad"))
        XCTAssertEqual(lengthOfLongestSubstring("abcabcbb"), 3)
    }
}
