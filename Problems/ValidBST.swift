//
//  ValidBST.swift
//  Problems
//
//  Created by abuzeid on 24.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class ValidBST: XCTestCase {
    class Solution {
        func isValidBST(_ root: TreeNode?, _ range: ClosedRange<Int> = Int.min ... Int.max) -> Bool {
            guard let nod = root else { return true }
            guard nod.val > range.lowerBound && nod.val < range.upperBound else { return false }
            return isValidBST(nod.left, range.lowerBound ... nod.val) && isValidBST(nod.right, nod.val ... range.upperBound)
        }
    }

    func testExample() throws {
        XCTAssertEqual(CFSocketIsValid(nil), true)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
