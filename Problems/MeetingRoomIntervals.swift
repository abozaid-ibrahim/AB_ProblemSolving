//
//  MeetingRoomIntervals.swift
//  Problems
//
//  Created by abuzeid on 20.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class MeetingRoomIntervals: XCTestCase {
    class Solution {
        func minMeetingRooms(_ intervals: [[Int]]) -> Int {
            let srt = intervals.sorted { $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0] }
            var queue = Set<[Int]>()

            func available(_ h: [Int]) -> Bool {
                if queue.isEmpty { return false }
                let srt = queue.sorted { $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0] }
                let ns = h[0], ne = h[1]
                for i in srt {
                    let start = i[0], end = i[1]
                    guard ns >= start && end <= start else { continue }
                    queue.remove(i)
                    queue.insert([start, ne])
                    return true
                }

                return false
            }
            for i in 0 ..< srt.count {
                let m = srt[i]
                if !available(m) {
                    queue.insert(m)
                }
            }
            return queue.count
        }
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
