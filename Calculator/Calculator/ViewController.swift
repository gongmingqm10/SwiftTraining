//
//  ViewController.swift
//  Calculator
//
//  Created by Ming Gong on 6/12/15.
//  Copyright © 2015 gongmingqm10. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    let calculatorMgr = CalculateMgr()
    
    var lastIsOperator = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clearInput(sender: AnyObject) {
        resultLabel.text = "0"
        lastIsOperator = false
        calculatorMgr.clear()
    }

    @IBAction func oppositeClick(sender: AnyObject) {
        var resultLabelValue = resultLabel.text
        
        if resultLabel.text?.rangeOfString("-") == nil {
            resultLabel.text = "-" + resultLabelValue!
        } else {
            resultLabelValue?.removeAtIndex((resultLabelValue?.startIndex)!)
            resultLabel.text = resultLabelValue
        }
    }
    @IBAction func zeroClick(sender: AnyObject) {
        inputNumber("0")
    }
    
    @IBAction func pointClick(sender: AnyObject) {
        if resultLabel.text?.rangeOfString(".") == nil {
            resultLabel.text = resultLabel.text! + "."
        }
    }
    
    @IBAction func oneClick(sender: AnyObject) {
        inputNumber("1")
    }
    
    @IBAction func twoClick(sender: AnyObject) {
        inputNumber("2")
    }
    
    @IBAction func threeClick(sender: AnyObject) {
        inputNumber("3")
    }
    
    @IBAction func fourClick(sender: AnyObject) {
        inputNumber("4")
    }

    @IBAction func fiveClick(sender: AnyObject) {
        inputNumber("5")
    }
    
    @IBAction func sixClick(sender: AnyObject) {
        inputNumber("6")
    }

    @IBAction func sevenClick(sender: AnyObject) {
        inputNumber("7")
    }
    
    @IBAction func eightClick(sender: AnyObject) {
        inputNumber("8")
    }
    
    @IBAction func nineClick(sender: AnyObject) {
        inputNumber("9")
    }
    
    @IBAction func divideOperatorClick(sender: AnyObject) {
        inputOperator("/")
    }
    
    @IBAction func multiOperatorClick(sender: AnyObject) {
        inputOperator("*")
    }
    
    @IBAction func minusOperatorClick(sender: AnyObject) {
        inputOperator("-")
    }
    
    @IBAction func addOperatorClick(sender: AnyObject) {
        inputOperator("+")
    }
    
    @IBAction func calculateResult(sender: AnyObject) {
        inputOperator("=")
    }
    
    private func inputOperator(input: String) {
        let resultLabelNumber = (resultLabel.text! as NSString).floatValue
        calculatorMgr.pushNumber(resultLabelNumber)
        lastIsOperator = true

        if "=" == input {
            updateLabelText(formatFloatResult(calculatorMgr.calculateResult()))
        } else {
            updateLabelText(formatFloatResult(calculatorMgr.pushOperator(input)))
        }
    }
    
    private func inputNumber(input: String) {
        let resultLabelValue = resultLabel.text
        if lastIsOperator || resultLabelValue == "0" {
            updateLabelText(input)
        } else {
            resultLabel.text = resultLabelValue! + input
        }
        lastIsOperator = false
    }
    
    private func updateLabelText(text: String) {
        resultLabel.fadeOut(completion: {
            (finished: Bool) -> Void in
            self.resultLabel.text = text
            self.resultLabel.fadeIn()
        })
    }
    
    private func formatFloatResult(result: Float) -> String {
        var resultStr = result.description
        if resultStr.endsWith(".0") {
            resultStr.removeCharsFromEnd(2)
        }
        return resultStr
    }
    
}

