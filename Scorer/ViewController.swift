//
//  ViewController.swift
//  Scorer
//
//  Created by conilus on 2/23/16.
//  Copyright © 2016 debussynetwork. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ab = DayTimeLineView(frame: CGRectMake(0, 50, 100 ,400))
        let ab1 = RippleView(frame: CGRectMake(0, 0, 100, 100))
        let ab2 = RippleView(frame: CGRectMake(0, 100, 100, 100))
        let ab3 = RippleView(frame: CGRectMake(0, 200, 100, 100))
        ab.addSubview(ab1)
        ab.addSubview(ab2)
                ab.addSubview(ab3)
        self.view.addSubview(ab)
        
        let cd = RippleView(frame: CGRectMake(100, 50, 100 ,400))
        self.view.addSubview(cd)
        
        let ef = RippleView(frame: CGRectMake(200, 50, 100 ,400))
        self.view.addSubview(ef)
    }
}

