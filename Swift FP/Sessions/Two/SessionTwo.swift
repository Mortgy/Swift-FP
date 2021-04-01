//
//  SessionTwo.swift
//  Swift FP
//
//  Created by Mortgy on 4/1/21.
//

import Foundation

class SessionTwo {
    
    var myData = [7, 4, 5, 6, 3, 8, 10]
    
    init() {
        print(declarative())
        
        imparative()
    }
    func declarative() -> [Int] {
        myData.map({ $0 + 1}).map({ $0 * $0}).map({ $0 - 10})
    }
    
    func imparative() {
        myData.forEach({  num in
            print(substractTen(x: square(x: addOne(x: num))))
        })
    }
    
    func addOne(x: Int) -> Int{
        x + 1
    }
    
    func square(x: Int) -> Int{
        x * x
    }
    
    func substractTen(x: Int) -> Int {
        x - 10
    }
}
