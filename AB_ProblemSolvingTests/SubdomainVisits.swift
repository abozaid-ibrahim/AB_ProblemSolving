//
//  AB_ProblemSolvingTests.swift
//  AB_ProblemSolvingTests
//
//  Created by abuzeid on 14.01.21.
//  Copyright © 2021 ab. All rights reserved.
//

@testable import AB_ProblemSolving
import XCTest

class SubdomainVisits: XCTestCase {
    class Solution {
        func subdomainVisits(_ cpdomains: [String]) -> [String] {
            var dic: [String: Int] = [:]
            for domain in cpdomains {
                let arr = domain.split(separator: " ")
                let visits: Int = Int("\(arr.first!)")!
                var dm = "\(arr.last!)"
                getKeys(&dm).forEach {
                    dic[$0] = visits + (dic[$0] ?? 0)
                }
            }
            return dic.map { return "\($0.value) \($0.key)" }
        }

        func getKeys(_ domain: inout String) -> [String] {
            let count = domain.split(separator: ".").count
            var arr: [String] = []
            for i in 0 ..< count {
                arr.append("\(domain)")
                domain = String(domain.split(separator: ".", maxSplits: 1, omittingEmptySubsequences: false).last!)
            }
            return arr
        }
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}
