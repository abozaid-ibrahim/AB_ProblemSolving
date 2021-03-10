//
//  FindCoins.swift
//  Problems
//
//  Created by abuzeid on 23.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class FindCoins: XCTestCase {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 { return 0 }
       let srt = coins.sorted { $0 > $1 }
        let res = change(srt, amount, 0)
        return res == Int.max ? -1 : res
    }

    var dic: [Int: Int] = [:]
    func change(_ coins: [Int], _ amount: Int, _ c: Int) -> Int {
        if amount == 0 { return c }
        if amount < 0 { return Int.max }
        if let ca = dic[amount] {
            return ca
        }
        var count = Int.max
        for i in 0 ..< coins.count {
            if amount >= coins[i] {
                let res = change(coins, amount - coins[i], c + 1)
                count = min(count, res)
            }
        }
        dic[amount] = count
        return count
    }

    func testExample() throws {
//        XCTAssertEqual(coinChange([2], 3), -1)
//        XCTAssertEqual(coinChange([186,419,83,408],6249), 20)
    
    }
}
