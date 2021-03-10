//
//  EqualityEquation.swift
//  AB_ProblemSolvingTests
//
//  Created by abuzeid on 12.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class EqualityEquation: XCTestCase {
    var dic: [String.Element: String.Element] = [:]
    func equationsPossible(_ equations: [String]) -> Bool {
        let eq = equations.map { Array($0) }
        for e in eq {
            dic[e[0]] = e[0]
            dic[e[3]] = e[3]
        }
        for eq in eq where eq[1] == "=" {
            union(eq[0], eq[3])
        }
        for eq in eq where eq[1] == "!" {
            if find(eq[0]) == find(eq[3]) {
                return false
            }
        }

        return true
    }

    func union(_ x: String.Element, _ y: String.Element) {
        let xGroup = find(x)
        let yGroup = find(y)
        for (k, v) in dic {
            if v == xGroup {
                dic[k] = yGroup
            }
        }
    }

    func find(_ c: String.Element) -> String.Element {
        if c == dic[c]! {
            return c
        } else {
            dic[c] = find(dic[c]!)
            return dic[c]!
        }
    }

    func testExample() throws {
        XCTAssertEqual(true, equationsPossible(["x==d", "i==p", "k!=i", "m==c", "w!=a", "c==v", "y==l", "h==t", "m==c", "q!=w", "l==k", "b!=e", "h==x", "n!=b"]))
    }
}
