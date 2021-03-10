//
//  RandomizedSet.swift
//  Problems
//
//  Created by abuzeid on 15.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class RandomizedSet: XCTestCase {
    class RandomizedSet {
        var dic = [Int: Int]()
        /** Initialize your data structure here. */
        init() {
            dic = [Int: Int]()
        }

        /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
        func insert(_ val: Int) -> Bool {
            if let _ = dic[val] {
                return false
            } else {
                dic[val] = val
                return true
            }
        }

        /** Removes a value from the set. Returns true if the set contained the specified element. */
        func remove(_ val: Int) -> Bool {
            if let key = dic[val] {
                dic.removeValue(forKey: key)
                return true
            }
            return false
        }

        /** Get a random element from the set. */
        func getRandom() -> Int {
            return dic.first!.value
        }
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}
