//
//  Problems.swift
//  Problems
//
//  Created by abuzeid on 14.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class wordBreak: XCTestCase {
    var cache = [String: [String]]()
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        return dfs(s, wordDict)
    }

    func dfs(_ target: String, _ wordDict: [String]) -> [String] {
        if target.isEmpty {
            return [""]
        }
        if let value = cache[target] {
            return value
        }

        var result = [String]()

        for word in wordDict {
            guard target.hasPrefix(word) else { continue }
            let res = dfs(String(target.suffix(target.count - word.count)), wordDict)
            for subWordBreak in res {
                if subWordBreak.isEmpty {
                    result.append(word)
                } else {
                    result.append(word + " " + subWordBreak)
                }
            }
        }
        cache[target] = result
        return result
    }

    class Solution {
        func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
            return build(s, wordDict)
        }

        func build(_ t: String, _ d: [String]) -> Bool {
            if t.isEmpty {
                return true
            }
            for s in d {
                guard t.hasPrefix(s) else { continue }
                if build(String(t.suffix(t.count - s.count)), d) {
                    return true
                }
            }

            return false
        }
    }

    func testExample() throws {
    }
}

extension String {
    subscript(_ range: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        let end = index(start, offsetBy: min(count - range.lowerBound,
                                             range.upperBound - range.lowerBound))
        return String(self[start ..< end])
    }

    subscript(_ range: CountablePartialRangeFrom<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        return String(self[start...])
    }
}
