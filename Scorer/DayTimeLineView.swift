//
//  DayTimeLineView.swift
//  Scorer
//
//  Created by conilus on 2/28/16.
//  Copyright © 2016 debussynetwork. All rights reserved.
//

import UIKit
//import ReactKit

class DayTimeLineView: UIView {
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    
    var score: Float = 0
    
    
//    required init(coder aDecoder: NSCoder) {
//        
//    }
//    
//    required override init(frame: CGRect) {
//        self.obj1Stream = KVO.stream(obj1, "value")
//        
//        // bind stream via KVC (`<~` as binding operator)
//        (obj2, "value") <~ self.obj1Stream
//        
//        XCTAssertEqual(obj1.value, "initial")
//        XCTAssertEqual(obj2.value, "initial")
//        
//        obj1.value = "REACT"
//        
//        XCTAssertEqual(obj1.value, "REACT")
//        XCTAssertEqual(obj2.value, "REACT")
//        
//    }
    
    
    
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
        
       // if (view != nil) { (self, "score") <~ KVO.stream(view!, "score") }
        view?.scoreObj.observe { value in
            print("Hi! \(value)")
            self.score = Float(value)
        }
         print("------- begin 2")
        view?.begin((view?.convertPoint(point, fromView: self))!)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("------- move")
       // print("touches \(touches)")
        let point: CGPoint! = touches.first?.locationInView(self)
        let view = lastSubView(point)
        view?.score = score
        view?.move((convertPoint(point, toView: view)))
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("------- end")
        let point: CGPoint! = touches.first?.locationInView(self)
        let view = lastSubView(point)
        view?.end()
    }
}
