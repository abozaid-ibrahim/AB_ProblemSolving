//
//  ContentView.swift
//  AB_ProblemSolving
//
//  Created by abuzeid on 14.01.21.
//  Copyright © 2021 ab. All rights reserved.
//

import SwiftUI
public extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            print($0)
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
