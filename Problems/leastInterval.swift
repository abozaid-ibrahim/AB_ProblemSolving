//
//  TaskScheduler.swift
//  Problems
//
//  Created by abuzeid on 15.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class TaskScheduler: XCTestCase {
    var dic = [Character: Int]()
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        for c in tasks {
            dic[c, default: 0] += 1
        }
        return cycles(n)
    }

    func sum() -> Int {
        return dic.map { $0.value }.reduce(0,+)
    }

    func cycles(_ n: Int) -> Int {
        if sum() <= 0 {
            return 0
        }

        var visited = Set<Character>()
        let sorted = dic.sorted { $0.value > $1.value }[0..<n].map{$0.key}
        
        
        for i in 0 ..< n {
            guard i < sorted.count && !visited.contains(sorted[i]) else { continue }
            visited.insert(sorted[i])
            dic[sorted[i],default: 0] -= 1
        }

        return 1 + cycles(n)
    }

    func testExample() throws {
        leastInterval([], 1)
    }
}
