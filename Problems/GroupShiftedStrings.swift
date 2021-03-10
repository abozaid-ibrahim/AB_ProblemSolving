////
////  GroupShiftedStrings.swift
////  Problems
////
////  Created by abuzeid on 27.02.21.
////  Copyright © 2021 ab. All rights reserved.
////
//
import XCTest
//
// class GroupShiftedStrings: XCTestCase {
//    // bcd: 1, cdf: 1,, yza: 1 za,ca
//    // "abc", "bcd",  "xyz", "az", "ba"
//    func groupStrings(_ strings: [String]) -> [[String]] {
//        var groups = [String: Int]()
//        for (i, s) in strings.enumerated() {
//            let ss = Array(s)
//            for j in i + 1 ..< strings.count {
//                if sv(ss, strings[j]) {
//                    if groups[strings[j]] != nil { continue }
//                    groups[s] = i
//                    groups[strings[j]] = i
//                }
//            }
//        }
//        var output = [[String]](repeating: [String](), count: strings.count)
//        for (k, v) in groups {
//            output[v].append(k)
//        }
////        let xx = output.filter { $0.count >= 2 }
//        return output.filter { $0.count > 0 }
//    }
//
//    func sv(_ s: [Character], _ b: String) -> Bool {
//        guard s.count == b.count else { return false }
//        let bb = Array(b)
//        for i in 1 ..< s.count {
//            if s[i] - s[i - 1] != bb[i] - bb[i - 1] {
//                return false
//            }
//        }
//        return true
//    }
//
//    func testExample() throws {
//        XCTAssertEqual(groupStrings(["abc", "bcd", "acef", "xyz", "az", "ba", "a", "z"]),
//                       [
//                           ["abc", "bcd", "xyz"],
//                           ["az", "ba"],
//                           ["acef"],
//                           ["a", "z"],
//                       ])
//    }
// }
//
// extension Character {
//    static func - (lhs: Character, rhs: Character) -> Int {
//        let a = Character("a").asciiValue!
//        return (Int(lhs.asciiValue!) % a) - Int(rhs.asciiValue!) % a
//    }
// }

func exclusiveTime(_ n: Int, _ logs: [String]) -> [Int] {
    var output = [Int](repeating: 0, count: n)

    let st = logs[0].split(separator: ":")
    var i = 1
    var time = 0
    var stack = [Int(st[0])!]

    while i < logs.count {
        let s = logs[i].split(separator: ":")
        while time < s[2].int {
            time += 1
            output[stack.last!] += 1
        }

        if s[1] == "start" {
            stack.append(s[0].int)
        } else {
            output[s[0].int] += 1
            time += 1
            stack.removeLast()
        }
        i += 1
    }

    return output
}

extension String.SubSequence {
    var int: Int { return Int(self)! }
}

class ExclusiveTime: XCTestCase {
    func test() {
       // exclusiveTime(2, ["0:start:0", "1:start:2", "1:end:5", "0:end:6"])
       // lengthOfLongestSubstringKDistinct("eceba", 2)
    }
}

func lengthOfLongestSubstringKDistinct(_ s: String, _ k: Int) -> Int {
    if s.count == 0 || k == 0 { return 0 }

    var start = 0, end = 0
    var dict: [Character: Int] = [:]
    let arr = Array(s)
    var result = 0
    while end < s.count {
        let val = dict[arr[end]] ?? 0
        if (val > 0) || dict.count < k {
            dict[arr[end], default: 0] += 1
            result = max(result, end - start + 1)
            end += 1
        } else {
            dict[arr[start], default: 0] -= 1
            // if dict[arr[start],default: 0] == 0 {
            //     dict.removeValue(forKey: arr[start])
            // }
            start += 1
        }
    }

    return result
}

class Solution {
    private var acc: [Int]

    init(_ w: [Int]) {
        acc = w
        for i in 1 ..< w.count {
            acc[i] += acc[i - 1]
        }
    }

    func pickIndex() -> Int {
        let rand = Int.random(in: 1 ... acc.last!)

        return find(rand)
    }

    func find(_ target: Int) -> Int {
        var start = 0
        var end = acc.count - 1

        while start < end {
            let mid = (start + end) >> 1
            acc[mid] < target ? (start = mid + 1) : (end = mid)
        }

        return start
    }
}

class WordDictionary {
    class Node {
        var children = [Character: Node]()
        var isWord: Bool { word != nil }
        var word: String?
    }

    /** Initialize your data structure here. */
    var root: Node
    init() {
        root = Node()
    }

    /** Adds a word into the data structure. */
    func addWord(_ word: String) {
        var cur = root
        let chars = Array(word)
        for i in 0 ..< chars.count {
            if cur.children[chars[i]] == nil {
                cur.children[chars[i]] = Node()
            }
            cur = cur.children[chars[i]]!
        }
        cur.word = word
    }

    /** Returns if the word is in the data structure. A word could contain the dot character '.' to represent any one letter. */
    func search(_ word: String) -> Bool {
        return dfs(Array(word), 0, root)
    }

    func dfs(_ array: [Character], _ index: Int, _ node: Node) -> Bool {
        let c = array[index]
        if c != "." { // c = "a"-"z"
            guard let child = node.children[c] else { return false }
            return index == array.count - 1 ? child.isWord : dfs(array, index + 1, child)
        } else { // c == "."
            for (_, child) in node.children {
                if index == array.count - 1 {
                    if child.isWord { return true }
                } else {
                    if dfs(array, index + 1, child) { return true }
                }
            }
            return false
        }
    }
}
