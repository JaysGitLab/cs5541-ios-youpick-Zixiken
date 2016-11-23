//
//  ViewController.swift
//  Swipes
//
//  Created by TSS Checkout on 11/23/16.
//  Copyright © 2016 TSS Checkout. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    private var startPoint: CGPoint!
    
    private static let minLength = Float(25)
    private static let maxVariance = Float(5)

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {startPoint = touch.location(in: self.view)}
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let current = touch.location(in: self.view)
            let deltaX = fabsf(Float(current.x - startPoint.x))
            let deltaY = fabsf(Float(current.y - startPoint.y))
            
            if deltaX >= ViewController.minLength && deltaY <= ViewController.maxVariance {
                label.text = "Horizontal swipe detected"
                DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {self.label.text = ""})
            } else if deltaY >= ViewController.minLength && deltaX <= ViewController.maxVariance {
                label.text = "Vertical swipe detected"
                DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {self.label.text = ""})
            }
        }
    }
}

