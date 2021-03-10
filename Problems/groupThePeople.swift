//
//  groupThePeople.swift
//  Problems
//
//  Created by abuzeid on 18.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest
func slide(_ left: Int, _ right: Int, _ nums: [Int]) {
    var left = left, right = right
    while left < right {
        let mid = left + (left - right) / 2
        let sum = nums[left] + nums[right] + nums[left+1]
        if sum == 0 {
           // out.insert([nums[left] + nums[right] + nums[mid]].sorted())
            break
        } else if sum < 0 {
            right += 1
        } else {
            right -= 1
        }
    }
}

class groupThePeople: XCTestCase {
    var srt: [[Int]] = []
    func diagonalSort(_ mat: [[Int]]) -> [[Int]] {
        if mat.isEmpty { return [] }
        srt = mat
        sort(0, 0)
        for i in 1 ..< srt.count {
            sort(i, 0)
            sort(0, i)
        }
        return srt
    }

    func sort(_ i: Int, _ j: Int) {
        var r = i
        var c = j
        var k = i
        while k <= srt.count {
            k += 1; r = i; c = j
            while r < srt.count - 1 && c < srt[i].count - 1 {
                if srt[r][c] > srt[r + 1][c + 1] {
                    let temp = srt[r][c]
                    srt[r][c] = srt[r + 1][c + 1]
                    srt[r + 1][c + 1] = temp
                    r += 1; c += 1
                }
            }
        }
    }

    func testExample() throws {
        let input = [[3, 97, 72, 77, 16, 76, 51, 22, 80, 76, 84, 35, 20, 68, 97, 25, 86, 80, 39, 22, 79, 20, 15, 78, 35, 68, 10, 97, 5, 44, 9, 49, 19, 9, 70, 63, 89, 84, 66, 31, 29, 33, 51, 24, 60, 66, 69, 9, 80, 15], [34, 65, 90, 21, 94, 21, 10, 16, 88, 56, 87, 43, 50, 27, 32, 86, 25, 19, 100, 89, 52, 87, 22, 26, 45, 32, 73, 51, 43, 22, 88, 7, 98, 74, 49, 19, 61, 23, 100, 68, 8, 29, 27, 91, 2, 24, 54, 65, 18, 90], [88, 37, 76, 10, 38, 29, 54, 100, 46, 86, 71, 87, 94, 21, 91, 73, 56, 61, 25, 27, 91, 42, 91, 63, 96, 8, 98, 19, 91, 38, 61, 77, 81, 55, 8, 40, 35, 50, 91, 86, 28, 73, 72, 82, 33, 6, 9, 31, 49, 81], [27, 45, 25, 82, 45, 52, 26, 47, 97, 20, 58, 82, 73, 23, 76, 24, 96, 65, 97, 14, 94, 84, 50, 15, 51, 41, 50, 66, 67, 12, 44, 64, 94, 9, 74, 22, 97, 80, 43, 75, 32, 40, 3, 9, 13, 75, 14, 71, 76, 25], [39, 75, 92, 20, 20, 7, 30, 80, 84, 30, 3, 24, 39, 77, 9, 12, 2, 11, 99, 79, 32, 45, 53, 90, 52, 24, 47, 85, 27, 49, 64, 77, 83, 72, 99, 91, 1, 70, 72, 38, 34, 18, 22, 69, 49, 34, 36, 20, 11, 55], [39, 20, 86, 28, 91, 11, 8, 94, 57, 79, 51, 91, 20, 12, 88, 43, 52, 31, 69, 23, 90, 25, 10, 36, 15, 75, 18, 42, 60, 32, 74, 15, 24, 58, 55, 88, 60, 24, 54, 18, 88, 7, 94, 22, 53, 21, 91, 51, 100, 28], [24, 90, 100, 44, 67, 10, 53, 77, 12, 51, 77, 81, 11, 6, 52, 10, 30, 71, 40, 21, 62, 23, 61, 95, 22, 30, 97, 19, 56, 72, 40, 70, 51, 20, 61]]
        XCTAssertEqual(diagonalSort(input), [])
    }
}
