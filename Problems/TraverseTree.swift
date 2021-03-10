//
//  TraverseTree.swift
//  Problems
//
//  Created by abuzeid on 06.03.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class TraverseTree: XCTestCase {
    class Solution1 {
        var output = Array(repeating: [(Int, Int)](), count: 2001)
        func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
            visit(0, 0, root)
            return output.filter { !$0.isEmpty }.map {
                sorted($0)
            }
        }

        func sorted(_ ar: [(Int, Int)]) -> [Int] {
            return ar.sorted { $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 < $1.1 }.map { $0.0 }
        }

        func visit(_ r: Int, _ c: Int, _ node: TreeNode?) {
            guard let n = node else { return }
            output[c + 1000].append((n.val, r))
            output[c + 1000] = output[c + 1000]
            visit(r + 1, c - 1, n.left)
            visit(r + 1, c + 1, n.right)
        }
    }

    func testExample() throws {
        Solution().longestOnes([0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1],3)
    }

    class Solution {
        /// O(N* W)
        var mx = 0
        func longestOnes(_ A: [Int], _ K: Int) -> Int {
            if A.isEmpty { return 0 }
            if K == 0 || A.count == 1 {
                if A.count == 1 && K > 0 { return 1 }
                count(A)
            } else {
                var k = K
                var left = 0
                var right = 0
                var temp = A
                while left <= right && right < A.count - 1 {
                    temp[right] = 1
                    k -= 1
                    right += 1
                    if k == 0 {
                        count(temp)
                        temp = A
                        k = K
                        left += 1
                        while left < A.count-1 {
                            if A[left] == 0 {
                                right = min(left + 1, A.count - 1)
                                break
                            }
                            left += 1
                        }
                    }
                }

                count(temp)
            }

            return mx
        }

        func change(_ i: Int, _ k: Int, _ ar: [Int]) {
            if k == 0 || i >= ar.count {
                count(ar)
                return
            }
            if ar[i] == 1 {
                change(i + 1, k, ar)
                return
            }
            var newAr = ar
            newAr[i] = 1
            change(i + 1, k - 1, newAr)
        }

        func count(_ a: [Int]) {
            var c = 0
            for i in a {
                if i == 1 {
                    c += 1
                } else {
                    mx = max(mx, c)
                    c = 0
                }
            }
            mx = max(mx, c)
        }
    }
}
