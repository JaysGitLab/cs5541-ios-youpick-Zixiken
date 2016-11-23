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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...5 {
            let vertical = UISwipeGestureRecognizer(target: self, action: #selector(reportVerticalSwipe(recognizer:)))
            vertical.direction = [.up, .down]
            vertical.numberOfTouchesRequired = i
            view.addGestureRecognizer(vertical)
        
            let horizontal = UISwipeGestureRecognizer(target: self, action: #selector(reportHorizontalSwipe(recognizer:)))
            horizontal.direction = [.left, .right]
            horizontal.numberOfTouchesRequired = i
            view.addGestureRecognizer(horizontal)
        }
    }
    
    func reportHorizontalSwipe(recognizer: UIGestureRecognizer) {
        label.text = "\(descriptionForTouchCount(recognizer.numberOfTouches))-finger horizontal swipe detected"
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {self.label.text = ""})
    }
    
    func reportVerticalSwipe(recognizer: UIGestureRecognizer) {
        label.text = "\(descriptionForTouchCount(recognizer.numberOfTouches))-finger vertical swipe detected"
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {self.label.text = ""})
    }
    
    func descriptionForTouchCount(_ touchCount: Int) -> String {
        switch touchCount {
            case 1: return "Single"
            case 2: return "Double"
            case 3: return "Triple"
            case 4: return "Quadruple"
            case 5: return "Quintuple"
            default: return ""
        }
    }
}

