//
//  CheckMarkRecognizer.swift
//  CheckPlease
//
//  Created by TSS Checkout on 11/25/16.
//  Copyright © 2016 TSS Checkout. All rights reserved.
//

import UIKit
import UIKit.UIGestureRecognizerSubclass

class CheckMarkRecognizer: UIGestureRecognizer {
    private static let minLengthDown = CGFloat(30)
    private static let minLengthUp = CGFloat(50)
    private static let tolerance = CGFloat(16)
    
    private var startPoint = CGPoint.zero
    private var turnPoint: CGPoint! = nil
    var greatestForce = CGFloat(0)
    var maxPossibleForce = CGFloat(0)
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
        
        if let touch = touches.first {
            startPoint = touch.location(in: view)
            turnPoint = nil
            greatestForce = 0
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesMoved(touches, with: event)
        
        if let touch = touches.first {
            let currentPoint = touch.location(in: view)
            let prevPoint = touch.previousLocation(in: view)
            
            if turnPoint == nil {
                let distance = distanceBetweenPoints(first: startPoint, second: currentPoint)
                if (currentPoint.x <= startPoint.x || currentPoint.y <= startPoint.y)
                        && distance > CheckMarkRecognizer.tolerance {
                    state = .failed
                }
                if distance > CheckMarkRecognizer.minLengthDown && currentPoint.x > prevPoint.x
                        && currentPoint.y > prevPoint.y {
                    turnPoint = prevPoint
                }
            } else {
                let distance = distanceBetweenPoints(first: turnPoint, second: currentPoint)
                if currentPoint.x > turnPoint.x && currentPoint.y < turnPoint.y
                        && distance >= CheckMarkRecognizer.minLengthUp {
                    state = .ended
                }
            }
            
            if touch.view?.traitCollection.forceTouchCapability == .available && touch.force > greatestForce {
                greatestForce = touch.force
                maxPossibleForce = touch.maximumPossibleForce
            }
        }
    }
    
    private func distanceBetweenPoints(first: CGPoint, second: CGPoint) -> CGFloat {
        let deltaX = second.x - first.x
        let deltaY = second.y - first.y
        return sqrt(deltaX*deltaX + deltaY*deltaY)
    }
}
