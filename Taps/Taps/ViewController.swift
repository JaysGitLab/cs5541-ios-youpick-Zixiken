//
//  ViewController.swift
//  Taps
//
//  Created by TSS Checkout on 11/23/16.
//  Copyright © 2016 TSS Checkout. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var singleLabel: UILabel!
    @IBOutlet weak var doubleLabel: UILabel!
    @IBOutlet weak var tripleLabel: UILabel!
    @IBOutlet weak var quadrupleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let single = UITapGestureRecognizer(target: self, action: #selector(singleTap))
        single.numberOfTouchesRequired = 1
        single.numberOfTapsRequired = 1
        view.addGestureRecognizer(single)
        
        let double = UITapGestureRecognizer(target: self, action: #selector(doubleTap))
        double.numberOfTapsRequired = 2
        double.numberOfTouchesRequired = 1
        view.addGestureRecognizer(double)
        single.require(toFail: double)
        
        let triple = UITapGestureRecognizer(target: self, action: #selector(tripleTap))
        triple.numberOfTouchesRequired = 1
        triple.numberOfTapsRequired = 3
        view.addGestureRecognizer(triple)
        double.require(toFail: triple)
        
        let quadruple = UITapGestureRecognizer(target: self, action: #selector(quadrupleTap))
        quadruple.numberOfTapsRequired = 4
        quadruple.numberOfTouchesRequired = 1
        view.addGestureRecognizer(quadruple)
        triple.require(toFail: quadruple)
    }

    func singleTap() {showText(text: "Single tap detected", inLabel: singleLabel)}
    
    func doubleTap() {showText(text: "Double tap detected", inLabel: doubleLabel)}
    
    func tripleTap() {showText(text: "Triple tap detected", inLabel: tripleLabel)}
    
    func quadrupleTap() {showText(text: "Quadruple tap detected", inLabel: quadrupleLabel)}
    
    private func showText(text: String, inLabel: UILabel) {
        inLabel.text = text
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {inLabel.text = ""})
    }
}

