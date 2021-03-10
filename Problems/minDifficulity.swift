//
//  minDifficulity.swift
//  Problems
//
//  Created by abuzeid on 02.03.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class minDifficulity: XCTestCase {
    class Solution {
        func minDifficulty(_ jobDifficulty: [Int], _ d: Int) -> Int {
            let jobs = jobDifficulty.count
            var dp = Array(repeating: [Int](repeating: -1, count: jobs), count: d+1)
            let res =  cut(0, d, jobDifficulty, &dp)
            print(dp)
            return res
        }

        func cut(_ i: Int, _ d: Int, _ a: [Int], _ dp: inout [[Int]]) -> Int {
            if d == 1 { return a[i...].max()! }
            if dp[d][i] != -1 {
                return dp[d][i]
            }
            var res = 0
            var mx = 0
            for j in i ..< a.count - d + 1 {
                mx = max(mx, a[j])
                res = min(res, mx + cut(j + 1, d - 1, a, &dp))
            }
            dp[d][i] = res
            return res
        }

        func minDifficulty2(_ jobDifficulty: [Int], _ d: Int) -> Int {
            if jobDifficulty.isEmpty { return 0 }
            if jobDifficulty.count < d { return -1 }
            if d == 1 { return jobDifficulty.max()! }
            if jobDifficulty.count == d {
                return jobDifficulty.reduce(0,+)
            }
            let size = jobDifficulty.count - d + 1
            var ws = Array(repeating: 1, count: d)

            ws[0] = size
            var mxr = Int.max
            for _ in 0 ..< (size - 1) {
                for j in 0 ..< d {
                    var left = 0
                    var result = 0
                    for n in ws {
                        let right = min(left + n, jobDifficulty.count)
                        let window = jobDifficulty[left ..< right]
                        result += minDifficulty(Array(window), 1)
                        left += n
                    }
                    if ws[j] > 1 && (j + 1 < ws.count) {
                        ws[j] -= 1
                        ws[j + 1] += 1
                    }
                    mxr = min(result, mxr)
                }
            }
            return mxr
        }

        func minDifficulty3(_ jobDifficulty: [Int], _ d: Int) -> Int {
            if d == 1 {
                return jobDifficulty.max() ?? -1
            }

            let jobs = jobDifficulty.count
            var dp = [[Int]](repeating: [Int](repeating: 0, count: jobs), count: d)

            for i in stride(from: d - 1, through: 0, by: -1) {
                let lastJob = jobDifficulty.count - (d - i)

                for j in stride(from: lastJob, through: i, by: -1) {
                    if i == d - 1 {
                        dp[i][j] = jobDifficulty[j ... lastJob].max()!
                    } else {
                        var difficulty = Int.min
                        dp[i][j] = Int.max

                        let firstJob = i == 0 ? 0 : j
                        let lastJob = i == 0 ? j : lastJob
                        for k in firstJob ... lastJob {
                            difficulty = max(difficulty, jobDifficulty[k])
                            dp[i][j] = min(dp[i][j], difficulty + dp[i + 1][k + 1])
                        }
                    }
                }
            }

            if let min = dp[0].filter({ $0 > 0 }).min() {
                return min
            }

            return -1
        }
    }

    func testExample() throws {
//        XCTAssertEqual(15, Solution().minDifficulty([7, 1, 7, 1, 7, 1], 3))
        XCTAssertEqual(7, Solution().minDifficulty([6, 5, 4, 3, 2, 1], 2))
    }
}
