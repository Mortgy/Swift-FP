//
//  SessionFive.swift
//  Swift FP
//
//  Created by Mortgy on 4/1/21.
//

import Foundation

// MARK: - Composition in Swift
precedencegroup CompositionPrecedence {
    associativity: left
}

infix operator >>>: CompositionPrecedence

func >>> <T, U, V>(lhs: @escaping (T) -> U, rhs: @escaping (U) -> V) -> (T) -> V {
    return { rhs(lhs($0)) }
}

// MARK: - Session Five ( Part 1 )
class SessionFive: SessionThree {
    
    override init() {
        super.init()
        let x = test()
        print(x(4))
    }
    
    func test() -> (Double) -> Double {
        {
            return $0 + 1
        }
    }
}

// MARK: - Session Five ( Part 2 )
class SessionFive2: SessionTwo {
    

    override init() {
        super.init()
        
        let myComposedFunction: (Int) -> Int = composeFunction(f1: addOne, f2: square, f3: substractTen)

        myData = [3, 5, 7, 8]
        print(myData.map({ substractTen(x: square(x: addOne(x: $0))) }))
        print(myData.map({ myComposedFunction($0) }))
        print(myData.map({ addOneSquareSubstractTen()($0) }))
    }
    
    
    func composeFunction<T>(f1: @escaping (T) -> T, f2: @escaping (T) -> T, f3: @escaping (T) -> T) -> (T) -> T {
        return {
            return f3(f2( f1($0) ))
        }
    }
    
    func addOneSquareSubstractTen() -> (Int) -> Int {
        
        let q1: (Int) -> Int = addOne
        let q2: (Int) -> Int = square
        let q3: (Int) -> Int = substractTen
        
        return q1 >>> q2 >>> q3
    }
    
}
