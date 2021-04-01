//
//  SessionThree.swift
//  Swift FP
//
//  Created by Mortgy on 4/1/21.
// Higher Order Functions

import Foundation

class SessionThree {
    init() {
        
        let funcList: [(Double) -> Double] = [test1, test2]
        
        print(test2(x: test1(x: 5)))
        print(test1(x: test2(x: 5)))
        
        print(funcList[0](5))
        print(funcList[1](5))
        print(funcList[0](funcList[1](5)))

        print(test3(f: test1, value: 5))
        print(test3(f: test2, value: 5))

    }
    
    func test1(x: Double) -> Double {
        x / 2
    }
    
    func test2(x: Double) -> Double {
        x / 4 + 1
    }
    
    func test3(f: (Double) ->  Double, value: Double) -> Double {
        f(value) + value
    }
    
}
