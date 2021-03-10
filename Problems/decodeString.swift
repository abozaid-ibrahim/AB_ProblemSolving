//
//  Br.swift
//  Problems
//
//  Created by abuzeid on 19.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class Br: XCTestCase {
    class Solution {
        var stack = [Character]()
        func decodeString(_ s: String) -> String {
            let ar = Array(s)
            for c in s {
                if c == "]" {
                    stack += unbox(ar)
                } else {
                    stack.append(c)
                }
            }
            return String(stack)
        }

        func unbox(_ s: [Character]) -> [Character] {
            var str = ""
            while !stack.isEmpty {
                let c = stack.removeLast()
                if c == "[" {
                    let chars = Array(str)
                    return Array(repeating: chars, count: count()).flatMap { $0 }
                } else {
                    str = "\(c)\(str)"
                }
            }
            return []
        }

        func count() -> Int {
            var n = ""
            while stack.last?.isNumber ?? false {
                n = "\(stack.removeLast())\(n)"
            }
            return Int(n) ?? 1
        }
    }

    func testExample() throws {
     //   XCTAssertEqual("aaaa", Solution().decodeString("a3[a]"))
    }
}
