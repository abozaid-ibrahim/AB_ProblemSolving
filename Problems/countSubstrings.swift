//
//  a.swift
//  Problems
//
//  Created by abuzeid on 19.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class countSubstrings: XCTestCase {
    class Solution {
        func countSubstrings(_ s: String) -> Int {
            var count = s.count
            let a = Array(s)
            for i in 0 ..< count {
                find(i, count - 1, a)
            }
            return count + subs
        }

        var subs = 0
        func find(_ s: Int, _ e: Int, _ a: [String.Element]) {
            let mid = e / 2
            let r = e % 2 == 0 ? 0 : 1
            if Array(a[0 ..< mid]) == Array(a[mid + r ... e]).reversed() {
                subs += 1
            }
        }
    }

    func testExample() throws {
//        let x = Heap<Int>(array: [1, 2], sort: { $0 > $1 })
    }
}

import Foundation

//
//  Heap.swift
//  Written for the Swift Algorithm Club by Kevin Randrup and Matthijs Hollemans
//
public struct Heap<T> {
    var nodes = [T]()

    private var orderCriteria: (T, T) -> Bool
    public init(sort: @escaping (T, T) -> Bool) {
        orderCriteria = sort
    }

    public init(array: [T], sort: @escaping (T, T) -> Bool) {
        orderCriteria = sort
        configureHeap(from: array)
    }

    private mutating func configureHeap(from array: [T]) {
        nodes = array
        for i in stride(from: nodes.count / 2 - 1, through: 0, by: -1) {
            shiftDown(i)
        }
    }

    public var isEmpty: Bool {
        return nodes.isEmpty
    }

    public var count: Int {
        return nodes.count
    }

    @inline(__always) internal func parentIndex(ofIndex i: Int) -> Int {
        return (i - 1) / 2
    }

    @inline(__always) internal func leftChildIndex(ofIndex i: Int) -> Int {
        return 2 * i + 1
    }

    /**
     * Returns the index of the right child of the element at index i.
     * Note that this index can be greater than the heap size, in which case
     * there is no right child.
     */
    @inline(__always) internal func rightChildIndex(ofIndex i: Int) -> Int {
        return 2 * i + 2
    }

    public func peek() -> T? {
        return nodes.first
    }

    public mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(nodes.count - 1)
    }

    public mutating func insert<S: Sequence>(_ sequence: S) where S.Iterator.Element == T {
        for value in sequence {
            insert(value)
        }
    }

    public mutating func replace(index i: Int, value: T) {
        guard i < nodes.count else { return }

        remove(at: i)
        insert(value)
    }

    @discardableResult public mutating func remove() -> T? {
        guard !nodes.isEmpty else { return nil }

        if nodes.count == 1 {
            return nodes.removeLast()
        } else {
            // Use the last node to replace the first one, then fix the heap by
            // shifting this new first node into its proper position.
            let value = nodes[0]
            nodes[0] = nodes.removeLast()
            shiftDown(0)
            return value
        }
    }

    /**
     * Removes an arbitrary node from the heap. Performance: O(log n).
     * Note that you need to know the node's index.
     */
    @discardableResult public mutating func remove(at index: Int) -> T? {
        guard index < nodes.count else { return nil }

        let size = nodes.count - 1
        if index != size {
            nodes.swapAt(index, size)
            shiftDown(from: index, until: size)
            shiftUp(index)
        }
        return nodes.removeLast()
    }

    /**
     * Takes a child node and looks at its parents; if a parent is not larger
     * (max-heap) or not smaller (min-heap) than the child, we exchange them.
     */
    internal mutating func shiftUp(_ index: Int) {
        var childIndex = index
        let child = nodes[childIndex]
        var parentIndex = self.parentIndex(ofIndex: childIndex)

        while childIndex > 0 && orderCriteria(child, nodes[parentIndex]) {
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(ofIndex: childIndex)
        }

        nodes[childIndex] = child
    }

    /**
     * Looks at a parent node and makes sure it is still larger (max-heap) or
     * smaller (min-heap) than its childeren.
     */
    internal mutating func shiftDown(from index: Int, until endIndex: Int) {
        let leftChildIndex = self.leftChildIndex(ofIndex: index)
        let rightChildIndex = leftChildIndex + 1

        // Figure out which comes first if we order them by the sort function:
        // the parent, the left child, or the right child. If the parent comes
        // first, we're done. If not, that element is out-of-place and we make
        // it "float down" the tree until the heap property is restored.
        var first = index
        if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
            first = leftChildIndex
        }
        if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
            first = rightChildIndex
        }
        if first == index { return }

        nodes.swapAt(index, first)
        shiftDown(from: first, until: endIndex)
    }

    internal mutating func shiftDown(_ index: Int) {
        shiftDown(from: index, until: nodes.count)
    }
}

// MARK: - Searching

extension Heap where T: Equatable {
    /** Get the index of a node in the heap. Performance: O(n). */
    public func index(of node: T) -> Int? {
        return nodes.firstIndex(where: { $0 == node })
    }

    /** Removes the first occurrence of a node from the heap. Performance: O(n). */
    @discardableResult public mutating func remove(node: T) -> T? {
        if let index = index(of: node) {
            return remove(at: index)
        }
        return nil
    }
}
