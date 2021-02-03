//
//  UNLock.swift
//  AB_ProblemSolvingTests
//
//  Created by abuzeid on 01.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class UNLock: XCTestCase {
    class Solution {
        typealias Key = [Int]
        func openLock(_ deadends: [String], _ target: String) -> Int {
            let deadEnds = Set(deadends.map { Array($0).map { Int(String($0)) } })
            let target = Array(target).map { Int(String($0)) }
            var queue = [Key]()
            var visited = Set<Key>()
            var level = 0

            queue.append([0, 0, 0, 0])
            visited.insert([0, 0, 0, 0])
            while !queue.isEmpty {
                var nextQueue = [Key]()
                for pkey in queue {
                    if pkey == target { return level } // found target
                    if deadEnds.contains(pkey) { continue } // cannot turn

                    for i in 0 ... 3 {
                        var upVal = pkey
                        upVal[i] = (upVal[i] + 1) % 10
                        var downVal = pkey
                        downVal[i] = (downVal[i] - 1 + 10) % 10

                        if !visited.contains(upVal) && !deadEnds.contains(upVal) {
                            nextQueue.append(upVal)
                            visited.insert(upVal)
                        }
                        if !visited.contains(downVal) && !deadEnds.contains(downVal) {
                            nextQueue.append(downVal)
                            visited.insert(downVal)
                        }
                    }
                }

                queue = nextQueue
                level += 1
            }

            return -1
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
