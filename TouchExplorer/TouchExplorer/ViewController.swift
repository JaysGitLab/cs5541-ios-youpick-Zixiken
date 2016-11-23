//
//  ViewController.swift
//  TouchExplorer
//
//  Created by TSS Checkout on 11/23/16.
//  Copyright © 2016 TSS Checkout. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var taps: UILabel!
    @IBOutlet weak var touches: UILabel!
    @IBOutlet weak var force: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func updateLabelsFromTouches(touch: UITouch?, all: Set<UITouch>?) {
        taps.text = "\(touch?.tapCount ?? 0) taps detected"
        touches.text = "\(all?.count ?? 0) touches detected"
        if traitCollection.forceTouchCapability == .available {
            force.text = "Force: \(touch?.force ?? 0)\nMax Force: \(touch?.maximumPossibleForce ?? 0)"
        } else {
            force.text = "3D touch not available"
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        message.text = "Touches began"
        updateLabelsFromTouches(touch: touches.first, all: event?.allTouches)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        message.text = "Touches ended"
        updateLabelsFromTouches(touch: touches.first, all: event?.allTouches)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        message.text = "Drag detected"
        updateLabelsFromTouches(touch: touches.first, all: event?.allTouches)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        message.text = "Touches cancelled"
        updateLabelsFromTouches(touch: touches.first, all: event?.allTouches)
    }
}

