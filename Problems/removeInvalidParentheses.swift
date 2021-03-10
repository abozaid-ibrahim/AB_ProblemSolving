//
//  removeInvalidParentheses.swift
//  Problems
//
//  Created by abuzeid on 01.03.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class removeInvalidParentheses: XCTestCase {
    class Solution {
        func removeInvalidParentheses(_ s: String) -> [String] {
            let (open, close) = getExtraParenthesCount(s)
            var result = [String]()
            dfs(Array(s), 0, open, close, &result)
            return result
        }

        /// return how many open / close paranthese should be removed
        func getExtraParenthesCount(_ s: String) -> (Int, Int) {
            var left = 0, right = 0
            for ch in s {
                left += ch == "(" ? 1 : 0
                if left == 0 {
                    right += ch == ")" ? 1 : 0
                } else if ch == ")" {
                    left -= 1
                }
            }
            return (left, right)
        }

        func isValid(_ s: [Character]) -> Bool {
            var count = 0
            for char in s {
                if char == "(" {
                    count += 1
                } else if char == ")" {
                    count -= 1
                }
                if count < 0 {
                    return false
                }
            }

            return count == 0
        }

        ///   - start: the index of my progress so far
        ///   - open: how many extra open should be removed to get a valid output
        ///   - close: how many extra close paranthes should be removed to get a valid output
        func dfs(_ s: [Character], _ start: Int, _ open: Int, _ close: Int, _ result: inout [String]) {
            if open == 0 && close == 0 {
                if isValid(s) {
                    return result.append(String(s))
                }
            }
            /// Loop through your string, try to remove one paranthese (open | close) then validate your resutl string
            for i in start ..< s.count {
                if (start != i) && (s[i] == s[i - 1]) { /// to skip proccing two adjacent characters with the same type  )) ((
                    continue
                }
                var tmp = s
                tmp.remove(at: i)
                /// if the current char is closing parenthes and I have extra parenthes
                if s[i] == ")" && close > 0 {
                    dfs(tmp, i, open, close - 1, &result)
                } else if s[i] == "(" && open > 0 {
                    dfs(tmp, i, open - 1, close, &result)
                }
            }
        }
    }
}
