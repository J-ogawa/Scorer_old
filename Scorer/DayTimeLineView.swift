//
//  DayTimeLineView.swift
//  Scorer
//
//  Created by conilus on 2/28/16.
//  Copyright © 2016 debussynetwork. All rights reserved.
//

import UIKit

class DayTimeLineView: UIView {
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    
    func lastSubView(point: CGPoint) -> RippleView? {
        return (subviews
            .filter { $0.bounds.contains(convertPoint(point, toView: $0)) }
            .last as? RippleView)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("------- begin")
        let point: CGPoint! = touches.first?.locationInView(self)
        print("------- begin 1")
        let view: RippleView? = lastSubView(point)
         print("------- begin 2")
        view?.begin((view?.convertPoint(point, fromView: self))!)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("------- move")
       // print("touches \(touches)")
        let point: CGPoint! = touches.first?.locationInView(self)
        let view = lastSubView(point)
        view?.move((convertPoint(point, toView: view)))
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("------- end")
        let point: CGPoint! = touches.first?.locationInView(self)
        let view = lastSubView(point)
        view?.end()
    }
}
