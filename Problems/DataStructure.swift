//
//  DataStructure.swift
//  Problems
//
//  Created by abuzeid on 21.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import Foundation
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { val = 0; left = nil; right = nil }
    public init(_ val: Int) { self.val = val; left = nil; right = nil }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { val = 0; next = nil }
    public init(_ val: Int) { self.val = val; next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

extension ListNode: Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val
    }
}
