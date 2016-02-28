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
        
        let ab = RippleView(frame: CGRectMake(0, 50, 100 ,400))
        self.view.addSubview(ab)
        
        let cd = RippleView(frame: CGRectMake(100, 50, 100 ,400))
        self.view.addSubview(cd)
        
        let ef = RippleView(frame: CGRectMake(200, 50, 100 ,400))
        self.view.addSubview(ef)
    }
}

