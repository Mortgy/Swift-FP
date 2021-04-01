//
//  SessionFour.swift
//  Swift FP
//
//  Created by Mortgy on 4/1/21.
//

import Foundation

class SessionFour {
    let ordersForProcessing = [Order]()
    var ordersWithDiscount: [Order] {
        ordersForProcessing.map({
            getOrderWithDiscount(order: $0, rules: getDiscountRules())
        })
    }
    func getOrderWithDiscount(order: Order, rules: [(qualifingCondition: (Order) -> Bool, getDiscount: (Order) -> Double)] ) -> Order {
        let discounts = rules.map ({ qualifingCondition, calculation in
            return qualifingCondition(order) ? calculation(order) : 0.0
        }).filter({ return $0 != 0.0 }).prefix(3)
        
        let discountsSum = discounts.reduce(0.0, +)
        let discount: Double = discountsSum / Double(discounts.count)
        
        var newOrder = order
        newOrder.updateDiscount(discount: discount)
        
        return newOrder
    }
    
    func getDiscountRules() -> [(qualifingCondition: (Order) -> Bool, getDiscount: (Order) -> Double)] {
        let discountRules: [((Order) -> Bool, (Order) -> Double)] = [
            (isAQualified, A),
            (isBQualified, B),
            (isCQualified, C)]
        
        return discountRules
    }
    
    func isAQualified(order: Order) -> Bool {
        true
    }
    
    func A(order: Order) -> Double {
        1.2
    }
    
    func isBQualified(order: Order) -> Bool {
        true
    }
    
    func B(order: Order) -> Double {
        1.2
    }
    
    func isCQualified(order: Order) -> Bool {
        true
    }
    
    func C(order: Order) -> Double {
        1.2
    }
}
