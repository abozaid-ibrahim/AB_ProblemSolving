//
//  BuddyString.swift
//  AB_ProblemSolvingTests
//
//  Created by abuzeid on 18.01.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class BuddyString: XCTestCase {
    func buddyStrings(_ A: String, _ B: String) -> Bool {
        guard A.count == B.count else { return false }
        if A.count > 20000 || B.count > 20000 {
            return false
        }
        if A == B {
            return Set(A).count < B.count
        }
        var a: [Int] = []
        a.reserveCapacity(3)
        let ar = A.map { $0 }
        let br = B.map { $0 }
        
        for i in 0 ..< A.count {
            if a.count > 2 {
                break
            }
            if ar[i] != br[i] {
                a.append(i)
            }
        }
        if a.count == 2 {
            return ar[a[0]] == br[a[1]] && ar[a[1]] == br[a[0]]
        } else {
            return false
        }
    }

    func testExample() throws {
        XCTAssertEqual(buddyStrings("Ab", "ba"), false)
        XCTAssertEqual(buddyStrings("abac", "abad"), false)
    }
}


 public extension String {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
 }
