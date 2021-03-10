//
//  Min.swift
//  Problems
//
//  Created by abuzeid on 09.03.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class MinWindow: XCTestCase {
//    func minWindow(_ S: String, _ T: String) -> String {
//        let S = Array(S)
//        let T = Array(T)
//        var dp = [[Int]](repeating: Array(repeating: -1, count: S.count), count: T.count)
//        for i in 0 ..< S.count {
//            if S[i] == T[0] {
//                dp[0][i] = i
//            } else if i != 0 {
//                dp[0][i] = dp[0][i - 1]
//            }
//        }
//        // mark all start
//
//        for j in 1 ..< T.count {
//            for i in 1 ..< S.count {
//                if S[i] == T[j] {
//                    dp[j][i] = dp[j - 1][i - 1]
//                } else {
//                    dp[j][i] = dp[j][i - 1]
//                }
//            }
//        }
//        var minL = Int.max
//        var res = ""
//        for i in 0 ..< S.count {
//            if dp[T.count - 1][i] >= 0 {
//                if i - dp[T.count - 1][i] + 1 < minL {
//                    minL = i - dp[T.count - 1][i] + 1
//                    res = String(S[dp[T.count - 1][i] ... i])
//                }
//            }
//        }
//
//        return res
//    }

    class Solution {
        func minWindow(_ S: String, _ T: String) -> String {
            if S.isEmpty || T.isEmpty { return "" }
            if S == T { return T }

            let target = Array(S)
            let t = Array(T)
            var mn = S
            var left = 0
            func smallerMatch(_ right: Int) -> Bool {
                var rr = right
                var c = t.count - 1
                while rr > left {
                    guard target[rr] == t[c] else { rr -= 1; continue }
                    c -= 1
                    rr -= 1
                    if c < 0 {
                        let result = String(target[rr ... right])
                        if mn.count > result.count {
                            mn = result
                        }
                        left = rr
                        return true
                    }
                }
                return false
            }
            while left < S.count {
                let ch = target[left]
                guard t[0] == ch else { continue }

                var i = 0
                for right in left ..< target.count {
                    guard target[right] == t[i] else { continue }
                    i += 1
                    guard i == t.count else { continue }
                    let result = String(target[left ... right])
                    if mn.count > result.count {
                        mn = result
                        if mn == T { return mn }
                    }
                    if smallerMatch(right) {
                        break
                    }
                }

                left += 1
            }
            return mn == S ? "" : mn
        }
    }

    func testExample() throws {
    }
}
