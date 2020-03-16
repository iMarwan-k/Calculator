//
//  ViewController.swift
//  Calculator
//
//  Created by Marwan on 02/10/2020.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

/*
 Swift Access level
 - private: only with the block score { }
 - fileprivate: only within the file
 - internal: this is the default, and the properties and the methods are accessible anywhere with current app module
 - public: access with other module like with cocoapods.
 - open: everything in public + classed and methods can be overridden
 
 * Good practice when you declare a new var or func mark them with private and level them up as needed
 
 
 Class VS Struct
 - Class can inherent struct can't
 - Class is a reference type struct is a value type
 - Class stored in heap and the reference lives in the stack, struct store in stack
 - Class need initial value or init method, struct initialize properties when new object created (Free initializer)
 - If class obj declared with let it is still mutable, but struck obj if it is declared with let it is immutable
 - Struct: faster, simpler, no memory leak, deep copy, immutable, threadsafe
 - Class: inheritance, works with Objc,
 
 * Good practice: Start with Struct for custom object and level up if you need Class power
 
 Guard let VS if let
 - with a guard let you want to catch the nil and do something with it, but if let just ignor the nil case
 */

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTyping : Bool = true
    
    private var displayValue: Double {
        set {
            displayLabel.text = String(newValue)
        }
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Can't convert displayLabel text to Double")
            }
            return number
        }
    }
    
    private var calcLogic = CalculatorLogic ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func calBtnPressed(_ sender: UIButton) {
        isFinishedTyping = true
        
        calcLogic.setNumber(number: displayValue)
        
        if let calcMethod = sender.currentTitle {
            if let calcResult = calcLogic.performLogic(symbol: calcMethod) {
                displayValue = calcResult
            }
        }
    }
    
    @IBAction func numBtnPressed(_ sender: UIButton) {
        
        if let btnTitle = sender.currentTitle {
            
            if isFinishedTyping {
                displayLabel.text = btnTitle
                isFinishedTyping = false
            } else {
                if btnTitle == "." {
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                
                if !displayLabel.text!.contains(btnTitle) {
                 displayLabel.text! += btnTitle
                }
            }
        }
    }
}

