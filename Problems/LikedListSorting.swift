//
//  LikedListSorting.swift
//  Problems
//
//  Created by abuzeid on 21.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class LikedListSorting: XCTestCase {
    /**
     * Definition for singly-linked list.

     */
    /// 1 2 34
    class Solution {
        func sortList(_ head: ListNode?) -> ListNode? {
            if head == nil || head?.next == nil {
                return head
            }
            // divide
            let mid = getMid(head)
            let left = sortList(head)
            let right = sortList(mid)
            return merge(left, right)
        }

        func getMid(_ head: ListNode?) -> ListNode? {
            var slow: ListNode? = head
            var fast: ListNode? = head
            while fast?.next?.next != nil {
                slow = slow?.next
                fast = fast?.next?.next
            }
            let n = slow?.next
            n?.next = nil
            return n
        }

        func merge(_ left: ListNode?, _ right: ListNode?) -> ListNode? {
            let head = ListNode(-1)
            var tail = head
            var left = left, right = right
            while left != nil || right != nil {
                if (left?.val ?? Int.max) < (right?.val ?? Int.max) {
                    tail.next = ListNode(left!.val)
                    left = left?.next
                } else {
                    tail.next = ListNode(right!.val)
                    right = right?.next
                }
                tail = tail.next!
            }
            return head.next
        }

        /*
          func sortList(_ head: ListNode?) -> ListNode? {
             if head == nil {return nil}
             var output:[Int] = []
             var current = head
             while current != nil{
                 output.append(current!.val)
                 current = current?.next
             }

             let srt = output.sorted()
             let node = ListNode(-1)
             var new = node
             for i in srt{
                  let next = ListNode(i)
                   new.next = next
                   new = next
             }

             return node.next
         }
         */
    }

    func testExample() throws {
        let node = ListNode(3)
        let two = ListNode(5)
        let th = ListNode(4)
        let fr = ListNode(1)
        node.next = fr
        fr.next = th
        th.next = two
//        XCTAssertEqual(fr, Solution().getMid(node))
    }
}
