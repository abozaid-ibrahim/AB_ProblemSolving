//
//  Test.swift
//  Problems
//
//  Created by abuzeid on 21.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class Test: XCTestCase {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        // let dic  = [Character:Int]()

        let arr = Array(s)
        let window = p.count
        var output = [Int]()
        let target = p.sorted()
        for (i, ch) in arr.enumerated() {
            guard (i + window) < arr.count else { break }
            if Array(arr[i ..< (i + window)]).sorted() == target {
                output.append(i)
            }
        }
        return output
    }

    func findAnagrams1(_ s: String, _ p: String) -> [Int] {
        var dictP = [Character: Int]()
        var dictS = [Character: Int]()
        var result: [Int] = []
        let s = Array(s)
        let pCount = p.count

        for char in p {
            dictP[char, default: 0] += 1
        }

        for i in 0 ..< s.count {
            // Remove first char in the dictionary
            if i >= pCount {
                let char = s[i - pCount]
                dictS[char] = dictS[char]! > 1 ? dictS[char]! - 1 : nil
            }

            // Find a window of pCount letters to compare
            dictS[s[i], default: 0] += 1

            if dictS == dictP {
                result.append(i - pCount + 1)
            }
        }

        return result
    }

    func testExample() throws {
        XCTAssertEqual(findAnagrams("cbaebabacd", "abc"), [1])
    }
}
