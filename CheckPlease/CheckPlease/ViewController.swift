//
//  ViewController.swift
//  CheckPlease
//
//  Created by TSS Checkout on 11/25/16.
//  Copyright © 2016 TSS Checkout. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let check = CheckMarkRecognizer(target: self, action: #selector(doWork(check:)))
        view.addGestureRecognizer(check)
        imageView.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func doWork(check: CheckMarkRecognizer) {
        imageView.isHidden = false
        if imageView.traitCollection.forceTouchCapability == .available && check.maxPossibleForce > 0 {
            imageView.alpha = CGFloat(check.greatestForce/check.maxPossibleForce)
        } else {
            imageView.alpha = CGFloat(1)
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {self.imageView.isHidden = true})
    }
}

