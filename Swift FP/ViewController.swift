//
//  ViewController.swift
//  Swift FP
//
//  Created by Mortgy on 4/1/21.
//

import UIKit

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //MARK: - Session 2
        let _ = SessionTwo()
        
        //MARK: - Session 2
        let _ = SessionThree()
        
        //MARK: - Session 3
        let order = Order(orderId: 10, productIndex: 100, unitPrice: 20, quantity: 4)
        let calculator = OrderCalculations(order: order, productType: .food)
        print(calculator.discount)
        
        //MARK: - Session 4

        //MARK: - Session 5
        let _ = SessionFive()
        let _ = SessionFive2()
    }


    
}

