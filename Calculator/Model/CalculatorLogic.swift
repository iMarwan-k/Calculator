//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Marwan Khalawi on 3/12/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number : Double?
    
    private var intermediateCalculation : (n1: Double, calcMethod: String)?
    
    mutating func setNumber (number: Double) {
        self.number = number
    }
    
    
    mutating func performLogic(symbol: String) -> Double?{
        if let n = number {
            switch symbol {
            case "AC":
                intermediateCalculation = nil
                return 0
            case "+/-":
                return n * -1
            case "%":
                return n * 0.01
            default:
                return setTuple(number: n, oper: symbol)
            }
        }
        return nil
    }
    
    mutating private func setTuple(number: Double, oper: String) -> Double?{
        if intermediateCalculation != nil && intermediateCalculation?.calcMethod != "" {
            let result = performTwoNumCalculation(n2: number)
            return result
        } else {
            intermediateCalculation = (n1: number, calcMethod: oper)
        }
        return nil
    }
    
    mutating private func performTwoNumCalculation(n2: Double) -> Double?{
        if let operation = intermediateCalculation?.calcMethod, let n1 = intermediateCalculation?.n1 {
            switch operation {
            case "+":
                let result = n1 + n2
                intermediateCalculation = (n1: result, calcMethod: "")
                return result
            case "-":
                let result = n1 - n2
                intermediateCalculation = (n1: result, calcMethod: "")
                return result
            case "×":
                let result = n1 * n2
                intermediateCalculation = (n1: result, calcMethod: "")
                return result
            case "÷":
                let result = n1 / n2
                intermediateCalculation = (n1: result, calcMethod: "")
                return result
            case "=":
                let result = n2
                intermediateCalculation = (n1: result, calcMethod: "")
                return result
            default:
                fatalError("The Operation doesn't match any case")
            }
        }
        return nil
    }
    
}
