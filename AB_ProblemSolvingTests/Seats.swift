//
//  Seats.swift
//  AB_ProblemSolvingTests
//
//  Created by abuzeid on 11.02.21.
//  Copyright © 2021 ab. All rights reserved.
//

import XCTest

class Seats: XCTestCase {
    func maxDistToClosest(_ seats: [Int]) -> Int {
          // [1,0,0,0,1,0,1]
          var mxStart = 0
          var mxEnd = 0
          var mxw = 0

          var start = -1
          var end = -1

          func setMax() {
              if start == -1 {return}
              let diff = end - start + 1
              var cw = diff
              if start == 0 || end == seats.count - 1 {
                  cw = diff + 2
              }
              if diff >= 0 && cw > mxw {
                  mxStart = start
                  mxEnd = end
                  mxw = cw
                  start = -1
                  end = -1
              }
          }

          for i in 0 ..< seats.count {
              if seats[i] == 1 {
                  setMax()
              } else {
                  if start == -1 {
                      start = i
                      end = i
                      
                  } else {
                      end = i
                  }
              }
             
          }
         
          if seats.last! == 0 {
              setMax()
          }
         
          return mxStart + (mxEnd - mxStart) / 2
      }

    func testExample() throws {
     XCTAssertEqual(2,maxDistToClosest([1,0,0,0,1,0,1]))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
