//
//  MergeAccounts.swift
//  Problems
//
//  Created by abuzeid on 15.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest
extension String {
    func subString(from: Int, to: Int) -> String {
        let startIndex = index(self.startIndex, offsetBy: from)
        let endIndex = index(self.startIndex, offsetBy: to)
        return String(self[startIndex ..< endIndex])
    }
}

class MergeAccounts: XCTestCase {
    var shortest = ""
    func getShortestUniqueSubstring(arr: [Character], str: String) -> String {
        shortest = str
        match(str, arr, 0, str.count)

        return shortest
    }

    func match(_ str: String, _ arr: [Character], _ left: Int, _ right: Int) {
        guard left < right else {
            return
        }

        if eq(str, arr, left, right) {
            shortest = min(shortest, str[left ..< right].map { "\($0)" }.joined())
        }
        match(str, arr, left + 1, right)
        match(str, arr, left, right - 1)
    }

    func eq(_ str: String, _ arr: [Character], _ left: Int, _ right: Int) -> Bool {
        var founded = true
        arr.forEach {
            founded = founded && str[left ..< right].contains($0)
        }
        return founded
    }

    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        var dic: [String: Set<Int>] = [:]
        for (index, acc) in accounts.enumerated() {
            let name = acc[0]
            for i in 1 ..< acc.count {
                dic["\(name) \(acc[i])", default: Set<Int>()].insert(index)
            }
        }

        var result = [[String]]()

        func merge(_ index: Int) {
            let acount = accounts[index]
            let name = acount[0]
            var val = Set<String>()

            for eml in 1 ..< acount.count {
                for index in dic["\(name) \(acount[eml])"] ?? [] {
                    for e in 1 ..< accounts[index].count {
                        val.insert(accounts[index][e])
                    }
                }
                dic["\(name) \(acount[eml])"] = Set()
                if !val.isEmpty {
                    result.append([name] + Array(val.sorted()))
                }
            }
        }
        for id in 0 ..< accounts.count {
            merge(id)
        }
        return result
    }

    func testExample() throws {
        accountsMerge([["John", "johnsmith@mail.com", "john_newyork@mail.com"], ["John", "johnsmith@mail.com", "john00@mail.com"], ["Mary", "mary@mail.com"], ["John", "johnnybravo@mail.com"]])
    }
}
