//
//  Order.swift
//  Swift FP
//
//  Created by Mortgy on 4/1/21.
//

import Foundation

struct Order {
    let orderId: Int
    let productIndex: Int
    let unitPrice: Double
    let quantity: Double
    var discount: Double?
    
    init(orderId: Int, productIndex: Int, unitPrice: Double, quantity: Double) {
        self.orderId = orderId
        self.productIndex = productIndex
        self.unitPrice = unitPrice
        self.quantity = quantity
    }
    mutating func updateDiscount(discount: Double) {
        self.discount = discount
    }
}

enum ProductType {
    case food
    case beverage
    case material
}

protocol ProductParameters {
    func food(productIndex: Int) ->  (x1: Double, x2: Double)
    func beverage(productIndex: Int) ->  (x1: Double, x2: Double)
    func material(productIndex: Int) ->  (x1: Double, x2: Double)
    var order: Order { get set }
}

class OrderCalculations: ProductParameters {
    
    var order: Order
    var productType: ProductType
    var calculationHandler: (Int)  -> (x1: Double, x2: Double) {
        productType == .food ? food : productType == .beverage ? beverage : material
    }
    
    var discount: Double {
        calculateDiscount(handler: calculationHandler, order: self.order)
    }
    
    init(order: Order, productType: ProductType) {
        self.productType = productType
        self.order = order
        self.order.discount = calculateDiscount(handler: calculationHandler, order: self.order)
    }
    
    func calculateDiscount(handler: (Int)  -> (x1: Double, x2: Double), order: Order) -> Double {
        let parameters = handler(order.orderId)
        return parameters.x1 * order.quantity + parameters.x2 * order.unitPrice
    }
    
    func food(productIndex: Int) -> (x1: Double, x2: Double) {
        (x1: Double(productIndex) / Double(productIndex + 100), x2: Double(productIndex) / Double(productIndex + 300))
    }
    
    func beverage(productIndex: Int) -> (x1: Double, x2: Double) {
        (x1: Double(productIndex) / Double(productIndex + 300), x2: Double(productIndex) / Double(productIndex + 400))
    }
    
    func material(productIndex: Int) -> (x1: Double, x2: Double) {
        (x1: Double(productIndex) / Double(productIndex + 400), x2: Double(productIndex) / Double(productIndex + 700))
    }
}
