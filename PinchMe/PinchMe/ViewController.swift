//
//  ViewController.swift
//  PinchMe
//
//  Created by TSS Checkout on 11/25/16.
//  Copyright © 2016 TSS Checkout. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    private var imageView: UIImageView!
    private var scale = CGFloat(1)
    private var prevScale = CGFloat(1)
    private var rotation = CGFloat(0)
    private var prevRotation = CGFloat(0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(image: UIImage(named: "yosemite-meadows"))
        imageView.isUserInteractionEnabled = true
        imageView.center = view.center
        view.addSubview(imageView)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(doPinch(gesture:)))
        pinchGesture.delegate = self
        imageView.addGestureRecognizer(pinchGesture)
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(doRotate(gesture:)))
        rotateGesture.delegate = self
        imageView.addGestureRecognizer(rotateGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func transformImageView() {
        let t = CGAffineTransform(scaleX: scale*prevScale, y: scale*prevScale)
        imageView.transform = t.rotated(by: rotation+prevRotation)
    }
    
    func doPinch(gesture: UIPinchGestureRecognizer) {
        scale = gesture.scale
        transformImageView()
        if gesture.state == .ended {
            prevScale = scale*prevScale
            scale = 1
        }
    }
    
    func doRotate(gesture: UIRotationGestureRecognizer) {
        rotation = gesture.rotation
        transformImageView()
        if gesture.state == .ended {
            prevRotation = rotation+prevRotation
            rotation = 0
        }
    }
}
