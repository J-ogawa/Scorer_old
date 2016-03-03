//
//  RippleView.swift
//  Scorer
//
//  Created by conilus on 2/27/16.
//  Copyright © 2016 debussynetwork. All rights reserved.
//

import UIKit

class RippleView: UIView {
    var symbol: String = ""
    var score: Float = 0.0;
    weak var timer: NSTimer?
    var firstRipple: UIView?
    var lastRipple: UIView?
    var scoreVector: Bool = false

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    required override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }

    func addScore() {
        score += 0.05 * (scoreVector ? (1.0) : (-1.0))
        if score > 1 {
            score = 1
            scoreVector = !scoreVector
        }
        if score < 0 {
            score = 0
            scoreVector = !scoreVector
        }

        firstRipple?.backgroundColor = rippleColor()
    }

    func rippleColor() -> UIColor {
        return UIColor(colorLiteralRed: 1 - score, green: score, blue: 0.0, alpha: 1.0)
    }

//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        begin((touches.first?.locationInView(self))!)
//    }
//
//    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        move((touches.first?.locationInView(self))!)
//    }
//
//    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        end()
//    }

    func begin(point: CGPoint) {
        print("")
        scoreVector = !scoreVector
        firstRipple = generateRipple(point)
        timer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: "addScore", userInfo: nil, repeats: true)
    }

    func move(point: CGPoint) {
        timer?.invalidate()
        generateRipple(point)
    }

    func end() {
         timer?.invalidate()
        self.backgroundColor = rippleColor()
        for subView in self.subviews {
            subView.removeFromSuperview()
        }
        self.firstRipple = nil
        self.lastRipple  = nil
    }

    func generateRipple(point: CGPoint) -> UIView {
        let ripple = UIView(frame: CGRectMake(0, 0, 10, 10))
        ripple.layer.cornerRadius = 5
        ripple.backgroundColor = rippleColor()
        ripple.center = point
        ripple.alpha = 0
        self.addSubview(ripple)

        lastRipple = ripple

        UIView.animateWithDuration(0.4, animations: { () -> Void in
            ripple.transform = CGAffineTransformMakeScale(14.2, 14.2);
            ripple.alpha = 1
            }) { (Bool) -> Void in
//                 if ripple != self.firstRipple && ripple == self.lastRipple {
//                  self.endInput()
//                }
        }
        return ripple
    }
}
