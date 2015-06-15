//
//  CalculateMgr.swift
//  Calculator
//
//  Created by Ming Gong on 6/12/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import Foundation

struct Stack<T> {
    var items = [T]()
    mutating func push(item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
    func count() -> Int {
        return items.count
    }
    func lastElement() -> T {
        return items.last!
    }
}

class CalculateMgr: NSObject {
    
    var numberStack =  Stack<Float>()
    var operatorStack = Stack<String>()
    var isOperator = false

    func clear() {
        isOperator = false
        numberStack = Stack<Float>()
        operatorStack = Stack<String>()
    }
    
    func pushOperator(item: String) -> Float {
        if isOperator {
            operatorStack.pop()
        }
        operatorStack.push(item)
        isOperator = true
        return 0
    }
    
    func pushNumber(number: Float) {
        isOperator = false
        numberStack.push(number)
    }
    
    func calculateResult() -> Float {
        
        if numberStack.count() == 1 {
            return numberStack.pop()
        }
        
        let firstNumber = numberStack.pop()
        let secondNumber = numberStack.pop()
        let currentOperator = operatorStack.pop()
        let lastOperator = operatorStack.lastElement()

        if isHigherPriority(lastOperator, operatorCompared: currentOperator) {
            let thirdNumber = numberStack.pop()
            let result = expressionCalculate(thirdNumber, rightNumber: secondNumber, operatorStr: operatorStack.pop())
            numberStack.push(result)
            numberStack.push(firstNumber)
            operatorStack.push(currentOperator)
        } else {
            let result = expressionCalculate(secondNumber, rightNumber: firstNumber, operatorStr: currentOperator)
            numberStack.push(result)
        }
        
        return calculateResult()
    }
    
    private func isHigherPriority(operatorStr: String, operatorCompared: String) -> Bool {
        
        return (operatorStr == "*" || operatorStr == "/") && (operatorCompared == "+" || operatorCompared == "-")
    }
    
    private func expressionCalculate(leftNumber: Float, rightNumber: Float, operatorStr: String) -> Float {
        switch operatorStr {
        case "-":
            return leftNumber - rightNumber
        case "*":
            return leftNumber * rightNumber
        case "/":
            return leftNumber / rightNumber
        default:
            return leftNumber + rightNumber
        }
    }
    
    
}